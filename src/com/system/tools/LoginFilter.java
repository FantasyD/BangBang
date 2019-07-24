package com.system.tools;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("*.jsp")
public class LoginFilter extends HttpServlet implements Filter 
{
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		String uID=(String)session.getAttribute("userId");
		String aID=(String)session.getAttribute("adminId");
		String path=req.getRequestURI();
		if (path.contains("userLogin")) 
		{
			chain.doFilter(request, response);
			return;
		}
		if (isNull(uID)&&isNull(aID)) 
		{
			res.sendRedirect("/BangBang/userLogin.jsp");
		}
		else {
			chain.doFilter(request, response);
		}
		
	}
	
	private boolean isNull(Object obj)
	{
		if(obj==null||"".equals(obj))
		{
			return true;
		}
		return false;
	}

	public void init(FilterConfig fConfig) throws ServletException 
	{
	}

}
