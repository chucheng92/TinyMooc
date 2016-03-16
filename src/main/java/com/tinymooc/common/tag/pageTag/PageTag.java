package com.tinymooc.common.tag.pageTag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class PageTag extends BodyTagSupport {

	private static final long serialVersionUID = -2852378754632688628L;
	private int curPage;
	private int totalPage;
	private int pageSize;
	private int totalRecord;
	private String url;
	private int limit = 5;

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		int limitMiddle = limit / 2 + 1;
		try {
			if (curPage == 1)
				out.println(printButton("left", false));
			else {
				out.println(printButton("left", true));
			}
			if (totalPage < limit + 8) {
				out.println(printPageAll());
			} else {
				if (curPage <= 4) {
					out.println(printPageLeft());
				} else if (curPage > totalPage - 4) {
					out.println(printPageRight());
				} else {
					if (curPage <= limitMiddle + 4) {
						out.println(printPageMiddle(5, limit + 4));
					} else if (curPage > (totalPage - 4 + limitMiddle)) {
						out.println(printPageMiddle(totalPage - limit - 3,
								totalPage - 4));
					} else {
						out.println(printPageMiddle(curPage - limitMiddle + 1,
								curPage + limitMiddle - 1));
					}
				}
			}
			if (curPage == totalPage)
				out.println(printButton("right", false));
			else {
				out.println(printButton("right", true));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_PAGE;
	}

	@Override
	public int doEndTag() throws JspException {
		return super.doEndTag();
	}

	private String printButton(String leftOrRight, boolean clickable) {
		String buttonStr = "";
		if (leftOrRight.equals("left")) {
			if (clickable) {
				buttonStr = "<a href=" + makeUrl(url,curPage-1)+">上一页</a>";
			} else {
				buttonStr = "<span>上一页</span>";
			}
		} else if (leftOrRight.equals("right")) {
			if (clickable) {
				buttonStr = "<a href=" +makeUrl(url,curPage+1)+ ">下一页</a>";
			} else {
				buttonStr = "<span>下一页</span>";
			}
		}
		return buttonStr;
	}

	private String printPageAll() {
		StringBuilder sb = new StringBuilder();
		for (int i = 1; i <= totalPage; i++) {
			if (i == curPage) {
				sb.append("<span class='current'>" + i + "</span>");
			} else {
				sb.append("<a href=" + makeUrl(url,i) + ">" + i
						+ "</a>");
			}
		}
		return sb.toString();
	}

	private String printPageLeft() {
		StringBuilder sb = new StringBuilder();
		for (int i = 1; i <= limit + 2; i++) {
			if (i == curPage) {
				sb.append("<span class='current'>" + i + "</span>");
			} else {
				sb.append("<a href=" + makeUrl(url,i) + ">" + i
						+ "</a>");
			}
		}
		sb.append("...");
		sb.append("<a href=" + makeUrl(url,totalPage-1) + ">"
				+ (totalPage - 1) + "</a>");
		sb.append("<a href=" + makeUrl(url,totalPage) + ">"
				+ totalPage + "</a>");
		return sb.toString();
	}

	private String printPageMiddle(int left, int right) {
		StringBuilder sb = new StringBuilder();
		sb.append("<a href=" + makeUrl(url,1) + ">" + 1 + "</a>");
		sb.append("<a href=" + makeUrl(url,2) + ">" + 2 + "</a>");
		sb.append("...");
		for (int i = left; i <= right; i++) {
			if (i == curPage) {
				sb.append("<span class='current'>" + i + "</span>");
			} else {
				sb.append("<a href=" + makeUrl(url,i) + ">" + i
						+ "</a>");
			}
		}
		sb.append("...");
		sb.append("<a href=" + makeUrl(url,totalPage-1) + ">"
				+ (totalPage - 1) + "</a>");
		sb.append("<a href=" + makeUrl(url,totalPage) + ">"
				+ totalPage + "</a>");
		return sb.toString();
	}

	private String printPageRight() {
		StringBuilder sb = new StringBuilder();
		sb.append("<a href=" + makeUrl(url,1) + ">" + 1 + "</a>");
		sb.append("<a href=" + makeUrl(url,2) + ">" + 2 + "</a>");
		sb.append("...");
		for (int i = totalPage - 1 - limit; i <= totalPage; i++) {
			if (i == curPage) {
				sb.append("<span class='current'>" + i + "</span>");
			} else {
				sb.append("<a href=" + makeUrl(url,i) + ">" + i
						+ "</a>");
			}
		}
		return sb.toString();
	}
	
	private String makeUrl(String url,int toPage){
		url=url.replaceAll("\\{curPage\\}", String.valueOf(toPage));
//		url=url.replaceAll("\\{pageSize\\}", String.valueOf(pageSize));
		return url;
	}
	
	

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

}
