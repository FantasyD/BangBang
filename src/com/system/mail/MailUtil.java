package com.system.mail;

import java.security.GeneralSecurityException;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.services.JdbcServicesSupport;
import com.sun.mail.util.MailSSLSocketFactory;

/**
 * @Description:
 *@author xzc
 */
public class MailUtil extends JdbcServicesSupport
{
	//发件人邮箱
	private static String eamilAccount=null;
	//发件人邮箱授权码
	private static String emailPassword=null;
	//发件人邮箱服务地址
	private static String emailSMTPHost=null;
	//收件人邮箱
	private static String receiveMailAccount="";
	
	static
	{
			ResourceBundle bundle=ResourceBundle.getBundle("MailOptions");
			eamilAccount=bundle.getString("EMAILACCOUNT");
			emailPassword=bundle.getString("EMAILPASSWORD");
			emailSMTPHost=bundle.getString("EMAILSMTPHOST");
	}
	
	public static void email(String receiveMailAccount,String code) throws Exception
	{
		Properties prop=new Properties();
		// 设置邮件服务器主机名
		prop.setProperty("mail.host", "smtp.qq.com");
		// 发送服务器需要身份验证
		prop.setProperty("mail.smtp.auth", "true");
		// 发送邮件协议名称
		prop.setProperty("mail.transport.protocol", "smtp");
		// 开启SSL加密，否则会失败
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.socketFactory", sf);
		// 创建session
		Session session = Session.getInstance(prop);
		// 通过session得到transport对象
		Transport ts = session.getTransport();
		// 连接邮件服务器：邮箱类型，帐号，POP3/SMTP协议授权码 163使用：smtp.163.com
		ts.connect(emailSMTPHost, eamilAccount, emailPassword);
		// 创建邮件
		Message message = createSimpleMail(session,receiveMailAccount,code);
		// 发送邮件
		ts.sendMessage(message, message.getAllRecipients());
		ts.close();
		
	}
	
	/**
	 * @Description	创建邮件
	 * @param session
	 * @return
	 */
	private static Message createSimpleMail(Session session,String receiveMailAccount,String code) throws Exception
	{
	// 创建邮件对象
	MimeMessage message = new MimeMessage(session);
	// 指明邮件的发件人
	message.setFrom(new InternetAddress(eamilAccount));
	// 指明邮件的收件人
	message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveMailAccount));
	// 邮件的标题
	message.setSubject("用户注册");
	// 邮件的文本内容
    message.setContent("欢迎您注册【BB】,账号注册验证码为(一分钟有效):"+code+",请勿回复此邮箱", "text/html;charset=UTF-8");
	
	// 返回创建好的邮件对象
	return message;

	}
}
