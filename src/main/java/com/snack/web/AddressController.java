/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.snack.model.Address;
import com.snack.service.AddressService;

/** 
 * ClassName: AddressController <br/> 
 * Function: TODO 功能描述 <br/> 
 * date: 2018年12月12日 下午8:03:59 <br/> 
 * 
 * @author 倪卟懂 
 * @version 1.0
 * @since JDK 1.8 
 */
@Controller
@RequestMapping("/address/**")
public class AddressController {
	
	@Autowired
	private AddressService service;

	private Integer pageSize=5;
	
	@RequestMapping("/getMyAddress.html")
	@ResponseBody
	public String getAddress(Integer uId,HttpServletResponse response,HttpServletRequest request) {
		String result = "";
		int count=service.getMyAddressCount(uId);
		int totalPage=(count%pageSize==0)?count/pageSize:(count/pageSize)+1;
		request.setAttribute("totalPage",totalPage);
		request.setAttribute("count",count);
		List<Address> list=service.getMyAddress(uId);
		result = JSON.toJSONString(list);
		return result;
	}

	@RequestMapping("/addressManage.html")
	public String toAddressManage(Integer uId, Integer page,HttpServletRequest request) {
		if(uId ==null){
			uId=Integer.parseInt(request.getSession().getAttribute("frontuserId").toString());
		}
		if(page == null){
			page=Integer.parseInt(request.getSession().getAttribute("currentPage").toString());
		}
		int count=service.getMyAddressCount(uId);
		int totalPage=(count%pageSize==0)?count/pageSize:(count/pageSize)+1;
		request.setAttribute("totalPage",totalPage);
		request.setAttribute("pageSize",pageSize);
		request.setAttribute("currentPage",page);
		request.getSession().setAttribute("currentPage",page);
		request.setAttribute("count",count);
		List<Address> list=service.getMyAddressByPage(uId,page,pageSize);
		request.setAttribute("addressList",list);
		return "user/addressManage";
	}

	@RequestMapping("/getAddressById.html")
	@ResponseBody
	public String getAddressById(Integer id,HttpServletResponse response) {
		Address address=service.getMyAddressById(id);
		String result="";
		result = JSON.toJSONString(address);
		return result;
	}
	
	@RequestMapping("/addAddress.html")
	@ResponseBody
	public String addAddress(Address address,int page,HttpServletRequest request) {
		address.setIsDelete(0);
		Integer uId=Integer.parseInt(request.getSession().getAttribute("frontuserId").toString());
		address.setuId(uId);
		int result=0;
		String r="";
		result=service.addAddress(address);
		if(address.getIsDefault()==1){
			service.setDefault(result,uId);
		}
		if(result>0){
			r="{\"message\":\"添加成功\"}";
		}else{
			r="{\"message\":\"添加失败\"}";
		}
		int count=service.getMyAddressCount(uId);
		int totalPage=(count%pageSize==0)?count/pageSize:(count/pageSize)+1;
		request.getSession().setAttribute("totalPage",totalPage);
		request.getSession().setAttribute("pageSize",pageSize);
		request.getSession().setAttribute("currentPage",page);
		request.getSession().setAttribute("currentPage",page);
		request.getSession().setAttribute("count",count);
		List<Address> list=service.getMyAddressByPage(uId,page,pageSize);
		request.getSession().setAttribute("addressList",list);
		return r;
	}

	@RequestMapping("/updateAddress.html")
	@ResponseBody
	public String updateAddress(Address address,int page,HttpServletRequest request) {
		address.setIsDelete(0);
		Integer uId=Integer.parseInt(request.getSession().getAttribute("frontuserId").toString());
		int result=0;
		String r="";
		result=service.upAddress(address);
		if(address.getIsDefault()==1){
			service.setDefault(address.getId(),address.getuId());
		}
		if(result>0){
			r="{\"message\":\"修改成功\"}";
		}else{
			r="{\"message\":\"修改失败\"}";
		}
		int count=service.getMyAddressCount(uId);
		int totalPage=(count%pageSize==0)?count/pageSize:(count/pageSize)+1;
		request.getSession().setAttribute("totalPage",totalPage);
		request.getSession().setAttribute("pageSize",pageSize);
		request.getSession().setAttribute("currentPage",page);
		request.getSession().setAttribute("currentPage",page);
		request.getSession().setAttribute("count",count);
		List<Address> list=service.getMyAddressByPage(uId,page,pageSize);
		request.getSession().setAttribute("addressList",list);
		return r;
	}
	
	@RequestMapping("/setDefault.html")
	public String setDefault(Integer id,HttpServletRequest request) {
		Integer uId=Integer.parseInt(request.getSession().getAttribute("frontuserId").toString());
		int result=0;
		result=service.setDefault(id,uId);
		return null;
	}
	
	@RequestMapping("/deleteAddress.html")
	@ResponseBody
	public String deleteAddress(Integer id) {
		String r="";
		int result=0;
		result=service.deleteAddress(id);
		if(result>0){
			r="{\"message\":\"删除成功\"}";
		}else{
			r="{\"message\":\"删除失败\"}";
		}
		return r;
	}

}
