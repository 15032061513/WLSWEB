package com.wls.util;
/**
 * 导出的副类
 * sjx
 */
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.CellView;
import jxl.format.UnderlineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

public class JxlExcelUtil {
	
	public static final int CEIL_WIDTH_NORMAL = 25;    //单元格宽
	public static final int FONT_SIZE_NORMAL = 10;     //字体大小
	public static final int FONT_SIZE_TITLE = 14;      //标题字体大小

	@SuppressWarnings("unused")
	private WritableWorkbook wwb;
	private WritableSheet wsh;
	
	public JxlExcelUtil(WritableWorkbook wwb, WritableSheet wsh) {
		this.wwb = wwb;
		this.wsh = wsh;
	}
	
	public void setExcelTitle (List<String> titlesNameList) throws Exception{
		for (int i = 0; i < titlesNameList.size(); i++) {
			// 设置行宽
			wsh.setColumnView(i, CEIL_WIDTH_NORMAL);
			                        //column, row, content, style
			Label label = new Label(i, 2, titlesNameList.get(i), getPOTitleFormat()); 
			wsh.addCell(label);
		}
	}

	@SuppressWarnings("rawtypes")
	public void setExcelContent(List<Map> reportDatas) throws Exception{
		for (int i = 0; i < reportDatas.size(); i++) {
			Map datasMap = reportDatas.get(i);
			
			// 商品的编
			Label labelGOODSID = new Label(0, i+2+1, setObjectToString(datasMap.get("GOODSID")), getPOContentRightFormat());
			wsh.addCell(labelGOODSID);
			
			// 商品类编
			Label labelKINDCODE = new Label(1, i+2+1, setObjectToString(datasMap.get("KINDCODE")), getPOContentRightFormat());
			wsh.addCell(labelKINDCODE);
			
			//商品的名
			Label labelNAME = new Label(2, i+2+1, setObjectToString(datasMap.get("NAME")), getPOContentLeftFormat());
			wsh.addCell(labelNAME);
			
			//商品的价
			Label labelPRICE = new Label(3, i+2+1, setObjectToString(datasMap.get("PRICE")), getPOContentRightFormat());
			wsh.addCell(labelPRICE);
			
			//更改的日
			Label labelDRLASTUPDATE = new Label(4, i+2+1, setObjectToString(datasMap.get("DRLASTUPDATE")), getPOContentCenterFormat());
			wsh.addCell(labelDRLASTUPDATE);
		}
	}

	/**
	 * 导出报表的http表头信息
	 * @param request
	 * @param response
	 * @param fileName
	 * @return   �?��输出�?
	 */
	public static OutputStream exportExcel(HttpServletRequest request, HttpServletResponse response, String fileName) {
		OutputStream os = null;
		try {
			if (request.getHeader("User-Agent").toLowerCase().indexOf("firefox") >0) {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
			}else if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") >0) {
				fileName = URLEncoder.encode(fileName, "UTF-8");//IE浏览�?
			}
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName +".xls\"");
			response.setBufferSize(1024);
			os = response.getOutputStream();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return os;
	}
	
	
	//--------------------------------字体的设�?-----------------------------------
	
	
	  //宋体�?4号，不加粗，无下划线
	public static  WritableFont getFontSizeType() throws WriteException{
		
		CellView cellView = new CellView();  
		cellView.setAutosize(true); //设置自动大小  
		
		//sheet.setColumnView(1, cellView);//根据内容自动设置列宽  
		
           
		WritableFont wfont = new WritableFont(
				WritableFont.createFont("宋体"),  
                14,   
                WritableFont.NO_BOLD,   
                false,  
                UnderlineStyle.NO_UNDERLINE
				);
		
		return wfont;
	}
	
	
	
	
	//黑色细体
	public static  WritableFont getBlackNoBoldFont() throws WriteException{

		WritableFont wfont = new WritableFont(WritableFont.ARIAL, FONT_SIZE_NORMAL, WritableFont.NO_BOLD, false, jxl.format.UnderlineStyle.NO_UNDERLINE);
		return wfont;
	}
	
	//黑色粗体
	public static WritableFont getBlackBoldFont() throws WriteException{

		WritableFont wfont = new WritableFont(WritableFont.ARIAL, FONT_SIZE_NORMAL, WritableFont.BOLD, false, jxl.format.UnderlineStyle.NO_UNDERLINE);
		return wfont;
	}
	
	// 黑色粗体加大
	public static WritableFont getBlackBoldBigFont() throws WriteException{

		WritableFont wfont = new WritableFont(WritableFont.ARIAL, FONT_SIZE_TITLE, WritableFont.BOLD, false, jxl.format.UnderlineStyle.NO_UNDERLINE);
		return wfont;
	}
	
	//-------------------------------位置的设�?----------------------------
	
	// jxl Title Format
	public static WritableCellFormat getPOTitleFormat() throws WriteException{
		WritableCellFormat ceilFormat = new WritableCellFormat(getBlackBoldBigFont());
		ceilFormat.setAlignment(jxl.format.Alignment.CENTRE);
		return ceilFormat;
	}
	
	
	// jxl Content Left Format
	public static WritableCellFormat getPOContentLeftFormat() throws WriteException{
		
		WritableCellFormat ceilFormat = new WritableCellFormat(
				getFontSizeType()
				                             );
		//ceilFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		ceilFormat.setAlignment(jxl.format.Alignment.LEFT);
		//ceilFormat.set
		return ceilFormat;
	}
	// jxl Content Right Format
	public static WritableCellFormat getPOContentRightFormat() throws WriteException{
		
		WritableCellFormat ceilFormat = new WritableCellFormat(getFontSizeType());
		//ceilFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		ceilFormat.setAlignment(jxl.format.Alignment.RIGHT);
		return ceilFormat;
	}
	// jxl Content Center Format
	public static WritableCellFormat getPOContentCenterFormat() throws WriteException{
		
		WritableCellFormat ceilFormat = new WritableCellFormat(getFontSizeType());
		//ceilFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		ceilFormat.setAlignment(jxl.format.Alignment.CENTRE);
		return ceilFormat;
	}
	
	public String setObjectToString (Object obj) {
		return obj == null ? "" : obj.toString();
	}
}
