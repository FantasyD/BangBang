package com.web.impl.user;

import com.services.impl.Ab01ServicesImpl;
import com.web.support.ControllerSupport;

public class UserCenterServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "userCenter";
	}
}
