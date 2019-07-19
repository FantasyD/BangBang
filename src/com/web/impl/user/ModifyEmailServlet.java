package com.web.impl.user;

public class ModifyEmailServlet extends Ab01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.is_receive("modifyEmail", "邮箱修改成功！", "邮箱修改失败！");
		this.savePageInstance();
		return "userCenter";
	}
}
