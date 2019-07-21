package com.services.impl;

import java.net.URLDecoder;
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
public class Ab01ServicesImpl extends Ah01ServiceImpl
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
				.append("update ab01 set ")
				;
  		Object aab102 = this.get("aab102");
  		Object aab104 = this.get("aab104");
  		Object aab105 = this.get("aab105");
  		Object aab107 = this.get("aab107");
  		Object aab109 = this.get("aab109");
  		Object aab110 = this.get("aab110");
  		Object aab111 = this.get("aab111");
  		Object aab112 = this.get("aab112");
  		Object aab114 = this.get("aab114");
  		
  		//参数列表
  		List<Object> paramList=new ArrayList<>();
  		//逐一判断查询条件是否录入,拼接AND条件
  		
  		if(this.isNotNull(aab102))
  		{
  			sql.append(" aab102=?,");
  			paramList.add(URLDecoder.decode((String)aab102,"UTF-8"));
  		}
  		if(this.isNotNull(aab104))
  		{
  			sql.append(" aab104=?,");
  			paramList.add(URLDecoder.decode((String)aab104,"UTF-8"));
  		}
  		if(this.isNotNull(aab105))
  		{
  			sql.append(" aab105=?,");
  			paramList.add(URLDecoder.decode((String)aab105,"UTF-8"));
  		}
  		if(this.isNotNull(aab107))
  		{
  			sql.append(" aab107=?,");
  			paramList.add(URLDecoder.decode((String)aab107,"UTF-8"));
  		}
  		if(this.isNotNull(aab109))
  		{
  			sql.append(" aab109=?,");
  			paramList.add(URLDecoder.decode((String)aab109,"UTF-8"));
  		}
  		if(this.isNotNull(aab110))
  		{
  			sql.append(" aab110=?,");
  			paramList.add(URLDecoder.decode((String)aab110,"UTF-8"));
  		}
  		if(this.isNotNull(aab111))
  		{
  			sql.append(" aab111=?,");
  			paramList.add(URLDecoder.decode((String)aab111,"UTF-8"));
  		}
  		if(this.isNotNull(aab112))
  		{
  			sql.append(" aab112=?,");
  			paramList.add(URLDecoder.decode((String)aab112,"UTF-8"));
  		}
  		if(this.isNotNull(aab114))
  		{
  			sql.append(" aab114=?,");
  			paramList.add(URLDecoder.decode((String)aab114,"UTF-8"));
  		}
  		sql.append(" where aab101 = ?");
  		paramList.add(this.get("aab101"));
  		String str = sql.toString();
  		str = str.substring(0, str.lastIndexOf(",")) + str.substring(str.lastIndexOf(",") + 1);
		
		return this.executeUpdate(str, paramList.toArray())>0;
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
		
		if(this.executeUpdate(sql.toString(), args) > 0)
		{
			this.put("aab101", this.get("aab101"));
			this.put("aah102", "0");
			this.put("aah103", "密码修改成功通知");
			this.put("aah104", "您的密码已修改成功！");
			this.sendEmail();
			return true;
		}
		return false;
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
		
		if(this.executeUpdate(sql.toString(), args) > 0)
		{
			this.put("aab101", this.get("aab101"));
			this.put("aah102", "0");
			this.put("aah103", "邮箱设置成功通知");
			this.put("aah104", "您的邮箱已成功重新绑定！");
			this.sendEmail();
			return true;
		}
		return false;
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
		
		if(this.executeUpdate(sql, args) > 0)
		{
			String sql1 = "select aab101 from ab01 where aab108=?";
			Map<String, String> map = this.queryForMap(sql1, this.get("aab108"));
			this.put("aab101", map.get("aab101"));
			this.put("aah102", "0");
			this.put("aah103", "密码重设成功通知");
			this.put("aah104", "您的密码已成功重新设置！");
			this.sendEmail();
			return true;
		}
		return false;
	}
	
	/**
	 * 判断邮箱是否存在
	 * @return
	 * @throws Exception
	 */
	private boolean isEmailExist()throws Exception
	{
		String sql="select a.aab101 from ab01 a where a.aab108=?";
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
		
		String name= URLDecoder.decode((String)this.get("aab110"),"UTF-8");
		Object args[]= {
				URLDecoder.decode((String)this.get("aab102"),"UTF-8"),
				Tools.getMd5(URLDecoder.decode((String)this.get("aab103"),"UTF-8")),
				URLDecoder.decode((String)this.get("aab104"),"UTF-8"),
				URLDecoder.decode((String)this.get("aab107"),"UTF-8"),
				URLDecoder.decode((String)this.get("aab108"),"UTF-8"),
				URLDecoder.decode((String)this.get("aab110"),"UTF-8"),
				100,
				0
		};
		
		if(this.executeUpdate(sql.toString(), args) > 0)
		{
			String sql1 = "select aab101 from ab01 where aab108=?";
			Map<String, String> map = this.queryForMap(sql1, this.get("aab108"));
			this.put("aab101", map.get("aab101"));
			this.put("aah102", "0");
			this.put("aah103", "注册成功通知");
			this.put("aah104", "您的账号已成功注册！");
			this.sendEmail();
			return true;
		}
		return false;
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
	
	
	
	public boolean SendEmail() throws Exception 
	{
		String Email = (String)this.get("aab108");
		Tools.setCode(Email);
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
	public Map<String, String> check()throws Exception
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
				return map;
			}
		}
		return null;	
	}
}
