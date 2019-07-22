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
	 * 业务逻辑组件及架构注入
	 *****************************************/

	private BaseServices services = null;

	/**
	 * 子类通过该方法,为Services变量传递引用的具体类对象
	 * 
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		this.services = services;
		// 同步为Services传递DTO
		this.services.setMapDto(this.dto);
	}

	protected BaseServices getServices()
	{
		return this.services;
	}

	/*****************************************
	 * 子类业务流程封装
	 *****************************************/
	/**
	 * 数据批量查询
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
			this.saveAttribute("msg", "没有符合条件的数据!");
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
			this.saveSession_attribute("msg", "没有符合条件的数据!");
		}
	}
	
	
	/*****************************************
	 * 用户登陆用到的函数
	 *****************************************/

	/**
	 * 用于验证账号
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
			this.saveAttribute("msg", "提示:登陆失败，账号或密码异常！");
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
			this.saveAttribute("msg", "提示:登陆失败，账号或密码异常！");
			return false;
		}	
	}
	
	
	/**
	 * 
	 * @Description	注册信息提示
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
	 * 单一实例 查询
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
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}
	}
	
	/**
	 * 通过反射执行查询方法
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> executeQueryMethod(String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
		return  (Map<String, String>)method.invoke(this.services);
	}
	
	/**
	 * 通过反射执行查询方法，并将数据存入session
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
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}
	}
	
	protected final void QueryMapToSession(String methodName, String paraName)throws Exception
	{
		this.QueryMapToSession(methodName, paraName, null);
	}

	/**
	 * 通过反射执行更新方法
	 * 
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	private boolean executeUpdateMethod(String methodName) throws Exception
	{
		// 1.获取需要调用的方法对象
		Method method = this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		// 2.调用方法
		return (boolean) method.invoke(services);
	}

	/**
	 * 更新行为的总开关 < 简单消息提示 >
	 * 
	 * @param utype
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName, String msgText) throws Exception
	{
		String msg = this.executeUpdateMethod(methodName) ? "成功!" : "失败!";
		this.saveAttribute("msg", msgText + msg);
	}
	
	/**
	 * 返回方法执行结果的update
	 * @param methodName
	 * @param S_msg   函数执行成功时存入的信息
	 * @param F_msg   函数执行失败时存入的信息
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
	 * @Description: 返回结果集的大小
	 * @throws: sql语句执行出错
	 */
	protected final int checkInfo()throws Exception
	{
		return this.services.query().size();
	}
	
	
	protected final int checkInfo(String methodName)throws Exception
	{
		// 1.获取需要调用的方法对象
		Method method = this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		return (int)method.invoke(services);
	}
	
	/**
	 * 带有编号的消息提示的更新行为
	 * 
	 * @param utype
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName, String typeText, String msgText, String key) throws Exception
	{
		String msg = typeText + "失败!";
		if (this.executeUpdateMethod(methodName))
		{
			msg = msgText + "[ <msg> " + this.dto.get(key) + " </msg> ]";
		}
		// Servlet向页面输出数据
		this.saveAttribute("msg", msg);

	}

	/**
	 * 删除后的数据检索
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
	 * 数据输入流
	 *****************************************/
	private Map<String, Object> dto = null;

	@Override
	public final void setMapDto(Map<String, Object> dto)
	{
		this.dto = dto;
		// 同步为Services传递DTO
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
	 * 数据输出流
	 *****************************************/
	private Map<String, Object> attribute = new HashMap<>();
	
	//向jsp页面打印输出
	private Map<String, Object> responseAttribute=new HashMap<>();
	
	//设置输出
	protected void setResponseAttribute(String name,String value)
	{
		this.responseAttribute.put(name, value);
	}
	
	//获取输出
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
	 * 	        数据输出流 向session
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
