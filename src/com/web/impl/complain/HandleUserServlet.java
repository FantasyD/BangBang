package com.web.impl.complain;

public class HandleUserServlet extends Af01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "HandleUser";
	}
}
