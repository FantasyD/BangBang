package com.services.impl;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import com.services.JdbcServicesSupport;

public class Ac06ServicesImpl extends JdbcServicesSupport 
{

	/**
	 * @description 	按照标题查询
	 * @param str
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryForTitle(String str)throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aac101,b.aab102 cnaab102,a.aac102,s.fvalue cnaac103,a.aac106,")
				.append("       a.aac105,b.aab101,a.aac109,a.aac108,a.aac110,b.aab101  ")
				.append("  from ac01 a,ab01 b,syscode s")
				.append(" where a.aac103 = s.fcode and s.fname = 'aac103'  ")
				.append("   and a.aab101 = b.aab101 ")
				.append(" 	and a.is_deleted = 0 ")
				;
		List<Object> paramList=new ArrayList<>();
		if (this.isNotNull(str)) {
			sql.append("	and a.aac102 like ? ");
			paramList.add("%" +str+ "%");
		}
		return queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * @description 	按照内容查询
	 * @param str
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryForContent(String str)throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aac101,b.aab102 cnaab102,a.aac102,s.fvalue cnaac103,a.aac106,")
				.append("       a.aac105,b.aab101,a.aac109,a.aac108,a.aac110,b.aab101  ")
				.append("  from ac01 a,ab01 b,syscode s")
				.append(" where a.aac103 = s.fcode and s.fname = 'aac103'  ")
				.append("   and a.aab101 = b.aab101 ")
				.append(" 	and a.is_deleted = 0 ")
				;
		List<Object> paramList=new ArrayList<>();
		if (this.isNotNull(str)) {
			sql.append("	and a.aac104 like ? ");
			paramList.add("%" +str+ "%");
		}
		return queryForList(sql.toString(), paramList.toArray());
	}
	
	
	public	List<Map<String, String>> query()throws Exception
	{
		Object aac102=this.get("message");	//帖子标题  模糊查询
		Object aac104=this.get("message");	//帖子内容  模糊查询
		//Object aab101 = this.get("aab101");		//用户流水号
		String str1=(String)aac102;
		
//		String str3=(String)aac104;
//		String [] str4 = str3.trim().split("\\s+|\\^|&|\\+|,|，");
		
		List<Map<String, String>> list1=new ArrayList<>();
		if (str1!=null) 
		{
			//允许用户以 空格^&+,作为分割符
			String [] str2 = str1.trim().split("\\s+|\\^|&|\\+|,|，");
			
			for(String str:str2)
			{
				list1.addAll(this.queryForTitle(str));
				list1.addAll(this.queryForContent(str));
			}
			
			Map<Map<String,String>,Integer> map=new HashMap<>();

			Set<Map<String,String>> set=new HashSet<>(list1);

			for(Map<String,String> mp:set)
			{
				for(Map<String,String> mp1:list1)
				{
					if(mp.equals(mp1))
					{
						if(map.containsKey(mp))
						{
							Integer count=map.get(mp);
							count++;
							map.put(mp,count);
						}
						else
						{
							map.put(mp,1);
						}
					}
				}
			}

			List<Map<String,String>> list2=sortMapByValue(map);
			return list2;
		}
		return list1;
		
	}
	
	/**
	 * 	按value对map排序形成list
	 * @param map
	 * @return
	 * @throws Exception
	 */
	private static List<Map<String,String>> sortMapByValue(Map<Map<String,String>,Integer> map)throws Exception
	{
		int size=map.size();
		
		List<Map.Entry<Map<String, String>, Integer>> list=new ArrayList<>(size);
		list.addAll(map.entrySet());
		List<Map<String, String>> keys=list.stream().sorted(Comparator.comparing(Map.Entry<Map<String, String>,Integer>::getValue).reversed())
				.map(Map.Entry<Map<String, String>,Integer>::getKey).collect(Collectors.toList());
		
		return keys;		
	}
	

}
