package com.web.impl.user;

public class SendEmailServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		if(!this.CheckEmail("isEmailExist", "邮箱已被注册！", "邮件发送成功！"))
		{
			this.mail();
		}
		return null;
	}
}
