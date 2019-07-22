package com.web.impl.user;

public class UploadUserImageServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("uploadUserImage", "用户头像修改");
		this.savePageInstance();
		return "userInfo";
	}
}
