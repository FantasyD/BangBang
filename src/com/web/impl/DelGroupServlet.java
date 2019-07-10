package com.web.impl;

/**
 * @Description: 群组创建者解散群组
 * @author: 宁志豪
 */
public class DelGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("delGroup", "解散");
		return "addbutton";
	}
}
