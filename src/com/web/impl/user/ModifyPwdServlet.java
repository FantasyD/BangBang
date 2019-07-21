package com.web.impl.user;

public class ModifyPwdServlet extends Ab01ControllerSupport
{
	@Override
	public String execute() throws Exception {
		if(this.update("modifyPassword", "修改成功", "修改失败"))
		{
			this.setResponseAttribute("result", "true");
		}
		else
		{
			this.setResponseAttribute("result", "false");
		}
		return null;
	}
}
