package com.web.impl.complain;

public class ComplainAddServlet extends Af01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		if(this.update("addComplain", "�ٱ��ɹ�", "�ٱ�ʧ��"))
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
