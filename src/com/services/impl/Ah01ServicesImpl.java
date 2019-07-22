package com.services.impl;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.services.BaseServices;
import com.services.JdbcServicesSupport;
import com.system.tools.Tools;

/**
 * @Description: ʵ���ʼ�ģ����������ݿ����֧��
 * @author: ��־��
 */
public abstract class Ah01ServicesImpl extends JdbcServicesSupport
{
	/**
	 * @Description: ��һ�ʼ��������
	 * @throws: sql���ִ�г���
	 */
	public boolean sendEmail()throws Exception
	{
		return this.sendEmail(null);
	}
	
	/**
	 * @Description: �ʼ������������
	 * @throws: sql���ִ�г���
	 */
	public boolean batchSendEmail()throws Exception
	{
		List<Map<String,String>> list=this.query();
		System.out.println(list);
		if(list!=null && list.size()!=0) 
		{
			for(Map<String,String> map:list)
			{
				this.sendEmail(map.get("aab101"));
			}
			return true;
		}
		return false;
	}
	
	/**
	 * @Description: ���ʼ����в����ʼ���¼
	 * 	�����ʼ������dto:
	 * 		aab101: �ʼ�������(��������ʱ������д)
	 * 		aah102: �ʼ�����(0��ʾ֪ͨ�࣬1��ʾ�����࣬2��ʾѯ����)
	 * 		aah103: �ʼ�����
	 * 		aah104: �ʼ�����
	 * 		aah105: �ʼ�����ʱ��(�����Զ����룬���贫ֵ)
	 * 		aah106: �ʼ�״̬(0��ʾδ����1��ʾ�Ѷ���Ĭ������δ�������贫ֵ)
	 * 		aah202: ��һ������(����������ѯ�����ʼ�����ı�Ҫ����)
	 * 				  ֪ͨ���ʼ�����
	 * 		aah203: �ڶ�������(���ѯ�����ʼ����������)
	 * 				   ֪ͨ���������಻��
	 * 		aah204: ��¼�û���ѯ�����ʼ��Ĳ���
	 * 				   0��ʾδ������
	 * 				   1��ʾͬ��
	 * 				   2��ʾ�ܾ�
	 * 				   (�����ʼ�ʱĬ��Ϊ0,������ʼ���̨����ʱ��Ҫ�޸�)
	 * 
	 * 	֪ͨ���ʼ���Ҫ�Ǹ��û�չʾ֪ͨ������Ҫ�û������κβ���
	 * 	�������ʼ������û�չʾ֪ͨ��ͬʱ�����һ�����ӹ��û�����
	 * 	ѯ�����ʼ���Ҫ��ѯ���û������򣬻��н��ܺ;ܾ�����ѡ��
	 * @param: �ʼ�������
	 * @throws: sql���ִ�г���
	 */
	private boolean sendEmail(Object aab101)throws Exception
	{
		//����ʼ����շ��Ƿ����
		String str="select aab102 from ab01 where aab101=?";
		if(aab101==null)
		{
			aab101=this.get("aab101");
		}
		if(this.queryForList(str, aab101).size()==0)
		{
			return false;
		}
		
		StringBuilder sb=new StringBuilder()
				.append("insert into ah01(aah101,aab101,aah102,aah103,aah104,aah105,")
				.append("                                    aah106)")
				.append("                    values(?,?,?,?,?,CURRENT_TIMESTAMP,0)")
				;
		Object state= Tools.getSequence("aah101");
		
		
		
		Object idlist[]= {
				state,
				aab101,
				this.get("aah102"),
				this.get("aah103"),
				this.get("aah104")
				};
		this.appendSql(sb.toString(), idlist);
		
		int type=Integer.valueOf(this.get("aah102").toString());
		if(type==1) 
		{
			String sql="insert into ah02(aah101,aah202) values(?,?)";		
			Object ids[]= {
					state,
					this.get("aah202")
					};
			this.appendSql(sql, ids);
		}
		else if(type==2)
		{
			String sql="insert into ah02(aah101,aah202,aah203,aah204) values(?,?,?,0)";		
			Object ids[]= {
					state,
					this.get("aah202"),
					this.get("aah203")
					};
			this.appendSql(sql, ids);
		}
		return this.executeTransaction();
		
	}
	
	/**
	 * @Description: �޸��ʼ�״̬
	 * @throws: sql���ִ�г���
	 */
	public boolean updateEmail()throws Exception
	{
		String sql="update ah01 set aah106 =? where aah101=?";
		Object idlist[]= {this.get("aah106"),this.get("aah101")};
		
		return this.executeUpdate(sql, idlist)>0;
	}

}
