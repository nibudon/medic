/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.utils;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import com.snack.model.domain.DoAdminOrder;

/** 
 * ClassName: ExcelUtil <br/> 
 * Function: TODO 功能描述 <br/> 
 * date: 2018年11月29日 下午2:22:03 <br/> 
 * 
 * @author 倪卟懂 
 * @version 1.0
 * @since JDK 1.8 
 */
public class ExcelUtil {
	
	/**
     * 订单导出Excel  
     * @return
     */ 
	public static HSSFWorkbook orderGetHSSFWorkbook(HttpServletRequest request,HttpServletResponse resp,List<DoAdminOrder> datas){

    	HSSFWorkbook wb = new HSSFWorkbook();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/x-download");

		String fileName = "订单详细"+System.currentTimeMillis()+".xls";
		try {
			fileName = URLEncoder.encode(fileName, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		resp.addHeader("Content-Disposition", "attachment;filename=" + fileName);
		HSSFSheet sheet = wb.createSheet("订单列表");
		sheet.setDefaultRowHeight((short) (2 * 256));
//		sheet.setColumnWidth(0, 50 * 160);
		sheet.setColumnWidth(0, 3766);   
		HSSFFont font = wb.createFont();
		font.setFontName("宋体");
		font.setFontHeightInPoints((short) 16);
		HSSFRow row = sheet.createRow((int) 0);
		sheet.createRow((int) 1);
		sheet.createRow((int) 2);
		sheet.createRow((int) 3);
		sheet.createRow((int) 4);
		sheet.createRow((int) 5);
		sheet.createRow((int) 6);
		sheet.createRow((int) 7);
		sheet.createRow((int) 8);
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setFillForegroundColor(HSSFColor.SKY_BLUE.index);//单元格背景色
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//图案类型
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);//单元格下边框为细线
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);//单元格左边框
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);//单元格右边框
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);//单元格上边框
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//单元格水平对齐方式
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setWrapText(true);
		HSSFCell cell = row.createCell(0);
		cell.setCellValue("序号 ");
		cell.setCellStyle(style);
		
		cell = row.createCell(1);
		cell.setCellValue("订单号 ");
		cell.setCellStyle(style);
		
		cell = row.createCell(2);
		cell.setCellValue("下单号 ");
		cell.setCellStyle(style);
		
		cell = row.createCell(3);
		cell.setCellValue("收货人");
		cell.setCellStyle(style);
		
		cell = row.createCell(4);
		cell.setCellValue("联系方式");
		cell.setCellStyle(style);
		
		cell = row.createCell(5);
		cell.setCellValue("地址");
		cell.setCellStyle(style);
		
		cell = row.createCell(6);
		cell.setCellValue("下单日期");
		cell.setCellStyle(style);
		
		cell = row.createCell(7);
		cell.setCellValue("操作员");
		cell.setCellStyle(style);
		
		cell = row.createCell(8);
		cell.setCellValue("状态");
		cell.setCellStyle(style);

		for (int i = 0; i < datas.size(); i++)
		{
			HSSFRow row1 = sheet.createRow((int) i + 1);
			DoAdminOrder wo = datas.get(i);
			row1.createCell(0).setCellValue(i + 1.0);
			row1.createCell(1).setCellValue(wo.getoId());//订单号
			row1.createCell(2).setCellValue(wo.getuUsername());//下单号
			row1.createCell(3).setCellValue(wo.getoName());//收货人
			row1.createCell(4).setCellValue(wo.getoPhone());//手机号
			row1.createCell(5).setCellValue(wo.getoAddress());//收货地址
			row1.createCell(6).setCellValue(wo.getoTime());//下单日期
			row1.createCell(7).setCellValue(null==wo.getAdUsername()?"未操作":wo.getAdUsername());//操作员
			row1.createCell(8).setCellValue(-1==wo.getoType()?"未付款,未发货":0==wo.getoType()?"已发货":1==wo.getoType()?"订单完成":"已付款，未发货");//业务类型
		}
		try
		{
			OutputStream out = resp.getOutputStream();
			wb.write(out);
			out.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return wb;
    }

}
