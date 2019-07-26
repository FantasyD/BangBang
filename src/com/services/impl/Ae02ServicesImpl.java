package com.services.impl;

import java.util.List;
import java.util.Map;

public class Ae02ServicesImpl extends Ah01ServicesImpl
{
	
	public List<Map<String,String>> query()throws Exception
	{
		String sql="select ae02.aae101,aae102,aae103,aae105 from ae01,ae02 where ae01.aae101=ae02.aae101 and ae02.aab101=?";
		return this.queryForList(sql, this.get("aab101"));
	}
	
	/**
	 * @Description: 从群组信息表和群组用户表中删除所有有关该群组的记录
	 * @throws：sql语句执行出错
	 */
	public boolean delGroup()throws Exception
	{
//		if(!this.batchSendEmail())
//		{
//			return false;
//		}
		String sql1="delete from ae02 where aae101=?";
		Object id=this.get("aae101");
		this.appendSql(sql1, id);
		String sql="delete from ae01 where aae101=?";
		this.appendSql(sql, id);
		return this.executeTransaction();
	}
	
	/**
	 * @Description: 查询用户操作的群组是否被删除
	 * @return:1表示群组存在，0表示群组已被删除
	 * @throws: sql语句执行出错
	 */
	public int isExist()throws Exception
	{
		String sql="select aae101 from ae01 where aae101=?";
		return this.queryForList(sql, this.getIdList("aae101")).size();
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
	
}
