package com.web.impl.chat;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.services.impl.Ad01ServicesImpl;


@WebServlet("/ChatAjax.jsp")
public class ChatDynamicData extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=GBK");
		request.setCharacterEncoding("GBK");
		String aab101 = request.getParameter("aab101");
		PrintWriter out = response.getWriter();
		Ad01ServicesImpl services = new Ad01ServicesImpl();
		List<Map<String, String>> list = null;
		try {
			list = services.query(aab101);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String str = null;
		if(list.size() == 0)
		{
			str = "数据已删除或无法访问";
		}
		else
		{
			str = list.toString().replaceAll(":", "-");
			str = str.replaceAll("=", ":");
			str = str.replaceAll(", ", "','");
			str = str.replaceAll(":", "':'");
			str = str.replaceAll("\\{", "\\{'");
			str = str.replaceAll("}", "'}");
			str = str.replaceAll("}','", "},");
		}
		out.println(str);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}

}
