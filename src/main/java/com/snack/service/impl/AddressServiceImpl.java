/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.snack.mapper.AddressMapper;
import com.snack.model.Address;
import com.snack.service.AddressService;
import org.springframework.transaction.annotation.Transactional;

/** 
 * ClassName: AddressServiceImpl <br/> 
 * Function: TODO 功能描述 <br/> 
 * date: 2018年12月12日 下午8:39:37 <br/> 
 * 
 * @author 倪卟懂 
 * @version 1.0
 * @since JDK 1.8 
 */
@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressMapper mapper;
	
	@Override
	public List<Address> getMyAddressByPage(Integer uId,Integer page,Integer pageSize) {
		return mapper.getMyAddressByPage(uId,(page-1)*pageSize,pageSize);
	}

	@Override
	public List<Address> getMyAddress(Integer uId) {
		return mapper.getMyAddress(uId);
	}

	@Override
	public int getMyAddressCount(Integer uId){
		return mapper.getMyAddressCount(uId);
	}

	@Override
	public Address getMyAddressById(Integer id){
		return mapper.getAddressById(id);
	}

	@Override
	public int addAddress(Address address) {
		mapper.addAddress(address);
		return address.getId();
	}

	@Override
	public int upAddress(Address address) {
		int r=0;
		r=mapper.upAddress(address);
		return r;
	}

	@Override
	@Transactional
	public int setDefault(Integer id,Integer uId) {
		int r1=mapper.setOtherNotDefault(id,uId);
		return mapper.setDefault(id);
	}

	@Override
	public int deleteAddress(Integer id) {
		return mapper.deleteAddress(id);
	}

}
