package com.services.impl;

import com.services.JdbcServicesSupport;

public class Ac02ServicesImpl extends JdbcServicesSupport
{
	public boolean addComment() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert into ac02(aab101,aac101,aac202,aac203,is_deleted) ")
    			.append("          values(?,?,current_timestamp,?,0) ")
				;
		
		Object[] argsObjects = {
				this.get("aab101"),
				this.get("aac101"),
				this.get("aac203")
		};
	
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
	
	
	public boolean delByIdComment() throws Exception
	{
		String sql = "update ac02 set is_deleted = 1 where aac201 = ?";
		return this.executeUpdate(sql, this.get("aac201"))>0;
	}
}
