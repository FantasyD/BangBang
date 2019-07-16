package com.web.impl.email;

import com.services.impl.CheckAh01ServiceImpl;
import com.web.support.ControllerSupport;

public class CheckEmailServlet extends ControllerSupport
{
	public CheckEmailServlet()
	{
		this.setServices(new CheckAh01ServiceImpl());
	}
	@Override
	public String execute() throws Exception
	{
		while(true)
		{
			Thread.sleep(10*1000);	//Ë¯Ãß10ÃëºóÔÙ²éÑ¯
			int num=this.checkInfo();
			if(num>0)
			{
				this.setResponseAttribute("emailNum", String.valueOf(num));
				break;
			}
		}
		return null;
	}

}
