package com.web.impl.user;

public class ModifyEmailServlet extends Ab01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		if(this.is_receive("modifyEmail"))
		{
			this.setResponseAttribute("result", "true");
		}
		else
		{
			this.setResponseAttribute("result", "false");
		}
		return null;
	}
}
