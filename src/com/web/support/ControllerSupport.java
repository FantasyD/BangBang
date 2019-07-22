package com.web.support;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import com.services.BaseServices;
import com.services.impl.Ac01ServicesImpl;
import com.services.impl.Ac03ServicesImpl;
import com.system.tools.Tools;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * ҵ���߼�������ܹ�ע��
	 *****************************************/

	private BaseServices services = null;

	/**
	 * ����ͨ���÷���,ΪServices�����������õľ��������
	 * 
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		this.services = services;
		// ͬ��ΪServices����DTO
		this.services.setMapDto(this.dto);
	}

	protected BaseServices getServices()
	{
		return this.services;
	}

	/*****************************************
	 * ����ҵ�����̷�װ
	 *****************************************/
	/**
	 * ����������ѯ
	 * 
	 * @throws Exception
	 */
	protected final void savePageData() throws Exception
	{
		List<Map<String, String>> rows = this.services.query();
		if (rows.size() > 0)
		{
			this.saveAttribute("rows", rows);
			this.saveAttribute("type", this.dto.get("type"));
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
		}
	}
	
	protected final void savePageDataToSession()throws Exception
	{
		List<Map<String, String>> rows = this.services.query();
		if (rows.size() > 0)
		{
			this.saveSession_attribute("cols", rows);
		}
		else
		{
			this.saveSession_attribute("msg", "û�з�������������!");
		}
	}
	
	
	/*****************************************
	 * �û���½�õ��ĺ���
	 *****************************************/

	/**
	 * ������֤�˺�
	 * @return
	 * @throws Exception
	 */
	protected final boolean saveUserPageInstance()throws Exception
	{
		Map<String, String> map = this.executeQueryMethod("check");
		if(map != null)
		{
			this.saveSession_attribute("userId", map.get("aab101"));
			this.dto.put("aab101", map.get("aab101"));
			this.saveSession_attribute("userName", map.get("aab102"));
			return true;
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:��½ʧ�ܣ��˺Ż������쳣��");
			return false;
		}	
	}
	
	protected final boolean saveAdminPageInstance()throws Exception
	{
		Map<String, String> map = this.executeQueryMethod("check");
		if(map != null)
		{
			this.saveSession_attribute("adminId", map.get("aab302"));
			return true;
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:��½ʧ�ܣ��˺Ż������쳣��");
			return false;
		}	
	}
	
	
	/**
	 * 
	 * @Description	ע����Ϣ��ʾ
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	protected final boolean is_receive(String methodName)throws Exception
	{
		if (this.executeUpdateMethod("receiveEmail")) 
		{
			return this.executeUpdateMethod(methodName);
		}
		return false;
	}
	
	
	
	
	/*****************************************
	 
	 *****************************************/
	
	
	/**
	 * ��һʵ�� ��ѯ
	 * 
	 * @throws Exception
	 */
	protected final void savePageInstance() throws Exception
	{
		Map<String, String> ins = this.services.findById();
		if (ins != null)
		{
			this.saveAttribute("ins", ins);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}
	}
	
	/**
	 * ͨ������ִ�в�ѯ����
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> executeQueryMethod(String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		return  (Map<String, String>)method.invoke(this.services);
	}
	
	/**
	 * ͨ������ִ�в�ѯ�������������ݴ���session
	 * @param utype
	 * @throws Exception
	 */
	protected final void QueryMapToSession(String methodName, String paraName, String sign)throws Exception
	{
		Map<String,String> ins=this.executeQueryMethod(methodName);
		if(ins!=null)
		{
			this.saveSession_attribute(paraName, ins);
			if(sign != null)
			{
				this.saveSession_attribute(sign, sign);
			}
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}
	}
	
	protected final void QueryMapToSession(String methodName, String paraName)throws Exception
	{
		this.QueryMapToSession(methodName, paraName, null);
	}

	/**
	 * ͨ������ִ�и��·���
	 * 
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName) throws Exception
	{
		// 1.��ȡ��Ҫ���õķ�������
		Method method = this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		// 2.���÷���
		return (boolean) method.invoke(services);
	}

	/**
	 * ������Ϊ���ܿ��� < ����Ϣ��ʾ >
	 * 
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName, String msgText) throws Exception
	{
		String msg = this.executeUpdateMethod(methodName) ? "�ɹ�!" : "ʧ��!";
		this.saveAttribute("msg", msgText + msg);
	}
	
	/**
	 * ���ط���ִ�н����update
	 * @param methodName
	 * @param S_msg   ����ִ�гɹ�ʱ�������Ϣ
	 * @param F_msg   ����ִ��ʧ��ʱ�������Ϣ
	 * @return
	 * @throws Exception
	 */
	protected final boolean update(String methodName, String S_msg, String F_msg)throws Exception
	{
		
		if (this.executeUpdateMethod(methodName)) 
		{
			this.saveAttribute("msg", S_msg);
			return true;	
		}
		this.saveAttribute("msg", F_msg);
		return false;
	}
	
	/**
	 * @Description: ���ؽ�����Ĵ�С
	 * @throws: sql���ִ�г���
	 */
	protected final int checkInfo()throws Exception
	{
		return this.services.query().size();
	}
	
	
	protected final int checkInfo(String methodName)throws Exception
	{
		// 1.��ȡ��Ҫ���õķ�������
		Method method = this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		return (int)method.invoke(services);
	}
	
	/**
	 * ���б�ŵ���Ϣ��ʾ�ĸ�����Ϊ
	 * 
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName, String typeText, String msgText, String key) throws Exception
	{
		String msg = typeText + "ʧ��!";
		if (this.executeUpdateMethod(methodName))
		{
			msg = msgText + "[ <msg> " + this.dto.get(key) + " </msg> ]";
		}
		// Servlet��ҳ���������
		this.saveAttribute("msg", msg);

	}

	/**
	 * ɾ��������ݼ���
	 * 
	 * @throws Exception
	 */
	protected final void savePageDataForDelete() throws Exception
	{
		List<Map<String, String>> rows = this.services.query();
		if (rows.size() > 0)
		{
			this.saveAttribute("rows", rows);
		}
	}

	/*****************************************
	 * ����������
	 *****************************************/
	private Map<String, Object> dto = null;

	@Override
	public final void setMapDto(Map<String, Object> dto)
	{
		this.dto = dto;
		// ͬ��ΪServices����DTO
		this.services.setMapDto(dto);
	}

	protected final void showDto()
	{
		System.out.println(this.dto);
	}
	
	protected Object getDtoObject(String key) {
		return this.dto.get(key);
	}

	/*****************************************
	 * ���������
	 *****************************************/
	private Map<String, Object> attribute = new HashMap<>();
	
	//��jspҳ���ӡ���
	private Map<String, Object> responseAttribute=new HashMap<>();
	
	//�������
	protected void setResponseAttribute(String name,String value)
	{
		this.responseAttribute.put(name, value);
	}
	
	//��ȡ���
	@Override
	public Map<String, Object> getResponseAttribute()
	{
		return this.responseAttribute;
	}
	
	protected final void saveAttribute(String key, Object value)
	{
		this.attribute.put(key, value);
	}

	@Override
	public final Map<String, Object> getAttribute()
	{
		return this.attribute;
	}
	
	/*****************************************
	 * 	        ��������� ��session
	 *****************************************/
    private Map<String, Object> session_attribute = new HashMap<>();
    protected final void saveSession_attribute(String key, Object value)
    {
    	this.session_attribute.put(key, value);
    }
    
    public final Map<String, Object> getSession_attribute()
    {
    	return this.session_attribute;
    }
}
