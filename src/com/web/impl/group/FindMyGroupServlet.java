package com.web.impl.group;

import com.services.impl.Ac03ServicesImpl;
import com.web.support.ControllerSupport;

public class FindMyGroupServlet extends ControllerSupport
{
	public FindMyGroupServlet()
	{
		this.setServices(new Ac03ServicesImpl());
	}
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "myGroups";
	}

}
