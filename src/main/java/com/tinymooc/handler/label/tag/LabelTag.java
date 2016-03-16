package com.tinymooc.handler.label.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class LabelTag extends BodyTagSupport {

	private static final long serialVersionUID = 3726042511333434223L;

	private String hotLabels;
	private String previousLabels;

	public String getHotLabels() {
		return hotLabels;
	}

	public void setHotLabels(String hotLabels) {
		this.hotLabels = hotLabels;
	}

	public String getPreviousLabels() {
		return previousLabels;
	}

	public void setPreviousLabels(String previousLabels) {
		this.previousLabels = previousLabels;
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		// 把从后台来的字符串处理成一个个label
		String[] itemValues = getItemValues(hotLabels);
		String[] previousItemValues = getItemValues(previousLabels);

		// 显示热门标签们
		StringBuilder sb = new StringBuilder();
		sb.append("<div class=\"hotLabelsTitle\">热门标签</div>");
		sb.append("<div class=\"tags\">");
		if (itemValues != null) {
			for (String value : itemValues) {

				// String[] idAndName = value.split(",");
				sb.append("<a class=\"tag\"" + "onclick=\""
						+ "addLabel('" + value + "','" + value + "')\">");
				sb.append(value);
				sb.append("</a>");
			}
		}
		sb.append("</div>");

		// 显示之前已经有的标签们
		sb.append("<div class=\"previousLabelsTitle\">我添加的标签</div>");
		sb.append("<div class=\"tags\">");

		sb.append("<span name=\"addlabelSpan\" id=\"addlabelSpan\">");
		if (previousItemValues != null) {
			for (String value : previousItemValues) {
				// String[] idAndName = value.split(",");
				sb.append("<a class=\"tag\""
						+ "onclick=\"delLabel(this,'" + value + "')\">");
				sb.append(value);
				sb.append("</a>");
			}
		}
		sb.append("</span>");

		// 新标签的输入
	/*	sb.append("<br>");
		sb.append("<div class=\"input-append\">");
		sb.append("<input type=\"text\"" + "class=\"span2\""
				+ "id=\"newLabelInput\"" + "\">");

		sb.append("<button type=\"button\"" + "class=\"btn\""
				+ "onclick=\"addNewLabel()\">");
		sb.append("+");
		sb.append("</button>");
		sb.append("</div>");*/
		// 把系统存在（之前的删减之后的+热门新增的）的标签的id隐藏保存在这个hidden中
		sb.append("<input type=\"hidden\" id=\"keyWordsHidden\" name=\"keyWordsHidden\" value=\"");
		if (previousItemValues != null) {
			for (String value : previousItemValues) {
				String[] idAndName = value.split(",");
				sb.append(idAndName[0] + ",");
			}
		}
		sb.append("\"/>");
		sb.append("</div>");

		try {
			out.println(sb.toString());
		} catch (IOException e) {
			throw new RuntimeException("Construct labels error");
		}
		return SKIP_PAGE;
	}

	@Override
	public int doEndTag() throws JspException {
		return super.doEndTag();
	}

	private String[] getItemValues(String labelsStr) {
		String[] result = new String[1];
		if (labelsStr == null || labelsStr.trim().equals("")) {
			return null;
		}

		// 直接给属性items 赋值, <tangs:button items="apple,orange,banana"/>
		if (labelsStr.contains(",")) { // 假设必须是多个
			return labelsStr.split(",");
		}
		// 通过JSP运行获取值,<tangs:button items="fruits"/>
		else {
			result[0] = labelsStr;
			return result;// 这样写，只支持struts2 的ongl语法
		}

	}
}
