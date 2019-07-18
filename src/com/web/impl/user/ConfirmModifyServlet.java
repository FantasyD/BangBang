package com.web.impl.user;

public class ConfirmModifyServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("resetPassword", "密码修改成功！", "密码修改失败！");
		return "userLogin";
	}

}
