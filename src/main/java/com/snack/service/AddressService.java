/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.service;

import java.util.List;

import com.snack.model.Address;

/** 
 * ClassName: AddressService <br/> 
 * Function: TODO 功能描述 <br/> 
 * date: 2018年12月12日 下午8:39:02 <br/> 
 * 
 * @author 倪卟懂 
 * @version 1.0
 * @since JDK 1.8 
 */
public interface AddressService {
	
	List<Address> getMyAddressByPage(Integer uId,Integer page,Integer pageSize);

	List<Address> getMyAddress(Integer uId);

	int getMyAddressCount(Integer uId);

	Address getMyAddressById(Integer id);
	
	int addAddress(Address address);

	int upAddress(Address address);

	public int setDefault(Integer id,Integer uId);
	
	int deleteAddress(Integer id);

}
