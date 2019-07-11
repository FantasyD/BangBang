package com.web.impl;

import com.services.impl.Ae01ServiceImpl;
import com.services.impl.Ah01ServiceImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 邀请其他用户进入群组
 * @author: 宁志豪
 */
public class InviteToGroupServlet extends ControllerSupport
{
	public InviteToGroupServlet()
	{
		 this.setServices(new Ah01ServiceImpl(new Ae01ServiceImpl(),"aah107","aae101"));
	}
	@Override
	public String execute() throws Exception
	{
		this.update("sendEmail", "邀请");
		this.savePageInstance();
		this.savePageData();
		return "group";
	}

}
