package com.web.impl;

import com.services.impl.Ae01ServiceImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 修改群组信息
 * @author: 宁志豪
 */
public class UpdateGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("updateGroup", "修改");
		this.savePageInstance();
		this.savePageData();
		return "group";
	}

}
