package com.web.impl.group;

import com.services.impl.Ae01ServicesImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: Ⱥ�������Ļ���
 * @author: ��־��
 */
public abstract class GroupServlet extends ControllerSupport
{
	public GroupServlet()
	{	
		this.setServices(new Ae01ServicesImpl());
	}
}
