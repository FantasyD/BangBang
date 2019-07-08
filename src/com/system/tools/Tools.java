package com.system.tools;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.system.db.DBUtils;

public class Tools
{

	public static void main(String[] args)
	{
		try
		{
			String aab103 = Tools.getEmpNumber("E");
			System.out.println(aab103);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private Tools()
	{
	}

	/**
	 * 获取员工流水号
	 * 
	 * @return String number="yyyy"+4位流水码
	 * @throws Exception
	 */
	public static String getEmpNumber(String name) throws Exception
	{
		return Tools.getCurrentYear() + Tools.getFormatNumber(name);
	}

	private static final String baseCode1 = "0000";

	/**
	 * 获取格式化的尾码
	 * 
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static String getFormatNumber(String firstName) throws Exception
	{
		// 1.获取流水号
		int lastNumber = Tools.getNumnberForYear(firstName);
		// 2.计算流水号的宽度
		int size = String.valueOf(lastNumber).length();

		return baseCode1.substring(size) + lastNumber;

	}

	/**
	 * 获取员工编号的尾码
	 * 
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static int getNumnberForYear(String firstName) throws Exception
	{
		PreparedStatement pstm1 = null;
		PreparedStatement pstm2 = null;
		ResultSet rs = null;
		try
		{
			// 1.定义SQL语句查询当前值
			StringBuilder sql1 = new StringBuilder().append("select a.pkid ")
					.append("  from sequence a ")
					.append("  where date_format(a.sdate,'%Y')=date_format(current_date,'%Y')")
					.append("    and a.pkname=?");
			pstm1 = DBUtils.prepareStatement(sql1.toString());
			pstm1.setObject(1, firstName);
			rs = pstm1.executeQuery();

			int currentVal = 0;
			StringBuilder sql2 = new StringBuilder();
			if (rs.next())
			{
				currentVal = rs.getInt(1);
				sql2.append("update sequence ").append("   set pkid=?")
						.append(" where date_format(sdate,'%Y')=date_format(current_date,'%Y')")
						.append("   and pkname=?");
			} else
			{
				sql2.append("insert into sequence(pkid,pkname,sdate)")
						.append("              values(?,?,current_date)");
			}
			pstm2 = DBUtils.prepareStatement(sql2.toString());
			pstm2.setObject(1, ++currentVal);
			pstm2.setObject(2, firstName);
			pstm2.executeUpdate();

			return currentVal;
		} finally
		{
			DBUtils.close(rs);
			DBUtils.close(pstm1);
			DBUtils.close(pstm2);
		}

	}

	/**
	 * 获取年码
	 * 
	 * @return
	 */
	private static String getCurrentYear()
	{
//		//实例化日期格式类
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
//		//获取系统当前日期
//		Date d=new Date();
//		//格式化当前日期
//		String str_date=sdf.format(d);
//		return str_date;

		return new SimpleDateFormat("yyyy").format(new java.util.Date());
	}

	/**
	 * 将数组连接成字符串
	 * 
	 * @param element
	 * @return
	 */
	public static String joinArray(Object element)
	{
		// 空值拦截
		if (element == null || element.equals(""))
		{
			return "";
		}

		// 判断element到底是什么?是字符串还是字符串数组
		if (element instanceof java.lang.String[])
		{
			// 将参数转换成字符串数组
			String arr[] = (String[]) element;
			// 计算数组长度
			int len = arr.length;
			// 构造动态字符串对象,装载数组的每个元素
			StringBuilder tem = new StringBuilder(arr[0]);
			// 循环读取数组的后继元素
			for (int i = 1; i < len; i++)
			{
				tem.append(",").append(arr[i]);
			}
			return tem.toString();
		} else
		{
			return element.toString();
		}

	}

	/**
	 * 创建数据传输对象
	 * 
	 * @param request
	 * @return
	 */
	public static Map<String, Object> createDto(HttpServletRequest request)
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
		// System.out.println(dto);
		return dto;
	}
<<<<<<< HEAD
	
	 /**
	  * 获取主键值 
	  * @param pkname
	  * @return
	  * @throws Exception
	  */
    public static int getSequence(String pkname)throws Exception
    {
   	 PreparedStatement pstm1=null;    //查询序列的当前值
   	 PreparedStatement pstm2=null;    //修改序列的当前值
   	 ResultSet rs=null;
   	 try
   	 {
   		 //定义SQL语句,查询序列的当前值
   		 String sql1="select a.pkvalue from sequence a where a.pkname=?";
   		 //编译SQL1
   		 pstm1=DBUtils.prepareStatement(sql1);
   		 //参数赋值
   		 pstm1.setObject(1, pkname);
   		 //执行查询
   		 rs=pstm1.executeQuery();
   		 
   		 //定义序列当前值
   		 int currentVal=0;
   		 //判断数据库中,是否存在当前列的值
   		 if(rs.next())
   		 {
   			 //读取数据库当前值,为序列赋值
   			 currentVal=rs.getInt(1);
   			 
   			 //修改数据中的值,在原来基础上+1
   			 String sql2="update sequence set pkvalue=? where pkname=?";
   			 pstm2=DBUtils.prepareStatement(sql2);
   			 pstm2.setObject(1, ++currentVal);
   			 pstm2.setObject(2, pkname);
   			 pstm2.executeUpdate();
   			 
   		 }
   		 else
   		 {
   			 //向数据库录入当前主键的数据,pkvalue值为1
   			 String sql2="insert into sequence(pkname,pkvalue) values(?,?)";
   			 pstm2=DBUtils.prepareStatement(sql2);
   			 pstm2.setObject(1, pkname);
   			 pstm2.setObject(2, ++currentVal);
   			 pstm2.executeUpdate();
   		 }	 
   		 
   		 return currentVal;
   		 
   	 }
   	 finally
   	 {
   		 DBUtils.close(rs);
   		 DBUtils.close(pstm1);
   		 DBUtils.close(pstm2);
   	 }
    }
    
	/**
	 * 该方法用来上传图片文件并且存储到本地服务器
	 * @param req
	 * @return
	 * @throws Exception
	 */
	public static String uploadImg(HttpServletRequest req) throws Exception
	{
		req.setCharacterEncoding("utf-8"); 
        //解析和检查请求，是否是post方式，是否是二进制流格式
        Boolean isMultipart=ServletFileUpload.isMultipartContent(req);
        if (!isMultipart) {
            return null; //如果不是就不用上传了
        }
        String path = null;
        try {
 
            //创建FileItemFactory对象
            FileItemFactory factory=new DiskFileItemFactory();
            //创建文件上传的处理器
            ServletFileUpload upload=new ServletFileUpload(factory);
            //解析请求
            List<FileItem> items=upload.parseRequest(req);
            //迭代出每一个FileItem
            for (FileItem item : items) {
                String fileName = item.getFieldName();
                if (item.isFormField()) {
                    //普通的表单控件
                    String value = item.getString("utf-8");
                    System.out.println(fileName + "->" + value);
                } else {
                    //上传文件的控件
                    String RandomName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(item.getName());
                    System.out.println(fileName + "->" + FilenameUtils.getName(item.getName())); //一个的标签的name，一个是文件的name
                    path=req.getServletContext().getRealPath("/upload/");
                    System.out.println(path);
                    item.write(new File(path, RandomName)); //把上传的文件保存到某个文件中
                    path = "upload/" + RandomName;
                }
            }   
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return path;
	}
=======

	/**
	 * 获取主键值
	 * 
	 * @param pkname
	 * @return
	 * @throws Exception
	 */
	public static int getSequence(String pkname) throws Exception
	{
		PreparedStatement pstm1 = null; // 查询序列的当前值
		PreparedStatement pstm2 = null; // 修改序列的当前值
		ResultSet rs = null;
		try
		{
			// 定义SQL语句,查询序列的当前值
			String sql1 = "select a.pkvalue from sequence a where a.pkname=?";
			// 编译SQL1
			pstm1 = DBUtils.prepareStatement(sql1);
			// 参数赋值
			pstm1.setObject(1, pkname);
			// 执行查询
			rs = pstm1.executeQuery();

			// 定义序列当前值
			int currentVal = 0;
			// 判断数据库中,是否存在当前列的值
			if (rs.next())
			{
				// 读取数据库当前值,为序列赋值
				currentVal = rs.getInt(1);

				// 修改数据中的值,在原来基础上+1
				String sql2 = "update sequence set pkvalue=? where pkname=?";
				pstm2 = DBUtils.prepareStatement(sql2);
				pstm2.setObject(1, ++currentVal);
				pstm2.setObject(2, pkname);
				pstm2.executeUpdate();

			} else
			{
				// 向数据库录入当前主键的数据,pkvalue值为1
				String sql2 = "insert into sequence(pkname,pkvalue) values(?,?)";
				pstm2 = DBUtils.prepareStatement(sql2);
				pstm2.setObject(1, pkname);
				pstm2.setObject(2, ++currentVal);
				pstm2.executeUpdate();
			}

			return currentVal;

		} finally
		{
			DBUtils.close(rs);
			DBUtils.close(pstm1);
			DBUtils.close(pstm2);
		}
	}

>>>>>>> 1ebd64df54eb58524fa2bf5e96076f6af8366ea5
}
