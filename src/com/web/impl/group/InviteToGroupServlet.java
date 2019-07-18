package com.web.impl.group;

import com.services.impl.Ae01ServiceImpl;
import com.services.impl.Ah01ServiceImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 邀请其他用户进入群组
 * @author: 宁志豪
 */
public class InviteToGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("sendEmail", "邀请");
		this.savePageInstance();
		this.savePageData();
		return "group";
	}

}
