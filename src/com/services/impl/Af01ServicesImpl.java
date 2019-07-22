package com.services.impl;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;

public class Af01ServicesImpl extends JdbcServicesSupport
{
	/**
	 * ����һ��������Ϣ      
	 * aad104  1��ʾ�û���ɾ�������¼��0��ʾ�û�δɾ�������¼
	 * @return boolean
	 * @throws Exception
	 */
	public boolean addComplain() throws Exception
	{
		//��дSQL���--�����ݿ����һ���ٱ���Ϣ
		StringBuilder sql = new StringBuilder()
				.append("insert ignore into af01(aab101, aaf103, aaf104, aaf105, aaf106, ")
				.append("                 aaf107, aaf109)")
    			.append("          values(?, ?, ?, ?, ?,")
    			.append("                 '0', current_timestamp)")
				;
		Object[] argsObjects = {
				this.get("aab101"),
				this.get("aaf103"),
				this.get("aaf104"),
				this.get("aaf105"),
				URLDecoder.decode((String)this.get("aaf106"),"UTF-8")
		};
		//ִ�в���SQL���
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
	
	/**
	 * ����Ա��ѯ���й����û��ľٱ���Ϣ
	 * @return List<Map<String,String>>
	 * @throws Exception
	 */
	public List<Map<String,String>> findUserComp() throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append("select f.aaf101, b.aab102 complainer, b1.aab102 caller, sc.fvalue reason, ")
				.append("	    f.aaf106, sc1.fvalue hstatus, f.aaf108, f.aaf109, f.aaf103")
				.append("  from ab01 b, af01 f, ab01 b1, syscode sc, syscode sc1")
				.append(" where b.aab101 = f.aab101")
				.append("   and b1.aab101 = f.aaf104")
				.append("   and f.aaf105 = sc.fcode")
				.append("   and f.aaf107 = sc1.fcode")
				.append("   and sc.fname = 'aaf105'")
				.append("   and sc1.fname = 'aaf107'")
				.append("   and aaf103 = '1'")
				;
		return this.queryForList(str.toString());
	}
	
	/**
	 * ����Ա��ѯ���й������ӵľٱ���Ϣ
	 * @return List<Map<String,String>>
	 * @throws Exception
	 */
	public List<Map<String,String>> findTieComp() throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append("select f.aaf101, b.aab102 complainer, c.aac102 title, sc.fvalue reason, ")
				.append("	    f.aaf106, sc1.fvalue hstatus, f.aaf108, f.aaf109, f.aaf103")
				.append("  from ab01 b, af01 f, ac01 c, syscode sc, syscode sc1")
				.append(" where b.aab101 = f.aab101")
				.append("   and c.aac101 = f.aaf104")
				.append("   and f.aaf105 = sc.fcode")
				.append("   and f.aaf107 = sc1.fcode")
				.append("   and sc.fname = 'aaf105'")
				.append("   and sc1.fname = 'aaf107'")
				.append("   and aaf103 = '2'")
				;
		return this.queryForList(str.toString());
	}
	
	/**
	 * ����Ա��ѯ���й������Եľٱ���Ϣ
	 * @return List<Map<String,String>>
	 * @throws Exception
	 */
	public List<Map<String,String>> findCommentComp() throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append("select f.aaf101, b.aab102 complainer, c2.aac203 comment, sc.fvalue reason, ")
				.append("       f.aaf106, sc1.fvalue hstatus, f.aaf108, f.aaf109, f.aaf103")
				.append("  from ab01 b, af01 f, ac02 c2, syscode sc, syscode sc1")
				.append(" where b.aab101 = f.aab101")
				.append("   and c2.aac201 = f.aaf104")
				.append("   and f.aaf105 = sc.fcode")
				.append("   and f.aaf107 = sc1.fcode")
				.append("   and sc.fname = 'aaf105'")
				.append("   and sc1.fname = 'aaf107'")
				.append("   and aaf103 = '3'")
				;
		return this.queryForList(str.toString());
	}
	
	public List<Map<String,String>> query() throws Exception
	{
		List<Map<String,String>> result = new ArrayList<>();
		for(Map<String,String> map : findUserComp())
		{
			result.add(map);
		}
		for(Map<String,String> map : findTieComp())
		{
			result.add(map);
		}
		for(Map<String,String> map : findCommentComp())
		{
			result.add(map);
		}
		return result;
	}
	
	/**
	 * ����Ա����ٱ���Ϣ�����ٱ��û�
	 * @return
	 * @throws Exception
	 */
	public boolean handleUserComplain() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab01 ")
				.append("   set aab113 = aab113 - 10")
				.append(" where aab101 = ?")
				;
		
		return this.executeUpdate(sql.toString(), this.get("aab101")) > 0;
	}
	
	/**
	 * ����Ա����ٱ���Ϣ�����ٱ�����
	 * @return
	 * @throws Exception
	 */
	public boolean handleTieComplain() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab01 ")
				.append("   set aab113 = aab113 - 10")
				.append(" where aab101 = ?")
				;
		
		return this.executeUpdate(sql.toString(), this.get("aab101")) > 0;
	}
	
	/**
	 * ����Ա����ٱ���Ϣ�����ٱ�����
	 * @return
	 * @throws Exception
	 */
	public boolean handleCommentComplain() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab01 ")
				.append("   set aab113 = aab113 - 10")
				.append(" where aab101 = ?")
				;
		
		return this.executeUpdate(sql.toString(), this.get("aab101")) > 0;
	}
	
	/**
	 * ����Ա��ɴ���ٱ�����
	 * @return
	 * @throws Exception
	 */
	public boolean finishHandle() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update af01 ")
				.append("   set aaf107 = '1', aaf108 = current_timestamp")
				.append(" where aaf101 = ?")
				;
		
		return this.executeUpdate(sql.toString(), this.get("aaf101")) > 0;
	}
}
