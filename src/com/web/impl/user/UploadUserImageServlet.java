package com.web.impl.user;

public class UploadUserImageServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("uploadUserImage", "�û�ͷ���޸�");
		this.savePageInstance();
		return "userInfo";
	}
}
