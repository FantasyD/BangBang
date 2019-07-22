package com.web.impl.group;

import com.services.impl.Ae02ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class MyGroupsServlet extends ControllerSupport
{
	public MyGroupsServlet()
	{
		this.setServices(new Ae02ServicesImpl());
	}
}
