package com.web.impl.user;

public class UserDetailsServlet extends Ab01ControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "userShow";
	}

}
