package com.wls.util;
/**
 *导出util
 *sjx
 */
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Repository;
import jxl.Workbook;
import jxl.format.VerticalAlignment;
import jxl.write.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

@SuppressWarnings("deprecation")
@Repository
public class ExportTable {
	/**
	 * @param name  表头
	 * @param columnName 列名List<Object>
	 * @param map 列植Map<Object,List<Object>>
	 * @return Boolean
	 */
	public boolean JxlExportTable(String name,List<String> columnName,Map<Integer, List<String>> map,HttpServletRequest request, HttpServletResponse response){
		Date data = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//
		String data1 = df.format(data);
	
		try {
			OutputStream os = JxlExcelUtil.exportExcel(request, response,name+data1);
			WritableWorkbook wwb = Workbook.createWorkbook(os);
			WritableSheet wsh = wwb.createSheet(name, 0);

			WritableFont wfont1 = new WritableFont(WritableFont.ARIAL, 18);
			WritableCellFormat titleFormat1 = new WritableCellFormat(wfont1);
			titleFormat1.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);// 给单元格加边框
			titleFormat1.setAlignment(Alignment.CENTRE);		// 设置居中对齐

			WritableFont wfont2 = new WritableFont(WritableFont.ARIAL, 16);
			WritableCellFormat titleFormat2 = new WritableCellFormat(wfont2);
			titleFormat2.setVerticalAlignment(VerticalAlignment.CENTRE); // 设置居中对齐
			titleFormat2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);// 给单元格加边框
			titleFormat2.setAlignment(Alignment.CENTRE);  // 设置居中对齐
			titleFormat2.setBackground(jxl.format.Colour.GREY_25_PERCENT);// 单元格背景色

			WritableFont wfont3 = new WritableFont(WritableFont.ARIAL, 13,WritableFont.NO_BOLD, false,
					jxl.format.UnderlineStyle.NO_UNDERLINE,
					jxl.format.Colour.AUTOMATIC);
			WritableCellFormat titleFormat3 = new WritableCellFormat(wfont3);
			titleFormat3.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN);// 给单元格加边框
			titleFormat3.setAlignment(Alignment.CENTRE);// 设置居中对齐
			
			//设置列宽
			for(int i=0;i<columnName.size();i++){
				wsh.setColumnView(i, 20);
			}
			
			//生成列表头
			wsh.mergeCells(0, 0, columnName.size()-1, 2);
			Label label10 = new Label(0, 0, name, titleFormat1);
			wsh.addCell(label10);
			
			//生成列表体的列名
			for(int i = 0;i<columnName.size();i++){
				wsh.addCell(new Label(i, 3, columnName.get(i).toString(), titleFormat2));
			}
			
			//添加数据
			int i = 3;
			for (int j = 0; j < map.size(); j++) {
				i++;
				for(int x=0;x<columnName.size();x++){
					wsh.addCell( new Label(x, i, map.get(j).get(x).toString(),titleFormat3));
				}
			}
			
			wwb.write();
			wwb.close();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
}
