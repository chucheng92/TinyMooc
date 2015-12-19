package com.tinymooc.handler.register.service;


import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.SendFailedException;

import javax.mail.Authenticator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class SendMailService {
	
	private final static String default_charset = "UTF-8";
	
	public static enum EncryptionTypes{
		Default, TLS, SSL
	}
	
	static final Log logger = LogFactory.getLog(SendMailService.class);
	
	private String mail_host = "";
	private int mail_port = 25;
	private int encryptionType = EncryptionTypes.Default.ordinal();
	private boolean auth = false;
	private String mail_host_account = "";
	private String mail_host_password = "";
	private boolean isHtml = false;

	public SendMailService(String mail_host){
		this.mail_host = mail_host;
	}	
	
	public SendMailService(String mail_host, boolean auth, String account, String password){
		this(mail_host, 25, EncryptionTypes.Default.ordinal(), auth, account, password);
	}
	
	public SendMailService(String mail_host,int mail_port, int encryptionType, boolean auth, String account, String password){
		this.mail_host = mail_host;
		this.mail_port = mail_port;
		this.encryptionType = encryptionType;
		this.auth = auth;
		this.mail_host_account = account;
		this.mail_host_password = password;
	}
	
	public SendMailService(String mail_host, boolean auth, String account, String password, boolean isHtml){
		this(mail_host, 25, EncryptionTypes.Default.ordinal(), auth, account, password, isHtml);
	}
	
	public SendMailService(String mail_host,int mail_port, int encryptionType, boolean auth, String account, String password, boolean isHtml){
		this.mail_host = mail_host;
		this.mail_port = mail_port;
		this.encryptionType = encryptionType;
		this.auth = auth;
		this.mail_host_account = account;
		this.mail_host_password = password;
		this.isHtml = isHtml;
	}

	/**
	 * Send email to a single recipient or recipient string.
	 * 
	 * @param senderAddress
	 *            the sender email address
	 * @param senderName
	 *            the sender name
	 * @param receiverAddress
	 *            the recipient email address
	 * @param sub
	 *            the subject of the email
	 * @param msg
	 *            the message content of the email
	 */
	public void sendEmail(String senderAddress,
			String senderName, String receiverAddress, String sub, String msg)
			throws Exception {
		String[] address = receiverAddress.split(";");
		List recipients = new ArrayList(); 
		for(int i=0;i<address.length;i++){
			if(address[i].trim().length()>0){
				recipients.add(address[i]);
			}
		}

		this.sendEmail(senderAddress, senderName, recipients, sub, msg);
	}
	
	public void sendEmail(String senderAddress,
			String senderName, List recipients, String sub, String msg)
			throws SendFailedException {
		this.sendEmail(senderAddress, senderName, recipients, sub, msg,null);
	}
	
	public void sendEmail(String senderAddress,
			String senderName, String receiverAddress, String sub, String msg, Collection attachments)
			throws Exception {
		String[] address = receiverAddress.split(";");
		List recipients = new ArrayList(); 
		for(int i=0;i<address.length;i++){
			if(address[i].trim().length()>0){
				recipients.add(address[i]);
			}
		}

		this.sendEmail(senderAddress, senderName, recipients, sub, msg, attachments);
	}

	/**
	 * Send email to a list of recipients.
	 * @param senderAddress
	 *            the sender email address
	 * @param senderName
	 *            the sender name
	 * @param recipients
	 *            a list of receipients email addresses
	 * @param sub
	 *            the subject of the email
	 * @param msg
	 *            the message content of the email
	 * @param attachments
	 *            attachments list of the email
	 */
	public void sendEmail(String senderAddress,
			String senderName, List recipients, String sub, String msg, Collection attachments)
			throws SendFailedException {
		
		logger.debug("mail subject: "+sub
				+" mail_port: "+this.mail_port
				+" encryptionType: "+this.encryptionType
				+" auth: "+this.auth
				+" mail_host_account: "+this.mail_host_account
				+" mail_host_password: "+this.mail_host_password);
		
		Transport transport = null;

		try {
			
			Properties props = this.getProperties();
			
			Session session = this.getSession(props);
			
			MimeMessage message = new MimeMessage(session);

			if(this.getDefaultIsHtml()){
				message.addHeader("Content-type", "text/html");
			}else{
				message.addHeader("Content-type", "text/plain");
			}
			
			message.setSubject(sub,default_charset);
			message.setFrom(new InternetAddress(senderAddress, senderName));

			for (Iterator it = recipients.iterator(); it.hasNext();) {
				String email = (String) it.next();
				message.addRecipients(Message.RecipientType.TO, email);
			}
			
			Multipart mp = new MimeMultipart();
			
			//content
			MimeBodyPart contentPart = new MimeBodyPart();
			
			if(this.getDefaultIsHtml()){
				contentPart.setContent("<meta http-equiv=Content-Type content=text/html; charset="+default_charset+">"+msg,"text/html;charset="+default_charset);
			}else{
				contentPart.setText(msg,default_charset);
			}
			
			mp.addBodyPart(contentPart);
			
			//attachment
			if(attachments!=null){
				MimeBodyPart attachPart;
                for(Iterator it = attachments.iterator(); it.hasNext();){
                	attachPart = new MimeBodyPart();
                    FileDataSource fds = new FileDataSource(it.next().toString().trim());
                    attachPart.setDataHandler(new DataHandler(fds));
                    if(fds.getName().indexOf("$")!=-1){
                    	attachPart.setFileName(fds.getName().substring(fds.getName().indexOf("$")+1,fds.getName().length()));
                    }else{
                    	attachPart.setFileName(fds.getName());
                    }
                    mp.addBodyPart(attachPart);
                }
				
			}
			
			message.setContent(mp);
			
			message.setSentDate(new Date());
			
			if(this.getDefaultEncryptionType() == EncryptionTypes.SSL.ordinal()){
				Transport.send(message);
			}else{
				transport = session.getTransport("smtp");				
				transport.connect(this.mail_host,
						this.mail_port,
						this.mail_host_account,
						this.mail_host_password);
				
				transport.sendMessage(message, message.getAllRecipients());				
			}

		} catch (Exception e) {
			logger.error("send mail error", e);
			throw new SendFailedException(e.toString());
		} finally{
			if(transport!=null){
				try{
					transport.close();
				}catch(Exception ex){
				}
			}
		}
	}
	
	private Properties getProperties(){
		
		Properties props = System.getProperties();
		
		int defaultEncryptionType = this.getDefaultEncryptionType();
		
		if(defaultEncryptionType == EncryptionTypes.TLS.ordinal()){
			props.put("mail.smtp.auth", String.valueOf(this.auth));
			props.put("mail.smtp.starttls.enable", "true");		
		}else if(defaultEncryptionType == EncryptionTypes.SSL.ordinal()){
			props.put("mail.smtp.host", this.mail_host);
			props.put("mail.smtp.socketFactory.port", this.mail_port);
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");			
			props.put("mail.smtp.debug", "true");			
			props.put("mail.smtp.auth", String.valueOf(this.auth));
			props.put("mail.smtp.port", this.mail_port);
		}else{
			props.put("mail.smtp.host", this.mail_host);
			props.put("mail.smtp.auth", String.valueOf(this.auth));				
		}

		return props;
	}
	
	private Session getSession(Properties props){
		Session session = null;
		
		if(this.getDefaultEncryptionType() == EncryptionTypes.TLS.ordinal()){
			session = Session.getInstance(props);
		}else if(this.getDefaultEncryptionType() == EncryptionTypes.SSL.ordinal()){
			session = Session.getInstance(props, new MyAuthenticator(this.mail_host_account, this.mail_host_password));
		}else{
			session = Session.getDefaultInstance(props,null);		
		}
		
		return session;
	}
	
	private boolean getDefaultIsHtml(){
		boolean rst = this.isHtml;	
		return rst;
	}
	
	private class MyAuthenticator extends Authenticator{
		String user;
		String password;
		public MyAuthenticator(){
			
		}
		
		public MyAuthenticator(String user, String password){
			this.user = user;
			this.password = password;
		}
		
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(this.user, this.password);
		}
	}
	
	/**
	 * get default encryption type,
	 * for 465, SSL
	 * for 25, TLS
	 * @return
	 */
	private int getDefaultEncryptionType(){
		int rst = this.encryptionType;
		if(this.encryptionType == EncryptionTypes.Default.ordinal()){
			if(this.mail_port==465){
				rst = EncryptionTypes.SSL.ordinal();
			}else if(this.mail_port==25){
				rst = EncryptionTypes.TLS.ordinal();
			}
		}
	
		return rst;
	}
}
