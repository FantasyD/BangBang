package com.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;
import com.system.tools.Tools;

/**
 * @Description: 对于群组模块所需的数据库操作支持
 * @author: 宁志豪
 */
public class Ae01ServiceImpl extends Ah01ServiceImpl
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
		Object idlist[]= {state[0],"1",this.get("aae102"),this.get("aae103"),Tools.getEmpNumber("group")};
		Object id=this.get("aae107");
		this.appendBatch(sb.toString(),idlist, id);
		
		String sql="insert into ae02(aae101,aab101,aae202) values(?,?,CURRENT_DATE)";		
		id="1";
		this.appendBatch(sql, state, id);
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
	public List<Map<String,String>> query()throws Exception
	{
		String sql="select b.aab101 ab101,b.aab102 ab102 from ab01 b,ae02 e where b.aab101=e.aab101 and aae101=?";
		Object id=this.get("aae101");		
		return this.queryForList(sql, id);
	}
	
	/**
	 * @Description: 更新群组信息表
	 * @throws：sql语句执行出错
	 */
	public boolean  updateGroup()throws Exception
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
	
	/**
	 * @Description: 从群组成员表中删除该退出或被剔除组员信息
	 * @throws：sql执行出错
	 */
	public boolean quitGroup()throws Exception
	{
		String sql="delete from ae02 where aae101=? and aab101=?";
		Object idlist[]= {this.get("aae101"),this.get("aab101")};
		boolean tag=this.executeUpdate(sql, idlist)>0;
		return tag;
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
	public boolean acceptInvite()throws Exception
	{
		String sql="insert into ae02(aae101,aab101,aae202) values(?,?,CURRENT_DATE)";
		Object states[]= {this.get("aae101"),this.get("aab101")};
		return this.executeUpdate(sql, states)>0;
	}
	
	/**
	 * @Description: 检测被邀请用户是否已经在群组内
	 * @throws: sql语句执行出错
	 */
	public boolean inviteGroup()throws Exception
	{
		String sql="select aab101 from ae02 where aab101=? and aae101=?";
		Object states[]= {this.get("iaab101"),this.get("aae101")};
		return !(this.queryForMap(sql, states)!=null);
	}
	
	/**
	 * @Description: 从群组信息表和群组用户表中删除所有有关该群组的记录
	 * @throws：sql语句执行出错
	 */
	public boolean delGroup()throws Exception
	{
		String sql1="delete from ae02 where aae101=?";
		Object id=this.get("aae101");
		this.appendSql(sql1, id);
		String sql="delete from ae01 where aae101=?";
		this.appendSql(sql, id);
		return this.executeTransaction();
	}

}
