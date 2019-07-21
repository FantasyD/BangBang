package com.web.impl.group;

import com.services.impl.Ae01ServicesImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 群组管理类的基类
 * @author: 宁志豪
 */
public abstract class GroupServlet extends ControllerSupport
{
	public GroupServlet()
	{	
		this.setServices(new Ae01ServicesImpl());
	}
}
