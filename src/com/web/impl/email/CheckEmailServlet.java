package com.web.impl.email;

import java.sql.Time;

import com.services.impl.CheckAh01ServicesImpl;
import com.web.support.ControllerSupport;

/**
 * @Description: ȷ���û��Ƿ����δ���ʼ�
 * @author: ��־��
 */
public class CheckEmailServlet extends ControllerSupport
{
	public CheckEmailServlet()
	{
		this.setServices(new CheckAh01ServicesImpl());
	}
	@Override
	public String execute() throws Exception
	{
		/**
		 * ���������������ѯ�ʣ�
		 * ���������ݸ���ʱ������Ϣ��
		 * ����һֱ����ֱ����ʱ
		 */
		while(true)
		{
			int num=this.checkInfo();
			if(num>0)
			{
				//���Ƹ�����ʾ
				this.setResponseAttribute("emailNum", String.valueOf(num));
				//����������ʾ
				this.saveSession_attribute("emailNum", String.valueOf(num));
				break;
			}
			Thread.sleep(10*1000);	//˯��10����ٲ�ѯ
		}
		return null;
	}

}
