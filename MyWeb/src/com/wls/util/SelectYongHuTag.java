package com.wls.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.wls.entity.YongHu;
/**
 * 用户的自定义标签
 * @author wangmingshuai
 *
 */
public class SelectYongHuTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 符合条件的用户的List集合
	 */
	private List<YongHu> yonghuList;

	public List<YongHu> getyonghuList() {
		return yonghuList;
	}

	public void setyonghuList(List<YongHu> yonghuList) {
		this.yonghuList = yonghuList;
	}
	
	/**
	 * 自定义标签开始
	 */
	public int doStartTag() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<option value = '0'>请选择...</option>");
		if (yonghuList.size()>0) {
			for (YongHu yonghu : yonghuList) {
				buffer.append("<option value = '"+yonghu.getJinghao()+"' >" +yonghu.getXingming()+"</option>");
			}
		}
		
		JspWriter writer = pageContext.getOut();
		try {
			writer.print(buffer.toString());
			writer.flush();
		} catch (IOException e) {

		}
		return 0;
	}
}
