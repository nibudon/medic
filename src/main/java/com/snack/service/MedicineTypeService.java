/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.service;

import java.util.List;

import com.snack.model.MedicineType;

/** 
 * ClassName: MedicineTypeService <br/> 
 * Function: TODO 功能描述 <br/> 
 * date: 2018年11月12日 下午9:34:02 <br/> 
 * 
 * @author 倪卟懂 
 * @version 1.0
 * @since JDK 1.8 
 */
public interface MedicineTypeService {

	List<MedicineType> getAllTypes();

	MedicineType getTypeById(int id);

	int deleteType(int id);

	int addType(String typeName);

	int updateType(String typeName, int id);
}
