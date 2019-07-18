package com.web.impl.user;

public class SendResetEmailServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		if(this.CheckEmail("isEmailExist", "邮件发送成功！", "该邮箱未注册！"))
		{
			this.mail();
		}
		return null;
	}
}
