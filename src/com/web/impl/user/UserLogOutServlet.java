package com.web.impl.user;

import com.services.impl.Ac04ServicesImpl;

public class UserLogOutServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.logOut();
		return "userLogin";
	}
}