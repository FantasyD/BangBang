package com.web.impl.user;

import com.services.impl.Ac03ServicesImpl;

public class AdminLoginServlet extends Ab03ControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		if(this.saveAdminPageInstance())
		{
			this.setServices(new Ac03ServicesImpl());
			this.savePageData();
			return "adminPost";
		}
		else 
		{
			return "userLogin";
		}
	}
}
