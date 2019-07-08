package com.web.impl;

import com.services.impl.Ae01Service;
import com.web.support.ControllerSupport;

public class UpdateGroupServlet extends ControllerSupport
{
	public UpdateGroupServlet()
	{
		this.setServices(new Ae01Service());
	}
	@Override
	public String execute() throws Exception
	{
		this.update("updateGroup", "ÐÞ¸Ä");
		this.savePageInstance();
		this.savePageData();
		return "group";
	}

}
