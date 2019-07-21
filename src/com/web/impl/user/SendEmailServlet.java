package com.web.impl.user;

public class SendEmailServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		if(!this.update("isEmailExist", "邮箱已被注册！", "邮件发送成功！"))
		{
			this.update("SendEmail", "验证码发送");
			this.setResponseAttribute("result", "true");
		}
		else
		{
			this.setResponseAttribute("result", "false");
		}
		return null;
	}
}
