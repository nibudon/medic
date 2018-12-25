/*******************************************************************************
 * Copyright (c) 2010, 2030 www.itlaobing.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.snack.model;

import java.util.List;

/** 
 * ClassName: MedicineType <br/> 
 * Function: TODO 功能描述 <br/> 
 * date: 2018年11月12日 下午9:32:34 <br/> 
 * 
 * @author 倪卟懂 
 * @version 1.0
 * @since JDK 1.8 
 */
public class MedicineType {
	
	private Integer id;
	private String typeName;
	private Integer isDelete;
	private List<Snackinfo> snackinfos;
	
	public List<Snackinfo> getSnackinfos() {
		return snackinfos;
	}
	public void setSnackinfos(List<Snackinfo> snackinfos) {
		this.snackinfos = snackinfos;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	

}
