package com.web.impl.user;

public class ToModifyServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "modifyUser";
	}
}
