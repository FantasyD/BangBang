package com.web.impl.group;

import com.services.impl.Ae03ServicesImpl;
import com.web.support.ControllerSupport;

public class FindMyGroupServlet extends ControllerSupport
{
	public FindMyGroupServlet()
	{
		this.setServices(new Ae03ServicesImpl());
	}
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "myGroups";
	}

}
