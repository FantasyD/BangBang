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
			Thread.sleep(3000);
			int num=this.checkInfo();
			System.out.println(num);
			if(num>0)
			{
				this.saveAttribute("emailNum", num);
				break;
			}
		}
		return null;
	}

}
