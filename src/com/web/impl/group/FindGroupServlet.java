package com.web.impl.group;

import com.services.impl.Ae01ServicesImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: ��ѯȺ����Ϣ
 * @author: ��־��
 */
public class FindGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.savePageInstance();
		this.savePageData();
		return "groupDetail";
	}

}
