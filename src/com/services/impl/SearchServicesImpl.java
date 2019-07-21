package com.services.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.services.JdbcServicesSupport;

/**
 * @description	搜索模块
 * @author xzc
 *
 */
public class SearchServicesImpl extends JdbcServicesSupport 
{
	public List<Map<String, String>> query()throws Exception
	{
		/****************************************************************************
		 * 								用户
		 ****************************************************************************/
		if (this.get("searchtype").equals("2")) 		
		{
			Object aab102=this.get("message");	//用户名  模糊查询
			
			StringBuilder sql=new StringBuilder()
					.append("select a.aab101,a.aab102,a.aab103,a.aab104,b.fvalue cnaab105,")
					.append("		a.aab107,a.aab108,s.fvalue cnaab109,a.aab110,a.aab111,")
					.append("		a.aab112,a.aab113,a.aab114,a.aab115,a.is_online")
					.append("	from ab01 a,syscode b,syscode s")
					.append("	where a.aab105 = b.fcode and b.fname = 'aab101' ")
					.append("	 and  a.aab107 = s.fcode and s.fname = 'aab101' ")
					;
			List<Object> paramList=new ArrayList<>();
			if (this.isNotNull("aab102")) {
				sql.append("	 and  a.aab102 like ? ");
				paramList.add("%" +aab102+ "%");
			}
			return this.queryForList(sql.toString(), paramList);
		}									
		/****************************************************************************
		 * 								帖子
		 ****************************************************************************/
		Object aac102=this.get("message");	//帖子标题  模糊查询
		Object aac104=this.get("message");	//帖子内容  模糊查询
		
		StringBuilder sql1=new StringBuilder()
				.append("select a.aac101,b.aab102 cnaab102,a.aac102,s.fvalue cnaac103,a.aac106,")
				.append("       a.aac105,b.aab101,a.aac109 imgPath,a.aac108,a.aac110  ")
				.append("  from ac01 a,ab01 b,syscode s")
				.append(" where a.aac103 = s.fcode and s.fname = 'aac103'  ")
				.append("   and a.aab101 = b.aab101 ")
				.append(" 	and a.is_deleted = 0 ")
				;
		StringBuilder sql2=new StringBuilder()
				.append("select a.aac101,b.aab102 cnaab102,a.aac102,s.fvalue cnaac103,a.aac106,")
				.append("       a.aac105,b.aab101,a.aac109 imgPath,a.aac108,a.aac110  ")
				.append("  from ac01 a,ab01 b,syscode s")
				.append(" where a.aac103 = s.fcode and s.fname = 'aac103'  ")
				.append("   and a.aab101 = b.aab101 ")
				.append(" 	and a.is_deleted = 0 ")
				;
		List<Object> paramList1=new ArrayList<>();
		List<Object> paramList2=new ArrayList<>();
		if (this.isNotNull("aac102")) 
		{
			sql1.append("	and a.aac102 like ? ");
			paramList1.add("%" +aac102+ "%");
		}
		if (this.isNotNull("aac104")) 
		{
			sql2.append("	and a.aac104 like ? ");
			paramList2.add("%" +aac104+ "%");
		}
		List<Map<String, String>> list1=this.queryForList(sql1.toString(), paramList1.toArray());
		List<Map<String, String>> list2=this.queryForList(sql2.toString(), paramList2.toArray());
		list2.addAll(list1);
		Set<Map<String, String>> set=new HashSet<>(list2);
		List<Map<String, String>> list3=new ArrayList<>(set);
		return list3;	
	}
	
	
}
