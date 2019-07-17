package com.web.support;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.system.tools.Tools;

@WebServlet("*.html")
public class BaseServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String toPath = null; // 跳转的目标页面
		try
		{
			/************************************************************
			 * 解析访问路径,获取目标类的名称
			 ************************************************************/
			// 拦截请求的访问路径
			String uri = request.getRequestURI();
			// 获取资源文件所在的包名
			String firstPackageName = uri.substring(uri.lastIndexOf("/") + 1);
			String packageName = firstPackageName.substring(0, firstPackageName.indexOf("_"));
			// 获取请求资源的主文件名
			String baseName = uri.substring(uri.lastIndexOf("_") + 1).replace(".html", "");

			// 定义变量,描述所有业务控制器的基础包名称
			String basePackageName = "com.web.impl.";
			// 获取控制器的前缀名
			String controllerFirstName = baseName.substring(0, 1).toUpperCase() + baseName.substring(1);

			/***********************************************************
			 * 实例化目标类---业务控制器
			 ***********************************************************/
			// 实例化业务控制器
			BaseController controller = (BaseController) Class
					.forName(basePackageName + packageName + "." + controllerFirstName + "Servlet")
					.newInstance();

			/***********************************************************
			 * 向业务控制器,填充页面数据 i
			 ***********************************************************/
			// 为业务控制器织入DTO切片
			controller.setMapDto(this.createDto(request));
			/***********************************************************
			 * 调用业务控制器的流程控制方法
			 ***********************************************************/
			// 调用流程控制方法
			toPath = controller.execute();
			/***********************************************************
			 * 处理控制器向页面输出的数据 o
			 ***********************************************************/
			// 解析属性
			Map<String, Object> rueqestAttribute = controller.getAttribute();
			Map<String, Object> responseAttribute = controller.getResponseAttribute();
			// 织入属性处理切片
			this.parseRueqestAttribute(request, rueqestAttribute);
			this.parseResponseAttribute(response, responseAttribute);
			// 解析session属性

			// 获取到session
			HttpSession session = request.getSession();
			// 解析session属性
			Map<String, Object> sessionAttribute = controller.getSession_attribute();
			// 织入session属性处理切片
			this.parseSessionAttribute(session, sessionAttribute);
		} catch (Exception ex)
		{
			request.setAttribute("msg", "提示:网络故障!");
			toPath = "Error";
			ex.printStackTrace();
		}
		if (toPath != null)
			request.getRequestDispatcher("/" + toPath + ".jsp").forward(request, response);
	}

	private void parseRueqestAttribute(HttpServletRequest request, Map<String, Object> rueqestAttribute)
	{
		// 1.还原所有的键值对,形成集合
		Set<Map.Entry<String, Object>> entrySet = rueqestAttribute.entrySet();
		// 2.循环集合
		for (Map.Entry<String, Object> entry : entrySet)
		{
			// 3.将map的每个键值对,转换成request的属性
			request.setAttribute(entry.getKey(), entry.getValue());
		}
		// 清除所有的request级属性数据
		rueqestAttribute.clear();
	}


	private void parseResponseAttribute(HttpServletResponse response, Map<String, Object> responseAttribute)throws Exception
	{
		// 1.还原所有的键值对,形成集合
		Set<Map.Entry<String, Object>> entrySet = responseAttribute.entrySet();
		// 2.循环集合
		for (Map.Entry<String, Object> entry : entrySet)
		{
			response.getWriter().write(entry.getValue().toString());
		}
		// 清除所有的request级属性数据
		responseAttribute.clear();
	}
		
	private void parseSessionAttribute(HttpSession session,Map<String,Object> sessionAttribute)
	{
		//1.还原所有的键值对,形成集合
		Set<Map.Entry<String, Object>> entrySet=sessionAttribute.entrySet();
		//2.循环集合
		for(Map.Entry<String, Object> entry:entrySet)
		{
			//3.将map的每个键值对,转换成request的属性
			session.setAttribute(entry.getKey(), entry.getValue());
		}
		//清除所有的request级属性数据
		sessionAttribute.clear();
	}

	/**
	 * DTO切片
	 * 
	 * @param request
	 * @return
	 */
	private Map<String, Object> createDto(HttpServletRequest request)
	{
		Boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart)
		{
			// 1.获取页面数据
			Map<String, String[]> tem = request.getParameterMap();
			int initSize = ((int) (tem.size() / 0.75)) + 1;
			// 2.导出所有键值对,形成键值对集合
			Set<Entry<String, String[]>> entrySet = tem.entrySet();
			// 3.定义数组,表示Enetry的value部分
			String value[] = null;

			// 4.定义DTO容器
			Map<String, Object> dto = new HashMap<>(initSize);
			// 5.循环读取entrySet,获取每个键值对
			for (Entry<String, String[]> entry : entrySet)
			{
				// 获取value部分的数组
				value = entry.getValue();
				// 依据长度判断页面控件的类别
				if (value.length == 1) // 非checkbox类控件
				{
					// 过滤掉页面未填充项目
					if (value[0] != null && !value[0].equals(""))
					{
						dto.put(entry.getKey(), value[0]);
					}
				} else // checkbox类控件
				{
					dto.put(entry.getKey(), value);
				}
			}
			//System.out.println(dto);
			return dto;
		} else
		{
			Map<String, Object> dto = new HashMap<>();
			String path = null;
			try
			{
				// 创建FileItemFactory对象
				FileItemFactory factory = new DiskFileItemFactory();
				// 创建文件上传的处理器
				ServletFileUpload upload = new ServletFileUpload(factory);
				// 解析请求
				List<FileItem> items = upload.parseRequest(request);
				// 迭代出每一个FileItem
				for (FileItem item : items)
				{
					String fileName = item.getFieldName();
					if (item.isFormField())
					{
						// 普通的表单控件
						String value = item.getString("gbk");
						dto.put(fileName, value);
					} else
					{
						// 上传文件的控件
						String RandomName = UUID.randomUUID().toString() + "."
								+ FilenameUtils.getExtension(item.getName());
						if (FilenameUtils.getExtension(item.getName()) == ""
								|| FilenameUtils.getExtension(item.getName()) == null)
						{
							dto.put("imgpath", null);
						} else
						{
							path = request.getServletContext().getRealPath("/upload/");
							item.write(new File(path, RandomName)); // 把上传的文件保存到某个文件中
							path = "upload/" + RandomName;
							dto.put("imgpath", path);
						}
					}
				}
			} catch (Exception e)
			{
				e.printStackTrace();
			}
			return dto;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		this.doGet(request, response);
	}

}
