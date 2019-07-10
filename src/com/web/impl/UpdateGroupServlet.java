package com.web.impl;

import com.services.impl.Ae01ServiceImpl;
import com.web.support.ControllerSupport;

public class UpdateGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("updateGroup", "ÐÞ¸Ä");
		this.savePageInstance();
		this.savePageData();
		return "group";
	}

}
