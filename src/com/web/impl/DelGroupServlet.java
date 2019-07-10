package com.web.impl;

public class DelGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("delGroup", "Ω‚…¢");
		return "addbutton";
	}
}
