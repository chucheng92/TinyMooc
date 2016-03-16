package com.tinymooc.authority.listener;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.tinymooc.common.base.impl.BaseServiceImpl;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


/**
 * 自定义监听器类。当工程部署完成后，系统会自动执行contextInitialized(ServletContextEvent arg0)
 * 用户同步工程中的所涉及到的用户权限方法到数据库中
 */

public class SyncAuthorityListener implements ServletContextListener {

	private Timer timer = new Timer(true);
	private long delay = 10000;

	public void contextDestroyed(ServletContextEvent agr0) {
		timer.cancel();
	}

	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("我开始了哦O(∩_∩)O~~");
		WebApplicationContext webApplicationContext=WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());
		BaseServiceImpl service=(BaseServiceImpl)webApplicationContext.getBean("baseServiceImpl");
		timer.schedule(new SyncAuthority(service,"com.tinymooc.handler","^.*Controller\\.class$"), delay);
	}

}
