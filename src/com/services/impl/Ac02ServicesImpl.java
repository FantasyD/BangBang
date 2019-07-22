package com.services.impl;

import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;
import com.system.tools.Tools;

public class Ac02ServicesImpl extends Ah01ServicesImpl
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
		
		this.put("aah202", "/BangBang/tiezi_findByIdTiezi.html?aac101="+Tools.getSequenceWithoutAdd("aac101"));
		this.sendEmail();
	
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
	
	
	public boolean delByIdComment() throws Exception
	{
		String sql = "update ac02 set is_deleted = 1 where aac201 = ?";
		return this.executeUpdate(sql, this.get("aac201"))>0;
	}
	
	
	public List<Map<String, String>> query() throws Exception
	{
		//定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select x.aac201,b.aab102 cnaab102,x.aac101,x.aac202,x.aac203,b.aab115 imgpath ")
				.append("  from ac02 x,ab01 b ")
				.append(" where x.aab101 = b.aab101 and x.is_deleted = 0 and x.aac101 = ?")
				;
		
		Object args[] = {
				this.get("aac101")
		};
		
		
		
		
		return this.queryForList(sql.toString(),args);
	}
	
	public Map<String, String> findById() throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106, ")
				.append("       x.aac105,x.aac104,x.aac109 postImgPath,b.aab101,x.aac108 ")
				.append("  from syscode a,ac01 x,ab01 b")
				.append(" where x.aac103 = a.fcode  ")
			    .append("   and x.aab101 = b.aab101  " )
			    .append("   and a.fname = 'aac103' and x.aac101 = ? ") 
				;
		return this.queryForMap(str.toString(), this.get("aac101"));	
	}
	
}
