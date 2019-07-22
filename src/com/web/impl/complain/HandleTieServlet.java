package com.web.impl.complain;

public class HandleTieServlet extends Af01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "HandleTie";
	}
}
