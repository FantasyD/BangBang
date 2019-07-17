package com.web.impl.email;

import com.services.impl.CheckAh01ServiceImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 确认用户是否存在未读邮件
 * @author: 宁志豪
 */
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
			int num=this.checkInfo();
			if(num>0)
			{
				this.setResponseAttribute("emailNum", String.valueOf(num));
				break;
			}
			Thread.sleep(10*1000);	//睡眠10秒后再查询
		}
		return null;
	}

}
