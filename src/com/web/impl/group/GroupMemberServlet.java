package com.web.impl.group;

import com.services.impl.Ae03ServicesImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 
 * @author: ��־��
 */
public abstract class GroupMemberServlet extends ControllerSupport
{
	public GroupMemberServlet()
	{
		this.setServices(new Ae03ServicesImpl());
	}
}
