package com.escst.hxgt.common.page;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import java.text.MessageFormat;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/***
 * 分页控件
 * @author caozx
 */
public class PagerTag extends TagSupport {

	private static final long serialVersionUID = 1L;

	private Integer curPage;
	private Integer totalPage;
	private Integer pageSize = 10;
	private Integer totalCount;
	private String formId;

	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}
	
	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public int doStartTag() throws JspException {

		JspWriter out = pageContext.getOut();

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String ctx = request.getContextPath();
		try {
			StringBuffer str = new StringBuffer();
			String onClass = "direct";
			String offClass = "direct";
			StringBuffer buffer = new StringBuffer();
			buffer.append("(function(link)'{'var url="+formId+".action;")
					.append("url=url.replace(/currentPage=.*($|&)/g,'''');")
					.append("url=url.replace(/&$/g,'''');")
					.append("url += ''&currentPage={0}'';")
					.append("if(url.indexOf(''?'')<0)url=url.replace(''&'',''?'');")
					.append("url=url.replace(''?&'',''?'');")
					.append("link.onclick='''';")
					.append(formId+".action=url;")
					.append(formId+".submit();'}')(this)");
			MessageFormat format = new MessageFormat("<a href=\"javascript:void(0);\" class=\"{1}\" onclick=\"{0}\">{2}</a> ");
			MessageFormat urlFormat = new MessageFormat(buffer.toString());
			str.append("<div class=\"nav_page\">");
			str.append("<p>");
			if (curPage <= 1) {
				str.append("<a href=\"javascript:void(0);\" class=\"direct\"><img src=\""+ctx+"/resources/static/images/de_lf_03.png\" /></a>");
			} else {
				str.append(format.format(new String[]{urlFormat.format(new Object[]{String.valueOf(curPage - 1)}), offClass, "<img src=\""+ctx+"/resources/static/images/de_lf_03.png\" />"}));
			}
			Set<Integer> set = new HashSet<Integer>();
			set.add(1);
			set.add(totalPage);
			set.add(totalPage - 1);
			set.add(curPage);
			for (int i = 1; i <= 2; i++) {
				set.add(curPage - i);
				set.add(curPage + i);
			}
			Iterator<Integer> iterator = set.iterator();
			while (iterator.hasNext()) {
				int i = iterator.next();
				if (i <= 0 || i > totalPage) {
					iterator.remove();
				}
			}
			Integer[] arr = new Integer[set.size()];
			set.toArray(arr);
			Arrays.sort(arr);
			for (int i = 0; i < arr.length; i++) {
				if (i > 0 && (arr[i] - arr[i - 1]) > 1) {
					str.append("<span class=\"omit\">···</span>");
				}
				str.append(format.format(new String[]{urlFormat.format(new Object[]{String.valueOf(arr[i])}), arr[i] == curPage ? onClass : offClass, arr[i] + ""}));
			}
			if (curPage >= totalPage) {
				str.append("<a href=\"javascript:void(0);\" class=\"direct\"><img src=\""+ctx+"/resources/static/images/de_ri_03.png\" /></a>");
			} else {
				str.append(format.format(new String[]{urlFormat.format(new Object[]{String.valueOf(curPage + 1)}), offClass, "<img src=\""+ctx+"/resources/static/images/de_ri_03.png\" />"}));
			}
			str.append("<span>共" + totalCount + "条记录</span>&nbsp;<span>当前第"+curPage+"页");
			str.append("</p>");
			str.append("</div>");
			out.print(str.toString());
		}catch (Exception e)
		{
			e.printStackTrace();
		}

		return super.doStartTag();

	}

}
