package com.web.impl.email;

import java.sql.Time;

import com.services.impl.CheckAh01ServicesImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: 确认用户是否存在未读邮件
 * @author: 宁志豪
 */
public class CheckEmailServlet extends ControllerSupport
{
	public CheckEmailServlet()
	{
		this.setServices(new CheckAh01ServicesImpl());
	}
	@Override
	public String execute() throws Exception
	{
		/**
		 * 持有浏览器发来的询问，
		 * 当发现数据更新时返回信息，
		 * 否则一直持有直到超时
		 */
		while(true)
		{
			int num=this.checkInfo();
			if(num>0)
			{
				//控制浮动显示
				this.setResponseAttribute("emailNum", String.valueOf(num));
				//控制链接提示
				this.saveSession_attribute("emailNum", String.valueOf(num));
				break;
			}
			Thread.sleep(10*1000);	//睡眠10秒后再查询
		}
		return null;
	}

}
