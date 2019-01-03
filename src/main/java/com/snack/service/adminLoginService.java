package com.snack.service;

import java.util.List;
import java.util.Map;

import com.snack.model.Admin;
import com.snack.model.AdminMenu;
import com.snack.model.AdminMenuChild;
import com.snack.model.Permission;

public interface adminLoginService {

	List<Admin> adminLogin(Admin admin);
	List<AdminMenu> selectAllAdminMenu();
	List<AdminMenuChild> selectAllAdminMenuChild();
	List<Permission> selectAllPermission();
	List<Permission> selectRolePermission(int roleId);

	int alterPass(Map<String,Object> map);
}
