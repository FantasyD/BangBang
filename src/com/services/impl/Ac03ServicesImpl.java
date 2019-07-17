package com.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;

public class Ac03ServicesImpl extends JdbcServicesSupport
{
	
	public boolean addPlacement() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert ignore into ac03(aac101,aac302,aac303,aac304,aac305) ")
				.append("          values(?,current_timestamp,current_timestamp,1,0) ")
				;
		
		Object[] argsObjects = {
				this.get("aac101")
		};
	
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
	
	
	/**
	 * 该方法用来查询我的帖子
	 */
	public List<Map<String, String>> query() throws Exception
	{
		//还原页面查询条件
		Object aac102 = this.get("qaac102");		//帖子标题 模糊查询
		Object aac103 = this.get("qaac103");		//帖子类型
		Object aab101 = this.get("aab101");		//用户流水号

		
		//定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106,")
				.append("       x.aac105    ")
				.append("  from syscode a,ac01 x,ab01 b")
				.append(" where x.aac103 = a.fcode and a.fname = 'aac103'  ")
				.append("   and x.aab101 = b.aab101 ")
				;
		
		//参数列表
		List<Object> paramList = new ArrayList<Object>();
		//逐一判断查询条件是否录入,拼接AND条件
		if(this.isNotNull(aac102))
		{
			sql.append(" and x.aab102 like ? ");
			paramList.add("%"+aac102+"%");
		}
		if(this.isNotNull(aac103))
		{
			sql.append(" and x.aab103 = ? ");
			paramList.add(aac103);
		}
		if(this.isNotNull(aab101))
		{
			sql.append(" and x.aab101 = ? ");
			paramList.add(aab101);
		}
		sql.append(" and x.is_deleted = 0 ");
		sql.append(" order by x.aac101 ");
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	
	public List<Map<String, String>> queryPlacement() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aac301,x.aac101,x.aac302,x.aac305,b.aab102,x.aac303,b.aab101 ")
				.append("  from ac03 x,ac01 a,ab01 b ")
				.append(" where x.aac101 = a.aac101 and a.aab101 = b.aab101 and a.is_deleted = 0 order by a.aac108 desc ");
		
		return this.queryForList(sql.toString());
	}
	
	public List<Map<String, String>> queryPlacementByState() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106,")
				.append("       x.aac105,b.aab101    ")
				.append("  from syscode a,ac01 x,ab01 b,ac03 c")
				.append(" where x.aac103 = a.fcode and a.fname = 'aac103'  ")
				.append("   and x.aab101 = b.aab101 and c.aac101 = x.aac101 and c.aac305 = 1 and x.is_deleted = 0 order by x.aac108 desc ")
				;
		return this.queryForList(sql.toString());
	}
	
	
	public boolean updatePlacementState() throws Exception 
	{
		StringBuilder sql = new StringBuilder()
				.append("update ac03 set aac305 = ? , aac303 = current_timestamp where aac301 = ?")
				;
		Object[] args = {
				this.get("aac305"),
				this.get("aac301")
		};
		
		return this.executeUpdate(sql.toString(), args)>0;
		
	}
}
