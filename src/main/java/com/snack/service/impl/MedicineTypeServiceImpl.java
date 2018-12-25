/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.snack.mapper.MedicineTypeMapper;
import com.snack.mapper.SnackinfoMapper;
import com.snack.model.MedicineType;
import com.snack.model.Snackinfo;
import com.snack.service.MedicineTypeService;

/** 
 * ClassName: MedicineTypeServiceImpl <br/> 
 * Function: TODO 功能描述 <br/> 
 * date: 2018年11月12日 下午9:34:12 <br/> 
 * 
 * @author 倪卟懂 
 * @version 1.0
 * @since JDK 1.8 
 */
@Service
public class MedicineTypeServiceImpl implements MedicineTypeService{
	
	@Autowired
	private MedicineTypeMapper mapper;
	
	@Autowired
	private SnackinfoMapper snackMapper;
	
	
	@Autowired
	private SnackinfoMapper snackinfoMapper;
	public List<MedicineType> getAllTypes(){
		return mapper.getAllTypes();
	}
	
	@Override
	public MedicineType getTypeById(int id) {
		return mapper.getTypeById(id);
	}

	@Override
	@Transactional
	public int deleteType(int id) {
		//删除当前类别下的所有药品
		MedicineType medicineType=mapper.getTypeWithSnackById(id);
		List<Snackinfo> snackinfos=medicineType.getSnackinfos();
		for(Snackinfo snackinfo : snackinfos) {
			snackMapper.deleteByPrimaryKey(snackinfo.getsId());
		}
		return mapper.deleteType(id);
	}

	@Override
	public int addType(String typeName) {
		return mapper.addType(typeName);
	}

	@Override
	public int updateType(String typeName, int id) {
		return mapper.updateType(typeName,id);
	}
	

}
