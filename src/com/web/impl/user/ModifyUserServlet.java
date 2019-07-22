package com.web.impl.user;

import com.services.impl.Ab01ServicesImpl;
import com.web.support.ControllerSupport;

/**
 *@Description:用户修改信息
 *@author xzc
 */
public class ModifyUserServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		if(this.update("modifyUser"))
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
