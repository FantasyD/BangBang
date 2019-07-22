package com.services.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.services.JdbcServicesSupport;
import com.system.tools.Tools;

public class Ac01ServicesImpl extends Ah01ServicesImpl
{
	
	/**
	 * �÷�������ִ�ж�������ѯ
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> query() throws Exception
	{
		//��ԭҳ���ѯ����
		Object aac102 = this.get("qaac102");		//���ӱ��� ģ����ѯ
		Object aac103 = this.get("qaac103");		//��������
		Object aab101 = this.get("aab101");		//�û���ˮ��

		
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106,")
				.append("       x.aac105,b.aab101,x.aac109,x.aac108,x.aac110  ")
				.append("  from syscode a,ac01 x,ab01 b")
				.append(" where x.aac103 = a.fcode and a.fname = 'aac103'  ")
				.append("   and x.aab101 = b.aab101 ")
				;
		
		//�����б�
		List<Object> paramList = new ArrayList<Object>();
		//��һ�жϲ�ѯ�����Ƿ�¼��,ƴ��AND����
		if(this.isNotNull(aac102))
		{
			sql.append(" and x.aab102 like ? ");
			paramList.add("%"+aac102+"%");
		}
		if(this.isNotNull(aac103))
		{
			sql.append(" and x.aab103 = ? ");
			paramList.add(aac103);
		}
		if(this.isNotNull(aab101))
		{
			sql.append(" and x.aab101 = ? ");
			paramList.add(aab101);
		}
		sql.append(" and x.is_deleted = 0 ");
		sql.append(" order by x.aac108 desc");
		
		return this.queryForList(sql.toString(), paramList.toArray());
	}

	
	
	public List<Map<String,String>> queryForList()throws Exception
	{
		String sql="select aac101,aac104 from ac01";
		return this.queryForList(sql);
	}
	
	public boolean delByIdTiezi() throws Exception
	{
		String sql = "update ac01 set is_deleted = 1 where aac101 = ?";
		String sql2 = "update ac02 set is_deleted = 1 where aac101 = ?";
		Object[] args = {this.get("aac101")};
		this.batchUpdate(sql2, args);
		this.batchUpdate(sql, args);
		return this.executeTransaction();
	}
	
	/*
	public boolean addTiezi() throws Exception
	{

		StringBuilder sql = new StringBuilder()
				.append("insert into ac01(aab101,aac102,aac103,aac104,aac105,")
    			.append("                 aac106,aac107,aac108,aac109,is_deleted,aac110)  ")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,current_timestamp,current_timestamp,?,0,0)")
				;
		
		Object[] argsObjects = {
				this.get("aab101"),
				this.get("aac102"),
				this.get("aac103"),
				this.get("aac104"),
				this.get("aac105"),
				this.get("aac106"),
				this.get("imgpath")
		};
		
		this.put("aab101", this.get("aab101"));
		
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}*/
	
	public boolean insertImg() throws Exception
	{
		String sql = "insert into ac04(aac101,aac402,aac403) values (2,?,current_timestamp)";
		return this.executeUpdate(sql, this.get("imgPath"))>0;
	}
	
	
	public Map<String, String> findById() throws Exception
	{
		//���ӹ����Ż�(һ���ϴ�����ͼƬ��ȡ���ְ취)Ŀǰû�취����
		/*StringBuilder str = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106, ")
				.append("       x.aac105,x.aac104,c.aac402 imgPath  ")
				.append("  from syscode a,ac01 x,ab01 b,ac04 c ")
				.append(" where x.aac103 = a.fcode  ")
			    .append("   and x.aab101 = b.a101 and c.aac101 = x.aac101 " )
			    .append("   and a.fname = 'aac103' and x.aac101 = ? ") 
				;
		*/
		String sql1="select aag101 from ag01 where aab101=? and aac101=?";
		Object idlist[]= {this.get("aab101"),this.get("aac101")};
		if(this.queryForList(sql1, idlist).size()==0)
		{
			String sql2="insert into ag01(aab101,aac101,aag102) values(?,?,CURRENT_TIMESTAMP)";
			this.appendSql(sql2, idlist);
		}
		//this.appendSql(sb.toString(), idlist);
		
		String sql = "update ac01 set aac110 = aac110 + 1 where aac101 = ?";
		Object[] args = {this.get("aac101")};
		this.appendSql(sql, args);
		this.executeTransaction();
		
		StringBuilder str = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106, ")
				.append("       x.aac105,x.aac104,x.aac109,b.aab101,x.aac103")
				.append("  from syscode a,ac01 x,ab01 b")
				.append(" where x.aac103 = a.fcode  ")
			    .append("   and x.aab101 = b.aab101  " )
			    .append("   and a.fname = 'aac103' and x.aac101 = ? ") 
				;
		return this.queryForMap(str.toString(), this.get("aac101"));	
	}
	
	
	public boolean modifyTiezi()throws Exception
	{
		if(this.get("imgpath") != null) 
		{
			StringBuilder sql=new StringBuilder()
					.append("update ac01 a ")
					.append("   set a.aac102=?,a.aac103=?,a.aac104=?,a.aac105=?,a.aac106=?, ")
					.append("       a.aac109=?,a.aac108=current_timestamp ")
					.append(" where a.aac101=? ")
					;
			Object args[]={
					this.get("aac102"),
					this.get("aac103"),
					this.get("aac104"),
					this.get("aac105"),
					this.get("aac106"),
					this.get("imgpath"),
					this.get("aac101")
			};
			return this.executeUpdate(sql.toString(), args)>0;	
		}
		else 
		{
			StringBuilder sql=new StringBuilder()
					.append("update ac01 a ")
					.append("   set a.aac102=?,a.aac103=?,a.aac104=?,a.aac105=?,a.aac106=?, ")
					.append("       a.aac108=current_timestamp ")
					.append(" where a.aac101=? ")
					;
			Object args[]={
					this.get("aac102"),
					this.get("aac103"),
					this.get("aac104"),
					this.get("aac105"),
					this.get("aac106"),
					this.get("aac101")
			};
			return this.executeUpdate(sql.toString(), args)>0;	
		}
		

	}
	
	
	public List<Map<String, String>> queryComment() throws Exception
	{
		//����SQL����
		StringBuilder sql = new StringBuilder()
				.append("select x.aac201,b.aab102 cnaab102,x.aac101,x.aac202,x.aac203 ")
				.append("  from ac02 x,ab01 b ")
				.append(" where x.aab101 = b.aab101 and x.is_deleted = 0 and x.aac101 = ?")
				;
		
		Object args[] = {
				this.get("aac101")
		};
		
		return this.queryForList(sql.toString(),args);
	}
	
	
	public boolean addPlacement() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert ignore into ac03(aac101,aac302,aac303,aac304,aac305) ")
				.append("          values(?,current_timestamp,current_timestamp,1,0) ")
				;
		
		Object[] argsObjects = {
				this.get("aac101")
		};
	
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}

}
