package com.web.impl.complain;

public class HandleComplainStateServlet extends Af01ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("updateComplainState", "�ٱ�����");
		this.savePageData();
		return "adminComplain";
	}

}
