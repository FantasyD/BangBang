package com.services.impl;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;

public class Ae03ServicesImpl extends JdbcServicesSupport
{
	/**
	 * @Description: 模糊查询
	 * @throws：sql语句执行出错
	 */
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab104,b.fvalue cnaab105,a.aab107,")
				.append("		a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
				.append("		a.aab113,a.aab114,a.aab115,a.is_online")
				.append("  from ab01 a,syscode b ")
				.append(" where a.aab105 = b.fcode and b.fname = 'aab105' ")
				.append("  and aab102 like ?")
				;
		Object name="%"+URLDecoder.decode((String) this.get("aab102"),"UTF-8")+"%";
		
		return this.queryForList(sql.toString(), name);
	}
}
