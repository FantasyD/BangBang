package com.web.impl.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.services.impl.Ab01ServicesImpl;
import com.web.support.ControllerSupport;

/**
 * 
 * @ClassName: RegisterServlet.java 
 * @Description: 注册
 *
 * @author: xzc
 */
public class RegisterServlet extends Ab01ControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		if(this.is_receive("addUser","注册成功！","验证码错误，请重新输入！")) 
		{
			return "userLogin";
		}
		else
		{
			return	"register";
		}
	}
}
