/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.snack.model.Address;

/** 
 * ClassName: MedicineTypeMapper <br/> 
 * Function: TODO 功能描述 <br/> 
 * date: 2018年11月12日 下午9:36:04 <br/> 
 * 
 * @author 倪卟懂 
 * @version 1.0
 * @since JDK 1.8 
 */
@Repository
public interface AddressMapper {
	
	List<Address> getMyAddressByPage(@Param("uId")  Integer uId,@Param("page") Integer page,@Param("pageSize") Integer pageSize);

	List<Address> getMyAddress(Integer uId);

	int getMyAddressCount(Integer uId);

	Address getAddressById(Integer id);
	
	int addAddress(Address address);

	int upAddress(Address address);

	int setOtherNotDefault(@Param("id") Integer id,@Param("uId") Integer uId);
	
	int setDefault(Integer id);
	
	int deleteAddress(@Param("id") Integer id);

}
