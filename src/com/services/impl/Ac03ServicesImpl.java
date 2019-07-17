package com.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;

public class Ac03ServicesImpl extends JdbcServicesSupport
{
	public List<Map<String, String>> query() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106, ")
				.append("		c.aac302,c.aac303,c.aac305,c.aac301,x.aac105, ")
				.append("		b.aab101   ")
				.append("  from syscode a,ac01 x,ab01 b,ac03 c ")
				.append(" where x.aac103 = a.fcode and a.fname = 'aac103'   ")
				.append("  	and x.aab101 = b.aab101 and c.aac101 = x.aac101    ")
				.append("   and x.is_deleted = 0 order by x.aac108 desc");
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
