package com.services.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;
import com.system.tools.Tools;

/**
 * @Description: ��������
 */
public class Ac05ServicesImpl extends Ah01ServicesImpl
{
	/**
	 * @Description: 
	 * 	��ȡ������Ҫ�����ʼ�֪ͨ���û��б�
	 * 	��������Ⱥ��ͬ���Ա�Լ���ע���û����û�
	 * @return:������Ҫ����֪ͨ�ʼ����û��б�
	 * @throws:�쳣����
	 */
	public List<Map<String, String>> query()throws Exception
	{
		List<Map<String,String>> list=new ArrayList<>();
		list.addAll(this.getGroupsId());
		list.addAll(this.getFollowId());
		//ȥ���ظ��û�
		HashSet<Map<String, String>> h=new HashSet<>(list);
		list.clear();
		list.addAll(h);
		
		return list;
	}
	
	/**
	 * @Description: ��ȡÿ��Ⱥ���е���Ա��ˮ��
	 * @param:Ⱥ��id
	 * @return:ÿ��Ⱥ�����Ա��ˮ���б�
	 * @throws: sql���ִ�г���
	 */
	public List<Map<String,String>> getGroupsMembersId(Object...ids)throws Exception
	{
		String sql="select aab101 from ae02 where aab101<>? and aae101=?";
		return this.queryForList(sql, ids);
	}
	
	/**
	 * @Description: ��ȡ�û�������Ⱥ��
	 * @return:�û�������Ⱥ���б�
	 * @throws: sql���ִ�г���
	 */
	public List<Map<String,String>> getGroupsId()throws Exception
	{
		String sql="select aae101 from ae02 where aab101=?";
		Object id=this.get("aab101");
		List<Map<String,String>> groups=this.queryForList(sql, id);
		List<Map<String,String>> members=new ArrayList<>();
		for(Map<String,String> member:groups)
		{
			Object ids[]= {id,member.get("aae101")};
			members.addAll(this.getGroupsMembersId(ids));
		}
		return members;
	}
	
	/**
	 * @Description: ��ȡ���й�ע�˸��û����û���ˮ��
	 * @return:��ע���û����û��б�
	 * @throws: sql���ִ�г���
	 */
	public List<Map<String,String>> getFollowId()throws Exception
	{
		String sql="select aab101 from ab02 where ab0_aab101=?";
		Object id=this.get("aab101");
		return this.queryForList(sql, id);
	}
	
	
	public Map<String, String> findById() throws Exception
	{				
		StringBuilder str = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106, ")
				.append("       x.aac105,x.aac104,x.aac109,b.aab101")
				.append("  from syscode a,ac01 x,ab01 b")
				.append(" where x.aac103 = a.fcode  ")
			    .append("   and x.aab101 = b.aab101  " )
			    .append("   and a.fname = 'aac103' and x.aac101 = ? ") 
				;
		return this.queryForMap(str.toString(), (Tools.getSequenceWithoutAdd("aac101")));	
	}

	
	
	public boolean addTiezi() throws Exception
	{

		StringBuilder sql = new StringBuilder()
				.append("insert into ac01(aac101,aab101,aac102,aac103,aac104,aac105,")
    			.append("                 aac106,aac107,aac108,aac109,is_deleted,aac110)  ")
    			.append("          values(?,?,?,?,?,?,")
    			.append("                 ?,current_timestamp,current_timestamp,?,0,0)")
				;
		
		Object[] argsObjects = {
				Tools.getSequence("aac101"),
				this.get("aab101"),
				this.get("aac102"),
				this.get("aac103"),
				this.get("aac104"),
				this.get("aac105"),
				this.get("aac106"),
				this.get("imgpath")
		};
		
		this.put("aab101", this.get("aab101"));
		this.put("aah202", "/BangBang/tiezi_findByIdTiezi.html?aac101="+Tools.getSequenceWithoutAdd("aac101"));
		
		this.batchSendEmail();
		
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
}
