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
import com.system.mail.MailUtil;
import com.system.talk.Users;
import com.system.tools.Tools;

/**
 * 
 * @Description: 对ab01表的操作
 * @author: xzc
 */
public class Ab01ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * 
	 * @Description: 完善个人信息
	 * @return
	 * @throws Exception
	 */
	private boolean modifyUser()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("update ab01 a")
				.append("   set a.aab102=?,a.aab105=?,a.aab109=?,a.aab111=?,a.aab112=?,")
				.append("       a.aab114=?,a.aab115=?")
				.append(" where a.aab101=?")
				;
		Object args[]= {
				this.get("aab102"),
				this.get("aab105"),
				this.get("aab109"),
				this.get("aab111"),
				this.get("aab112"),
				this.get("aab114"),
				this.get("aab115"),
				this.get("aab101")
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	/**
	 * 
	 * @Description: 修改密码
	 * @return
	 * @throws Exception
	 */
	private boolean modifyPassword()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				.append("update ab01 a")
				.append("   set a.aab103=?")
				.append(" where a.aab101=?")
				.append("   and a.aab103=?")
				;
		Object args[]= {
				Tools.getMd5(this.get("Naab103")),
				this.get("aab101"),
				Tools.getMd5(this.get("aab103"))
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	/**
	 *
	 * @Description: 修改邮箱
	 * @return
	 * @throws Exception
	 */
	private boolean modifyEmail()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				.append("update ab01 a")
				.append("   set a.aab108=?")
				.append(" where a.aab101=?")
				;
		Object args[]= {
				this.get("aab108"),
				this.get("aab101")
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	
	
	/**
	 * 
	 * @Description	忘记密码后的重设密码
	 * @return
	 * @throws Exception
	 */
	private boolean resetPassword()throws Exception
	{
		String sql = "update ab01 a set a.aab103=? where a.aab108=?";
		
		Object args[] = {
			Tools.getMd5(this.get("aab103")),
			this.get("aab108")
		};
		
		return this.executeUpdate(sql, args)>0;
	}
	
	/**
	 * 判断邮箱是否存在
	 * @return
	 * @throws Exception
	 */
	private boolean isEmailExist()throws Exception
	{
		String sql="select a.aab108 from ab01 a where a.aab108=?";
		return this.queryForMap(sql, this.get("aab108")) != null;
	}
	
	/**
	 * 
	 * @Description: 用户注册
	 * @return
	 * @throws Exception
	 */
	private boolean addUser()throws Exception
	{
		//注册
		StringBuilder sql=new StringBuilder()
				.append("insert into ab01(aab102,aab103,aab104,aab107,aab108,")
				.append("				  aab110,aab113,is_onLine)")
				.append("            values(?,?,?,?,?,")
				.append("					?,?,?)")
				;
		Object args[]= {
				this.get("aab102"),
				Tools.getMd5(this.get("aab103")),
				this.get("aab104"),
				this.get("aab107"),
				this.get("aab108"),
				this.get("aab110"),
				100,
				0
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	/**
	 * 进入个人主页查询
	 */
	public Map<String, String> findById() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab102,a.aab103,a.aab104,b.fvalue cnaab105,a.aab107,")
				.append("       a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
				.append("       a.aab113,a.aab114,a.aab115,a.is_onLine")
				.append("   from ab01 a,syscode b")
				.append("  where a.aab101=?");
		
		return this.queryForMap(sql.toString(), this.get("aab101"));
	}
	
	
	
	public boolean sendEmail() throws Exception 
	{
		String Email = (String)this.get("aab108");
		Tools.setCode(Email);
		MailUtil.email(Email, Users.verification_code.get(Email));
		return true;
	}
	
	public boolean receiveEmail()throws Exception
	{
		String Email = (String)this.get("aab108");
		String code = (String) this.get("ver");
		return code != null && Users.verification_code.get(Email) != null
				&& Users.verification_code.get(Email).equals(this.get("ver"));
	}
	
	/**
	 * 登录查询
	 */
	public Map<String, String> check()throws Exception
	{
		String sql=null;
		if(((String)this.get("userID")).contains("@")) 
		{
			sql="select a.aab101,a.aab103 from ab01 a where a.aab108=?";
		}
		else 
		{
			sql="select a.aab101,a.aab103 from ab01 a where a.aab107=?";
		}
		Map<String, String> map = this.queryForMap(sql,this.get("userID"));
		if(map!=null)
		{
			if(map.get("aab103").equals(Tools.getMd5(this.get("aab103"))))
			{
				return map;
			}
		}
		return null;	
	}
	
	
	
	
	/**
	 * 	按用户名查询
	 * @param str
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryForUsername(String str)throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab104,b.fvalue cnaab105,a.aab107,")
				.append("		a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
				.append("		a.aab113,a.aab114,a.aab115,a.is_online")
				.append("  from ab01 a,syscode b ")
				.append(" where a.aab105 = b.fcode and b.fname = 'aab105' ")
				;
		List<Object> paramList=new ArrayList<>();
		if (this.isNotNull(str)) {
			sql.append("	and a.aab102 like ? ");
			paramList.add("%" +str+ "%");
		}
		return queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 按姓名查询
	 * @param str
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryForName(String str)throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab104,b.fvalue cnaab105,a.aab107,")
				.append("		a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
				.append("		a.aab113,a.aab114,a.aab115,a.is_online")
				.append("  from ab01 a,syscode b ")
				.append(" where a.aab105 = b.fcode and b.fname = 'aab105' ")
				;
		List<Object> paramList=new ArrayList<>();
		if (this.isNotNull(str)) {
			sql.append("	and a.aab104 = ? ");
			paramList.add(str);
		}
		return queryForList(sql.toString(), paramList.toArray());
	}
	
	/**
	 * 按学号查询
	 * @param str
	 * @return
	 * @throws Exception
	 */
	private List<Map<String, String>> queryForSID(String str)throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab104,b.fvalue cnaab105,a.aab107,")
				.append("		a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
				.append("		a.aab113,a.aab114,a.aab115,a.is_online")
				.append("  from ab01 a,syscode b ")
				.append(" where a.aab105 = b.fcode and b.fname = 'aab105' ")
				;
		List<Object> paramList=new ArrayList<>();
		if (this.isNotNull(str)) {
			sql.append("	and a.aab107 = ? ");
			paramList.add(str);
		}
		return queryForList(sql.toString(), paramList.toArray());
	}

	
	/**
	 * 	查询用户
	 */
	public List<Map<String, String>> query()throws Exception
	{
		Object aab102=this.get("message");	//用户名	模糊查询
		Object aab104=this.get("message");	//姓名
		Object aab107=this.get("message");	//学号
		
		String str1=(String)aab102;
		String []str2=str1.trim().split("\\s+|\\^|&|\\+|,|，");
		
		List<Map<String, String>> list=new ArrayList<>();
		for(String str:str2)
		{
			list.addAll(this.queryForUsername(str));
			list.addAll(this.queryForName(str));
			list.addAll(this.queryForSID(str));
		}
		
		Map<Map<String,String>,Integer> map=new HashMap<>();

		Set<Map<String,String>> set=new HashSet<>(list);

		for(Map<String,String> mp:set)
		{
			for(Map<String,String> mp1:list)
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

		List<Map<String,String>> list1=sortMapByValue(map);
		return list1;
		

		
		
		
//		StringBuilder sql1=new StringBuilder()
//				.append("select a.aab101,a.aab102,a.aab104,b.fvalue cnaab105,a.aab107,")
//				.append("		a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
//				.append("		a.aab113,a.aab114,a.aab115,a.is_online")
//				.append("  from ab01 a,syscode b ")
//				.append(" where a.aab105 = b.fcode and b.fname = 'aab105' ")
//				;
//		StringBuilder sql2=new StringBuilder()
//				.append("select a.aab101,a.aab102,a.aab104,b.fvalue cnaab105,a.aab107,")
//				.append("		a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
//				.append("		a.aab113,a.aab114,a.aab115,a.is_online")
//				.append("  from ab01 a,syscode b ")
//				.append(" where a.aab105 = b.fcode and b.fname = 'aab105' ")
//				;
//		StringBuilder sql3=new StringBuilder()
//				.append("select a.aab101,a.aab102,a.aab104,b.fvalue cnaab105,a.aab107,")
//				.append("		a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
//				.append("		a.aab113,a.aab114,a.aab115,a.is_online")
//				.append("  from ab01 a,syscode b ")
//				.append(" where a.aab105 = b.fcode and b.fname = 'aab105' ")
//				;
//		List<Object> paramList1=new ArrayList<>();
//		List<Object> paramList2=new ArrayList<>();
//		List<Object> paramList3=new ArrayList<>();
//		if (this.isNotNull("aab102")) 
//		{
//			sql1.append("	and a.aab102 like ? ");
//			paramList1.add("%" +aab102+ "%");
//		}
//		if (this.isNotNull("aab104")) 
//		{
//			sql2.append("	and a.aab104 = ? ");
//			paramList2.add(aab104);
//		}
//		if (this.isNotNull("aab107")) 
//		{
//			sql3.append("	and a.aab107 = ? ");
//			paramList3.add(aab107);
//		}
//		List<Map<String, String>> list1=this.queryForList(sql1.toString(),paramList1.toArray());
//		List<Map<String, String>> list2=this.queryForList(sql2.toString(),paramList2.toArray());
//		List<Map<String, String>> list3=this.queryForList(sql3.toString(),paramList3.toArray());
//		list3.addAll(list1);
//		list3.addAll(list2);
//		Set<Map<String, String>> set=new HashSet<>(list3);
//		List<Map<String, String>> list4=new ArrayList<>(set);
//		
//		list4.sort((Map<String,String> m1,Map<String,String> m2) -> m1.get("aab101").compareTo(m2.get("aab101")));
//
//		return list4;
	}

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
