package com.web.impl.user;

public class UserLoginServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		if(this.saveUserPageInstance())
		{
			return "userIndex";
		}
		else 
		{
			return "userLogin";
		}
	}
}
