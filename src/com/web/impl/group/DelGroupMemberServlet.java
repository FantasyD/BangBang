package com.web.impl.group;

/**
 * @Description: 群组创建者删除某一组员
 * @author: 宁志豪
 */
public class DelGroupMemberServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("quitGroup", "删除");
		this.savePageInstance();
		this.savePageDataForDelete();
		return "group";
	}
}
