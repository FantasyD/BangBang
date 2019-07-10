package com.web.impl;

import com.services.impl.Ae02ServiceImpl;
import com.web.support.ControllerSupport;

public abstract class GroupMemberServlet extends ControllerSupport
{
	public GroupMemberServlet()
	{
		System.out.println("into");
		this.setServices(new Ae02ServiceImpl());
	}
}
