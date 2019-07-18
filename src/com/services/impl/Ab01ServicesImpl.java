package com.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;
import com.sun.xml.internal.bind.v2.runtime.ElementBeanInfoImpl;
import com.system.mail.MailUtil;
import com.system.talk.Users;
import com.system.tools.Tools;

/**
 * 
 * @Description: 对ab01表的操作
 * @author: xzc
 */
public class Ab01ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * 
	 * @Description: 完善个人信息
	 * @return
	 * @throws Exception
	 */
	private boolean modifyUser()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("update ab01 a")
				.append("   set a.aab102=?,a.aab105=?,a.aab109=?,a.aab111=?,a.aab112=?,")
				.append("       a.aab114=?,a.aab115=?")
				.append(" where a.aab101=?")
				;
		Object args[]= {
				this.get("aab102"),
				this.get("aab105"),
				this.get("aab109"),
				this.get("aab111"),
				this.get("aab112"),
				this.get("aab114"),
				this.get("aab115"),
				this.get("aab101")
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	/**
	 * 
	 * @Description: 修改密码
	 * @return
	 * @throws Exception
	 */
	private boolean modifyPassword()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				.append("update ab01 a")
				.append("   set a.aab103=?")
				.append(" where a.aab101=?")
				.append("   and a.aab103=?")
				;
		Object args[]= {
				Tools.getMd5(this.get("Naab103")),
				this.get("aab101"),
				Tools.getMd5(this.get("aab103"))
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	/**
	 *
	 * @Description: 修改邮箱
	 * @return
	 * @throws Exception
	 */
	private boolean modifyEmail()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				.append("update ab01 a")
				.append("   set a.aab108=?")
				.append(" where a.aab101=?")
				;
		Object args[]= {
				this.get("aab108"),
				this.get("aab101")
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	
	
	/**
	 * 
	 * @Description	忘记密码后的重设密码
	 * @return
	 * @throws Exception
	 */
	private boolean resetPassword()throws Exception
	{
		String sql = "update ab01 a set a.aab103=? where a.aab108=?";
		
		Object args[] = {
			Tools.getMd5(this.get("aab103")),
			this.get("aab108")
		};
		
		return this.executeUpdate(sql, args)>0;
	}
	
	/**
	 * 判断邮箱是否存在
	 * @return
	 * @throws Exception
	 */
	private boolean isEmailExist()throws Exception
	{
		String sql="select a.aab108 from ab01 a where a.aab108=?";
		return this.queryForMap(sql, this.get("aab108")) != null;
	}
	
	/**
	 * 
	 * @Description: 用户注册
	 * @return
	 * @throws Exception
	 */
	private boolean addUser()throws Exception
	{
		//注册
		StringBuilder sql=new StringBuilder()
				.append("insert into ab01(aab102,aab103,aab104,aab107,aab108,")
				.append("				  aab110,aab113,is_onLine)")
				.append("            values(?,?,?,?,?,")
				.append("					?,?,?)")
				;
		Object args[]= {
				this.get("aab102"),
				Tools.getMd5(this.get("aab103")),
				this.get("aab104"),
				this.get("aab107"),
				this.get("aab108"),
				this.get("aab110"),
				100,
				0
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	/**
	 * 进入个人主页查询
	 */
	public Map<String, String> findById() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab102,a.aab103,a.aab104,a.aab105,a.aab107,")
				.append("       a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
				.append("       a.aab113,a.aab114,a.aab115,a.is_onLine")
				.append("   from ab01 a")
				.append("  where a.aab101=?");
		
		return this.queryForMap(sql.toString(), this.get("aab101"));
	}
	
	
	
	public boolean sendEmail() throws Exception 
	{
		String Email = (String)this.get("aab108");
		MailUtil.email(Email, Users.verification_code.get(Email));
		return true;
	}
	
	public boolean receiveEmail()throws Exception
	{
		String Email = (String)this.get("aab108");
		String code = (String) this.get("ver");
		return code != null && Users.verification_code.get(Email) != null
				&& Users.verification_code.get(Email).equals(this.get("ver"));
	}
	
	/**
	 * 登录查询
	 */
	public String check()throws Exception
	{
		String sql=null;
		if(((String)this.get("userID")).contains("@")) 
		{
			sql="select a.aab101,a.aab103 from ab01 a where a.aab108=?";
		}
		else 
		{
			sql="select a.aab101,a.aab103 from ab01 a where a.aab107=?";
		}
		Map<String, String> map = this.queryForMap(sql,this.get("userID"));
		if(map!=null)
		{
			if(map.get("aab103").equals(Tools.getMd5(this.get("aab103"))))
			{
				return map.get("aab101");
			}
		}
		return null;	
	}
}
