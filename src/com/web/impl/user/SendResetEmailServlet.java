package com.web.impl.user;

public class SendResetEmailServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		if(this.update("isEmailExist", "邮件发送成功！", "该邮箱未注册！"))
		{
			this.update("sendEmail", "验证码发送");
		}
		return null;
	}
}
