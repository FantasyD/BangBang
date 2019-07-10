package com.web.impl;

import com.services.impl.Ae01ServiceImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 新建群组
 * @author: 宁志豪
 */
public class NewGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("addGroup", "创建");
		this.savePageInstance();
		this.savePageData();
		return "group";
	}
}
