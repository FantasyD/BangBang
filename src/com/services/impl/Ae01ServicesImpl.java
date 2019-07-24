package com.services.impl;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;
import com.system.tools.Tools;

/**
 * @Description: 对于群组模块所需的数据库操作支持
 * @author: 宁志豪
 */
public class Ae01ServicesImpl extends Ah01ServicesImpl
{
	
	/**
	 * @Description: 新建群组，将用户在新建群组表中填写的信息写入群组信息表和群组用户表
	 * @throws：SQL执行出错
	 */
	public boolean addGroup()throws Exception
	{
		StringBuilder sb=new StringBuilder()
				.append("insert into ae01(aae101,aab101,aae102,aae103,aae104,")
				.append("								 aae106,aae107)")
				.append("		 values (?,?,?,?,?,CURRENT_DATE,?) ")
				;
		Object state[]= {Tools.getSequence("aae101")};
		this.put("aae101", state[0]);
		Object idlist[]= {state[0],this.get("aab101"),this.get("aae102"),this.get("aae103"),Tools.getEmpNumber("group")};
		Object id=this.get("aae107");
		this.appendBatch(sb.toString(),idlist, id);
		
		String sql="insert into ae02(aae101,aab101,aae202) values(?,?,CURRENT_DATE)";		
		this.appendBatch(sql, state, this.get("aab101"));
		return this.executeTransaction();
	}

	/**
	 * @Description: 根据用户流水号查询群组信息
	 * @throws：sql语句执行出错
	 */
	public Map<String, String> findById()throws Exception
	{
		String  sql="select aae101,aab101,aae102,aae103,aae104,aae105,aae107 from ae01 where aae101=?";
		Object id=this.get("aae101");
		return this.queryForMap(sql, id);
	}
	
	/**
	 * @Description: 根据群组流水号查询该组内的所有组员
	 * @throws：sql语句执行出错
	 */
	public List<Map<String, String>> query() throws Exception
	{
		String sql = "select b.aab101,b.aab102,b.aab115 from ab01 b,ae02 e where b.aab101=e.aab101 and aae101=?";
		Object id = this.get("aae101");
		return this.queryForList(sql, id);
	}

	/**
	 * @Description: 更新群组信息表
	 * @throws：sql语句执行出错
	 */
	public boolean  updateGroup()throws Exception
	{
		if(this.get("imgpath")!=null) 
		{
			String sql="update ae01 set aae102=?,aae103=?,aae105=?,aae107=? where aae101=?";
			Object para[]= {
					this.get("aae102"),
					this.get("aae103"),
					this.get("imgpath"),
					this.get("aae107"),
					this.get("aae101")
					};
			return this.executeUpdate(sql, para)>0;
		}
		else
		{
			String sql="update ae01 set aae102=?,aae103=?,aae107=? where aae101=?";
			Object para[]= {
					this.get("aae102"),
					this.get("aae103"),
					this.get("aae107"),
					this.get("aae101")
					};
			return this.executeUpdate(sql, para)>0;
		}
		
	}
	
	/**
	 * @Description: 从群组成员表中删除该退出或被剔除组员信息
	 * @throws：sql语句执行出错
	 */
	public boolean quitGroup()throws Exception
	{
		String sql="delete from ae02 where aae101=? and aab101=?";
		Object idlist[]= {this.get("aae101"),this.get("aa")};
		return this.executeUpdate(sql, idlist)>0;
	}
	
	/**
	 * @Description: 更改群组信息表中的创建者信息
	 * @throws：sql语句执行出错
	 */
	public boolean transferGroup()throws Exception
	{
		String sql="update ae01 set aab101=? where aae101=?";
		Object states[]= {this.get("aab101"),this.get("aae101")};
		
		return this.executeUpdate(sql, states)>0;
	}
	
	/**
	 * @Description: 用户接受邀请后将数据插入群组用户表
	 * @throws：sql语句出错
	 */
	public int acceptInvite()throws Exception
	{
		String sql2="update ah02 set aah204=1 where aah201=?";
		this.executeUpdate(sql2, this.get("aah201"));
		String str="select aae201 from ae02 where aae101=? and aab101=?";
		Object states[]= {this.get("aae101"),this.get("aab101")};
		if(this.queryForList(str, states).size()>0)
		{
			//返回用户已在群组中
			return 0;
		}
		String s="select aae101 from ae01 where aae101=?";
		if(this.queryForList(s, this.get("aae101")).size()==0)
		{
			//返回该群组已被解散
			return 2;
		}
		String sql="insert into ae02(aae101,aab101,aae202) values(?,?,CURRENT_DATE)";
		//返回成功进入群组
		return this.executeUpdate(sql, states);
	}
	
	/**
	 * @Description: 拒绝邀请时向用户发送邮件
	 * @return:返回结果描述
	 * @throws: sql语句执行出错
	 */
	public boolean refuseInvite()throws Exception
	{
		//更新用户对邮件的操作
		String sql="update ah02 set aah204=2 where aah201=?";
		if(this.executeUpdate(sql, this.get("aah201"))==0)
		{
			return false;
		};
		String sql1="select aab102 from ab01 where aab101=?";
		String name=this.queryForMap(sql1, this.get("aa")).get("aab102");
		
		this.put("aah102", "0");
		this.put("aah103", "邀请通知");
		this.put("aah104", "用户"+name+"拒绝了您的入群邀请");
		return this.sendEmail();
	}
	
	/**
	 * @Description: 邀请用户进入用户
	 * @throws: sql语句执行出错
	 */
	public boolean inviteGroup()throws Exception
	{
		String aah103=URLDecoder.decode((String) this.get("aah103"),"UTF-8");
		String aah104=URLDecoder.decode((String) this.get("aah104"),"UTF-8");
		this.put("aah103", aah103);
		this.put("aah104", aah104);
		
		return this.sendEmail();
	}
	
}
