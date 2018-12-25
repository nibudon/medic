/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.snack.model.MedicineType;
import com.snack.service.MedicineTypeService;

/** 
 * ClassName: MedicineTypeController <br/> 
 * Function: TODO 功能描述 <br/> 
 * date: 2018年11月12日 下午9:42:58 <br/> 
 * 
 * @author 倪卟懂 
 * @version 1.0
 * @since JDK 1.8 
 */
@Controller
@RequestMapping("/medicineType")
public class MedicineTypeController {
	
	@Autowired
	private MedicineTypeService medicineTypeService;
	
	@RequestMapping("/getAllTypes.html")
	@ResponseBody
	public String getAllTypes() {
		List<MedicineType> list=medicineTypeService.getAllTypes();
		JSONArray json=new JSONArray();
		Object o=json.toJSON(list);
//		System.out.println(o.toString());
		return o.toString();
	}
	@RequestMapping("/typeManager.html")
	public String toTypeManager(HttpServletRequest request) {
		List<MedicineType> list=medicineTypeService.getAllTypes();
		request.setAttribute("typeList", list);
		return "admin/medicineType/typeManager";
	}
	@RequestMapping("/getTypeById.html")
	@ResponseBody
	public String getTypeById(HttpServletRequest request,int id) {
		MedicineType type=medicineTypeService.getTypeById(id);
		String json=JSONObject.toJSONString(type);
		return json;
	}
	@RequestMapping("/deleteType.html")
	public String deleteType(HttpServletRequest request,int id) {
		int r=medicineTypeService.deleteType(id);
		String message="";
		if(r>0) {
			return "redirect:/medicineType/typeManager.html";
		}
		return null;
	}
	@RequestMapping("/addType.html")
	public String addType(HttpServletRequest request,String typeName) {
		int r=medicineTypeService.addType(typeName);
		if(r>0) {
			return "redirect:/medicineType/typeManager.html";
		}
		return null;
	}
	@RequestMapping("/updateType.html")
	public String updateType(HttpServletRequest request,String typeName,int id) {
		int r=medicineTypeService.updateType(typeName,id);
		if(r>0) {
			return "redirect:/medicineType/typeManager.html";
		}
		return null;
	}

}
