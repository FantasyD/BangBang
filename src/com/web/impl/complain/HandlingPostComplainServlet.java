package com.web.impl.complain;

public class HandlingPostComplainServlet extends Af01ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("handleTieComplain", "�û�����ɾ��");
		this.savePageData();
		return "adminComplain";
	}

}
