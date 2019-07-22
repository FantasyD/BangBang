package com.web.impl.user;

public class SearchUserServlet extends Ab01ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "users";
	}
}
