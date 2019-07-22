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
	
}
