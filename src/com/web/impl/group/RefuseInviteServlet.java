package com.web.impl.group;

public class RefuseInviteServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("refuseInvite", "�ܾ�");
		return null;
	}

}
