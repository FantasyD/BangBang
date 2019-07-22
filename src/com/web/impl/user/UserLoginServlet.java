package com.web.impl.user;

import com.services.impl.Ab01ServicesImpl;
import com.services.impl.Ac04ServicesImpl;

public class UserLoginServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		if(this.saveUserPageInstance())
		{
			this.setServices(new Ac04ServicesImpl());
			this.savePageData();
			return "index";
		}
		else 
		{
			return "userLogin";
		}
	}
}
