/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.snack.model.MedicineType;

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
public interface MedicineTypeMapper {
	
	List<MedicineType> getAllTypes();
	
	MedicineType getTypeById(@Param("id") int id);
	
	MedicineType getTypeWithSnackById(@Param("id") int id);

	int deleteType(@Param("id") int id);

	int addType(@Param("typeName") String typeName);

	int updateType(@Param("typeName") String typeName, @Param("id") int id);

}
