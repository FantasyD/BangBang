package com.web.impl.complain;

public class HandlingUserComplainServlet extends Af01ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("handleUserComplain", "�û��ٱ�����");
		this.savePageData();
		return "adminComplain";
	}

}
