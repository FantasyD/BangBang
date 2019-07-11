package com.web.impl.email;

import com.services.impl.GetAh01ServiceImpl;
import com.web.support.ControllerSupport;

public class UpdateEmailServlet extends ControllerSupport
{
	public UpdateEmailServlet()
	{
		this.setServices(new GetAh01ServiceImpl());
	}
	@Override
	public String execute() throws Exception
	{
		this.update("updateEmail", "×´Ì¬ÐÞ¸Ä");
		return null;
	}
	
}
