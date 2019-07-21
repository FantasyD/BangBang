package com.web.impl.group;

import com.services.impl.Ae01ServiceImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 查询群组信息
 * @author: 宁志豪
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
