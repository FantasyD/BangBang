package com.services.impl;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

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
				.append("insert into af01(aab101, aaf103, aaf104, aaf105, aaf106, ")
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
				.append("	    f.aaf106, sc1.fvalue hstatus, f.aaf108, f.aaf109, f.aaf103,f.aaf107,f.aaf110,b1.aab101 ")
				.append("  from ab01 b, af01 f, ab01 b1, syscode sc, syscode sc1")
				.append(" where b.aab101 = f.aab101")
				.append("   and b1.aab101 = f.aaf104")
				.append("   and f.aaf105 = sc.fcode")
				.append("   and f.aaf107 = sc1.fcode")
				.append("   and sc.fname = 'aaf105'")
				.append("   and sc1.fname = 'aaf107'")
				.append("   and aaf103 = '1'")
				;
		
		Object[] args = {this.get("aaf101")};
		
		if(this.get("aaf101")!=null) {
			str.append(" and aaf101 = ?");
			return this.queryForList(str.toString(),args);
		}else {
			return this.queryForList(str.toString());
		}
		
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
				.append("	    f.aaf106, sc1.fvalue hstatus, f.aaf108, f.aaf109, f.aaf103,f.aaf107,f.aaf110, ")
				.append("       c.aac101,c.aac104,c.aac106,c.aac108,c.aac109 imgpath,b.aab101 ")
				.append("  from ab01 b, af01 f, ac01 c, syscode sc, syscode sc1")
				.append(" where b.aab101 = f.aab101")
				.append("   and c.aac101 = f.aaf104")
				.append("   and f.aaf105 = sc.fcode")
				.append("   and f.aaf107 = sc1.fcode")
				.append("   and sc.fname = 'aaf105'")
				.append("   and sc1.fname = 'aaf107'")
				.append("   and aaf103 = '2' ")
				;
		
		Object[] args = {this.get("aaf101")};
		
		if(this.get("aaf101")!=null) {
			str.append(" and aaf101 = ?");
			return this.queryForList(str.toString(),args);
		}else {
			return this.queryForList(str.toString());
		}
		
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
				.append("       f.aaf106, sc1.fvalue hstatus, f.aaf108, f.aaf109, f.aaf103,f.aaf107,f.aaf110,c2.aac201  ")
				.append("  from ab01 b, af01 f, ac02 c2, syscode sc, syscode sc1")
				.append(" where b.aab101 = f.aab101")
				.append("   and c2.aac201 = f.aaf104")
				.append("   and f.aaf105 = sc.fcode")
				.append("   and f.aaf107 = sc1.fcode")
				.append("   and sc.fname = 'aaf105'")
				.append("   and sc1.fname = 'aaf107'")
				.append("   and aaf103 = '3'")		
				;
		
		Object[] args = {this.get("aaf101")};
		
		if(this.get("aaf101")!=null) {
			str.append(" and aaf101 = ?");
			return this.queryForList(str.toString(),args);
		}else {
			return this.queryForList(str.toString());
		}
		
	}
	
	
	public Map<String,String> findById() throws Exception
	{
		String sql1 = "select aaf103 from af01 where aaf101 = ?";
		Object[] args1 = {this.get("aaf101")};		
		Map<String, String> ins = this.queryForMap(sql1, args1);
		
		if(ins.get("aaf103").equals("1"))
		{
			this.put("aab101", findUserComp().get(0).get("aab101"));					
			Map<String, String> map2 = this.findUserInfo(findUserComp().get(0).get("aab101"));
			Set<Entry<String, String>> set = findUserComp().get(0).entrySet();	
			for (Entry<String, String> entry : set) {
				map2.put(entry.getKey(), entry.getValue());
			}
			return map2;
		}
		
		if(ins.get("aaf103").equals("2")) 
		{
			return findTieComp().get(0);
		}
		
		if(ins.get("aaf103").equals("3")) 
		{
			return findCommentComp().get(0);
		}	
		
		return null;
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
		this.put("aab101", findUserComp().get(0).get("aab101"));	
		StringBuilder sql = new StringBuilder()
				.append("update ab01 ")
				.append("   set aab113 = aab113 - 10")
				.append(" where aab101 = ?")
				;
		boolean temp = this.finishHandle("���û����������ѱ�����");
		this.put("aaf101", null);
		
		return this.executeUpdate(sql.toString(), this.get("aab101")) > 0;
	}
	
	/**
	 * ����Ա����ٱ���Ϣ�����ٱ�����
	 * @return
	 * @throws Exception
	 */
	public boolean handleTieComplain() throws Exception
	{
		//ɾ�����ӺͶ�Ӧ������
		String sql = "update ac01 set is_deleted = 1 where aac101 = ?";
		String sql2 = "update ac02 set is_deleted = 1 where aac101 = ?";
		Object[] args = {this.get("aac101")};
		this.batchUpdate(sql2, args);
		this.batchUpdate(sql, args);
		this.executeTransaction();
		//���ľٱ������
		boolean temp = this.finishHandle("�������ѱ�ɾ��");
		this.put("aaf101", null);
		return temp;	
	}
	
	/**
	 * ����Ա����ٱ���Ϣ�����ٱ�����
	 * @return
	 * @throws Exception
	 */
	public boolean handleCommentComplain() throws Exception
	{
		String sql = "update ac02 set is_deleted = 1 where aac201 = ?";
		this.executeUpdate(sql, this.get("aac201"));
		
		boolean temp = this.finishHandle("�������ѱ�ɾ��");
		this.put("aaf101", null);
		
		return temp;
	}
	
	/**
	 * ����Ա��ɴ���ٱ�����
	 * @return
	 * @throws Exception
	 */
	public boolean finishHandle(String msg) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update af01 ")
				.append("   set aaf107 = '1', aaf108 = current_timestamp,aaf110=?")
				.append(" where aaf101 = ?")
				;
		
		return this.executeUpdate(sql.toString(), msg,this.get("aaf101")) > 0;
	}
	
	public boolean updateComplainState() throws Exception
	{
		boolean temp = this.finishHandle("��������Ա���,�þٱ���Ч,�ٱ���������");
		this.put("aaf101", null);
		return temp;
	}
	
	
	
	private Map<String, String> findUserInfo(String aab101) throws Exception 
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab103,a.aab104,b.fvalue cnaab105,a.aab107,")
				.append("       a.aab108,a.aab109,a.aab110,a.aab111,a.aab112,")
				.append("       a.aab113,a.aab114,a.aab115,a.is_onLine")
				.append("  from ab01 a,syscode b")
				.append(" where a.aab105 = b.fcode and b.fname = 'aab105' ")
				.append("   and a.aab101=?");
		
		return this.queryForMap(sql.toString(), aab101);
	}
}