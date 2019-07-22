package com.services.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.services.JdbcServicesSupport;

public class GetAh01ServicesImpl extends JdbcServicesSupport
{
	/**
	 * @Description: ��ѯĳ���û��������ʼ�
	 * @return:ĳһ�û��������ʼ���
	 * @throws:sql���ִ�г���
	 */
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sb1=new StringBuilder()
				.append("SELECT x.aah101,x.aah102,x.aah103,x.aah104,x.aah106")
				.append("  from ah01 x")
				.append(" where x.aab101=?")
				.append(" order by x.aah105 desc")
				;
		StringBuilder sb2=new StringBuilder()
				.append("SELECT x.aah101,x.aah102,x.aah103,x.aah104,x.aah106,")
				.append("			 y.aah201,y.aah202 aah202,y.aah203 aah203,y.aah204")
				.append("  from ah01 x,ah02 y")
				.append(" where x.aah101=y.aah101 and x.aab101=?")
				.append(" order by x.aah105 desc")
				;
		Object id=this.get("aab101");
		//��ȡ�����ʼ��͸���������Ϣ���ʼ�
		List<Map<String,String>> list1=this.queryForList(sb1.toString(), id);
		List<Map<String,String>> list2=this.queryForList(sb2.toString(), id);
		//��2��3���ʼ�������������Ϣ��ֵ
		Set set=new HashSet<>();
		//��������2,3���ʼ����ʼ�����Set
		for(Map<String,String> map:list2)
		{
			set.add(map.get("aah101"));
		}
		for(Map<String,String> map:list1)
		{
			//���������set����ζ����2,3���ʼ�
			if(!set.add(map.get("aah101")))
			{
				for(Map<String,String> m:list2)
				{
					if(m.get("aah101").equals(map.get("aah101")))
					{
						list1.set(list1.indexOf(map), m);
						break;
					}
				}
			}
		}
		return list1;
	}
	
	/**
	 * @Description: �޸��ʼ�״̬
	 * @throws: sql���ִ�г���
	 */
	public boolean updateEmail()throws Exception
	{
		String sql="update ah01 set aah106 =? where aah101=?";
		Object idlist[]= {"1",this.get("aah101")};
		
		return this.executeUpdate(sql, idlist)>0;
	}
	
	public boolean updateAllEmail()throws Exception
	{
		String sql="update ah01 set aah106=? where aab101=?";
		Object idlist[]= {"1",this.get("aab101")};
		return this.executeUpdate(sql, idlist)>0;
	}
	
}
