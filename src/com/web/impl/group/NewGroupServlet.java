package com.web.impl.group;

import com.services.impl.Ae01ServicesImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: �½�Ⱥ��
 * @author: ��־��
 */
public class NewGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("addGroup", "����");
		this.savePageInstance();
		this.savePageData();
		return "groupDetail";
	}
}
