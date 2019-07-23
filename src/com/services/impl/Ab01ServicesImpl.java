package com.services.impl;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.services.JdbcServicesSupport;
import com.system.myMail.*;
import com.system.talk.Users;
import com.system.tools.Tools;

/**
 * 
 * @Description: ��ab01��Ĳ���
 * @author: xzc
 */
public class Ab01ServicesImpl extends Ah01ServicesImpl
{
	/**
	 * 
	 * @Description: ���Ƹ�����Ϣ
	 * @return
	 * @throws Exception
	 */
	private boolean modifyUser()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("update ab01 set ")
				;
  		Object aab102 = this.get("aab102");
  		Object aab104 = this.get("aab104");
  		Object aab105 = this.get("aab105");
  		Object aab107 = this.get("aab107");
  		Object aab109 = this.get("aab109");
  		Object aab110 = this.get("aab110");
  		Object aab111 = this.get("aab111");
  		Object aab112 = this.get("aab112");
  		Object aab114 = this.get("aab114");
  		//�����б�
  		List<Object> paramList=new ArrayList<>();
  		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
  		
  		if(this.isNotNull(aab102))
  		{
  			sql.append(" aab102=?,");
  			paramList.add(URLDecoder.decode((String)aab102,"UTF-8"));
  		}
  		if(this.isNotNull(aab104))
  		{
  			sql.append(" aab104=?,");
  			paramList.add(URLDecoder.decode((String)aab104,"UTF-8"));
  		}
  		if(this.isNotNull(aab105))
  		{
  			sql.append(" aab105=?,");
  			paramList.add(URLDecoder.decode((String)aab105,"UTF-8"));
  		}
  		if(this.isNotNull(aab107))
  		{
  			sql.append(" aab107=?,");
  			paramList.add(URLDecoder.decode((String)aab107,"UTF-8"));
  		}
  		if(this.isNotNull(aab109))
  		{
  			sql.append(" aab109=?,");
  			paramList.add(URLDecoder.decode((String)aab109,"UTF-8"));
  		}
  		if(this.isNotNull(aab110))
  		{
  			sql.append(" aab110=?,");
  			paramList.add(URLDecoder.decode((String)aab110,"UTF-8"));
  		}
  		if(this.isNotNull(aab111))
  		{
  			sql.append(" aab111=?,");
  			paramList.add(URLDecoder.decode((String)aab111,"UTF-8"));
  		}
  		if(this.isNotNull(aab112))
  		{
  			sql.append(" aab112=?,");
  			paramList.add(URLDecoder.decode((String)aab112,"UTF-8"));
  		}
  		if(this.isNotNull(aab114))
  		{
  			sql.append(" aab114=?,");
  			paramList.add(URLDecoder.decode((String)aab114,"UTF-8"));
  		}
  		sql.append(" where aab101 = ?");
  		paramList.add(this.get("aab101"));
  		String str = sql.toString();
  		str = str.substring(0, str.lastIndexOf(",")) + str.substring(str.lastIndexOf(",") + 1);
		return this.executeUpdate(str, paramList.toArray())>0;
	}
	
	/**
	 * 
	 * @Description: �޸�����
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
		
		if(this.executeUpdate(sql.toString(), args) > 0)
		{
			this.put("aab101", this.get("aab101"));
			this.put("aah102", "0");
			this.put("aah103", "�����޸ĳɹ�֪ͨ");
			this.put("aah104", "�����������޸ĳɹ���");
			this.sendEmail();
			return true;
		}
		return false;
	}
	
	/**
	 *
	 * @Description: �޸�����
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
		
		if(this.executeUpdate(sql.toString(), args) > 0)
		{
			this.put("aab101", this.get("aab101"));
			this.put("aah102", "0");
			this.put("aah103", "�������óɹ�֪ͨ");
			this.put("aah104", "���������ѳɹ����°󶨣�");
			this.sendEmail();
			return true;
		}
		return false;
	}
	
	
	
	/**
	 * 
	 * @Description	������������������
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
		
		if(this.executeUpdate(sql, args) > 0)
		{
			String sql1 = "select aab101 from ab01 where aab108=?";
			Map<String, String> map = this.queryForMap(sql1, this.get("aab108"));
			this.put("aab101", map.get("aab101"));
			this.put("aah102", "0");
			this.put("aah103", "��������ɹ�֪ͨ");
			this.put("aah104", "���������ѳɹ��������ã�");
			this.sendEmail();
			return true;
		}
		return false;
	}
	
	/**
	 * �ж������Ƿ����
	 * @return
	 * @throws Exception
	 */
	private boolean isEmailExist()throws Exception
	{
		String sql="select a.aab101 from ab01 a where a.aab108=?";
		return this.queryForMap(sql, this.get("aab108")) != null;
	}
	
	/**
	 * 
	 * @Description: �û�ע��
	 * @return
	 * @throws Exception
	 */
	private boolean addUser()throws Exception
	{
		//ע��
		StringBuilder sql=new StringBuilder()
				.append("insert into ab01(aab102,aab103,aab104,aab107,aab108,")
				.append("				  aab110,aab113,is_onLine,aab105)")
				.append("            values(?,?,?,?,?,")
				.append("					?,?,?,'3')")
				;
		
		String name= URLDecoder.decode((String)this.get("aab110"),"UTF-8");
		Object args[]= {
				URLDecoder.decode((String)this.get("aab102"),"UTF-8"),
				Tools.getMd5(URLDecoder.decode((String)this.get("aab103"),"UTF-8")),
				URLDecoder.decode((String)this.get("aab104"),"UTF-8"),
				URLDecoder.decode((String)this.get("aab107"),"UTF-8"),
				URLDecoder.decode((String)this.get("aab108"),"UTF-8"),
				URLDecoder.decode((String)this.get("aab110"),"UTF-8"),
				100,
				0
		};
		
		if(this.executeUpdate(sql.toString(), args) > 0)
		{
			String sql1 = "select aab101 from ab01 where aab108=?";
			Map<String, String> map = this.queryForMap(sql1, this.get("aab108"));
			this.put("aab101", map.get("aab101"));
			this.put("aah102", "0");
			this.put("aah103", "ע��ɹ�֪ͨ");
			this.put("aah104", "�����˺��ѳɹ�ע�ᣡ");
			this.sendEmail();
			return true;
		}
		return false;
	}
	
	/**
	 * ���������ҳ��ѯ
	 */
	public Map<String, String> findById() throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab103,a.aab104,b.fvalue cnaab105,a.aab107,")
				.append("       a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
				.append("       a.aab113,a.aab114,a.aab115,a.is_onLine")
				.append("  from ab01 a,syscode b")
				.append(" where a.aab105 = b.fcode and b.fname = 'aab105' ")
				.append("   and a.aab101=?");
		
		return this.queryForMap(sql.toString(), this.get("aab101"));
	}
	
	
	
	public boolean SendEmail() throws Exception 
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
	 * ��¼��ѯ
	 */
	public Map<String, String> check()throws Exception
	{
		String sql=null;
		if(((String)this.get("userId")).contains("@")) 
		{
			sql="select a.aab101,a.aab102,a.aab103,a.aab115 from ab01 a where a.aab108=?";
		}
		else 
		{
			sql="select a.aab101,a.aab102,a.aab103,a.aab115 from ab01 a where a.aab107=?";
		}
		Map<String, String> map = this.queryForMap(sql,this.get("userId"));
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
	 * 	���û�����ѯ
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
	 * ��������ѯ
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
	 * ��ѧ�Ų�ѯ
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
	 * 	��ѯ�û�
	 */
	public List<Map<String, String>> query()throws Exception
	{
		Object aab102=this.get("message");	//�û���	ģ����ѯ
		Object aab104=this.get("message");	//����
		Object aab107=this.get("message");	//ѧ��
		
		String str1=(String)aab102;
		
		
		List<Map<String, String>> list=new ArrayList<>();
		if (str1!=null) 
		{
			String []str2=str1.trim().split("\\s+|\\^|&|\\+|,|��");
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
		}
		return list;
	}

	/**
	 * ����value��map�����γ�list
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
	
	
	public boolean uploadUserImage() throws Exception 
	{
		String sql = "update ab01 set aab115 = ? where aab101 = ?";
		
		Object[] args = {
				this.get("imgpath"),
				this.get("aab101")
		};
		
		return this.executeUpdate(sql, args)>0;
 	}

	
}
