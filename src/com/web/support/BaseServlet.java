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
		String toPath = null; // ��ת��Ŀ��ҳ��
		try
		{
			/************************************************************
			 * 			��������·��,��ȡĿ���������
			 ************************************************************/
			// ��������ķ���·��
			String uri = request.getRequestURI();
			// ��ȡ��Դ�ļ����ڵİ���
			String firstPackageName = uri.substring(uri.lastIndexOf("/") + 1);
			String packageName = firstPackageName.substring(0, firstPackageName.indexOf("_"));
			// ��ȡ������Դ�����ļ���
			String baseName = uri.substring(uri.lastIndexOf("_") + 1).replace(".html", "");

			// �������,��������ҵ��������Ļ���������
			String basePackageName = "com.web.impl.";
			// ��ȡ��������ǰ׺��
			String controllerFirstName = baseName.substring(0, 1).toUpperCase() + baseName.substring(1);

			/***********************************************************
			 * ʵ����Ŀ����---ҵ�������
			 ***********************************************************/
			// ʵ����ҵ�������
			BaseController controller = (BaseController) Class
					.forName(basePackageName + packageName + "." + controllerFirstName + "Servlet")
					.newInstance();

			/***********************************************************
			 * ��ҵ�������,���ҳ������ i
			 ***********************************************************/
			// Ϊҵ�������֯��DTO��Ƭ
			controller.setMapDto(this.createDto(request));
			/***********************************************************
			 * ����ҵ������������̿��Ʒ���
			 ***********************************************************/
			// �������̿��Ʒ���
			toPath = controller.execute();
			/***********************************************************
			 * �����������ҳ����������� o
			 ***********************************************************/
			// ��������
			Map<String, Object> rueqestAttribute = controller.getAttribute();
			Map<String, Object> responseAttribute = controller.getResponseAttribute();
			// ֯�����Դ�����Ƭ
			this.parseRueqestAttribute(request, rueqestAttribute);
			this.parseResponseAttribute(response, responseAttribute);
			// ����session����

			// ��ȡ��session
			HttpSession session = request.getSession();
			// ����session����
			Map<String, Object> sessionAttribute = controller.getSession_attribute();
			// ֯��session���Դ�����Ƭ
			this.parseSessionAttribute(session, sessionAttribute);
		} catch (Exception ex)
		{
			request.setAttribute("msg", "��ʾ:�������!");
			toPath = "Error";
			ex.printStackTrace();
		}
		if (toPath != null)
			request.getRequestDispatcher("/" + toPath + ".jsp").forward(request, response);
	}

	private void parseRueqestAttribute(HttpServletRequest request, Map<String, Object> rueqestAttribute)
	{
		// 1.��ԭ���еļ�ֵ��,�γɼ���
		Set<Map.Entry<String, Object>> entrySet = rueqestAttribute.entrySet();
		// 2.ѭ������
		for (Map.Entry<String, Object> entry : entrySet)
		{
			// 3.��map��ÿ����ֵ��,ת����request������
			request.setAttribute(entry.getKey(), entry.getValue());
		}
		// ������е�request����������
		rueqestAttribute.clear();
	}

	private void parseResponseAttribute(HttpServletResponse response, Map<String, Object> responseAttribute)throws Exception
	{
		// 1.��ԭ���еļ�ֵ��,�γɼ���
		Set<Map.Entry<String, Object>> entrySet = responseAttribute.entrySet();
		// 2.ѭ������
		for (Map.Entry<String, Object> entry : entrySet)
		{
			response.getWriter().write(entry.getValue().toString());
		}
		// ������е�request����������
		responseAttribute.clear();
	}
		
	private void parseSessionAttribute(HttpSession session,Map<String,Object> sessionAttribute)
	{
		//1.��ԭ���еļ�ֵ��,�γɼ���
		Set<Map.Entry<String, Object>> entrySet=sessionAttribute.entrySet();
		//2.ѭ������
		for(Map.Entry<String, Object> entry:entrySet)
		{
			session.removeAttribute(entry.getKey());
			//3.��map��ÿ����ֵ��,ת����request������
			session.setAttribute(entry.getKey(), entry.getValue());
		}
		//������е�request����������
		sessionAttribute.clear();
	}

	/**
	 * DTO��Ƭ
	 * 
	 * @param request
	 * @return
	 */
	private Map<String, Object> createDto(HttpServletRequest request)
	{
		Boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart)
		{
			// 1.��ȡҳ������
			Map<String, String[]> tem = request.getParameterMap();
			int initSize = ((int) (tem.size() / 0.75)) + 1;
			// 2.�������м�ֵ��,�γɼ�ֵ�Լ���
			Set<Entry<String, String[]>> entrySet = tem.entrySet();
			// 3.��������,��ʾEnetry��value����
			String value[] = null;

			// 4.����DTO����
			Map<String, Object> dto = new HashMap<>(initSize);
			// 5.ѭ����ȡentrySet,��ȡÿ����ֵ��
			for (Entry<String, String[]> entry : entrySet)
			{
				// ��ȡvalue���ֵ�����
				value = entry.getValue();
				// ���ݳ����ж�ҳ��ؼ������
				if (value.length == 1) // ��checkbox��ؼ�
				{
					// ���˵�ҳ��δ�����Ŀ
					if (value[0] != null && !value[0].equals(""))
					{
						dto.put(entry.getKey(), value[0]);
					}
				} else // checkbox��ؼ�
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
				// ����FileItemFactory����
				FileItemFactory factory = new DiskFileItemFactory();
				// �����ļ��ϴ��Ĵ�����
				ServletFileUpload upload = new ServletFileUpload(factory);
				// ��������
				List<FileItem> items = upload.parseRequest(request);
				// ������ÿһ��FileItem
				for (FileItem item : items)
				{
					String fileName = item.getFieldName();
					if (item.isFormField())
					{
						// ��ͨ�ı��ؼ�
						String value = item.getString("gbk");
						dto.put(fileName, value);
					} else
					{
						// �ϴ��ļ��Ŀؼ�
						String RandomName = UUID.randomUUID().toString() + "."
								+ FilenameUtils.getExtension(item.getName());
						if (FilenameUtils.getExtension(item.getName()) == ""
								|| FilenameUtils.getExtension(item.getName()) == null)
						{
							dto.put("imgpath", null);
						} else
						{
							path = request.getServletContext().getRealPath("/upload/");
							item.write(new File(path, RandomName)); // ���ϴ����ļ����浽ĳ���ļ���
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
