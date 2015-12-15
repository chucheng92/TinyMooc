package com.tinymooc.common.tag.sensitivewordsTag;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;


import com.tinymooc.common.base.impl.BaseServiceImpl;
import com.tinymooc.common.domain.SensitiveWords;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


public class SensitiveWordTag extends TagSupport {
	
	private String originContent;
	
	
	public String getOriginContent() {
		return originContent;
	}

	public void setOriginContent(String originContent) {
		this.originContent = originContent;
	}

	@Override
	public int doStartTag() throws JspException{
		try{
			JspWriter out = this.pageContext.getOut();			
			ServletContext servletContext = pageContext.getServletContext();  
		    WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(servletContext); 
		    BaseServiceImpl service = (BaseServiceImpl) webApplicationContext.getBean("baseServiceImpl");
		    List<SensitiveWords> sensitiveWordList = service.queryAll(SensitiveWords.class);
		    for(int i = 0; i<sensitiveWordList.size(); i++){
		    	originContent = originContent.replaceAll(sensitiveWordList.get(i).getSensitiveWord(), sensitiveWordList.get(i).getReplaceWord());
		    }
		    System.out.println(originContent);
		    System.out.println(sensitiveWordList.size());
		    out.print(originContent);
		}catch( Exception e){
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
	
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}
	
	@Override

    public void release() {
        super.release();
        this.originContent = null;
    }
}
