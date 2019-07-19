package com.web.impl.group;

/**
 * @Description: 邀请其他用户进入群组
 * @author: 宁志豪
 */
public class InviteToGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("inviteGroup", "邀请");
		this.savePageInstance();
		this.savePageData();
		return "groupDetail";
	}

}
