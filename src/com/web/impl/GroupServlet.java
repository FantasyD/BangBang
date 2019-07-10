package com.web.impl;

import com.services.impl.Ae01ServiceImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 群组管理类的基类
 * @author: 宁志豪
 */
public abstract class GroupServlet extends ControllerSupport
{
	public GroupServlet()
	{	
		this.setServices(new Ae01ServiceImpl());
	}
}
