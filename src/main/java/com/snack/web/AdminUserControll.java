package com.snack.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.snack.model.Role;
import com.snack.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.snack.model.Admin;
import com.snack.model.Userinfo;
import com.snack.model.domain.DoAdmin;
import com.snack.service.adminUserService;
import com.snack.utils.DataTables;
import com.snack.utils.MyMd5;
import com.snack.utils.PageHelp;
import com.snack.utils.ResponseUtil;

@Controller
@RequestMapping("/admin/user/")
public class AdminUserControll {
	
	@Autowired
	private adminUserService adminUserService;

	@Autowired
	private RoleService service;

	@RequestMapping("mainToUserinfo")
	public String mainToUserinfo(){
		return "admin/user/adminUserinfo";
	}
	
	//加载用户
	@RequestMapping("adminUserinfoLimit")
	@ResponseBody
	public DataTables adminUserinfoLimit(HttpServletRequest request,int start,int length,Userinfo userinfo){
		Map<Object,Object> map=new HashMap<Object, Object>();
		map.put("pageStart",start);
		map.put("pageSize",length);
		PageHelp<Userinfo> pageHelp= adminUserService.selectAdminUserinfoLimit(map,userinfo);
		DataTables datatable=new DataTables();
		datatable.setData(pageHelp.getList());
		datatable.setRecordsFiltered(pageHelp.getRecord());
		datatable.setRecordsTotal(pageHelp.getRecord());
		return datatable;
	}
	
	//删除用户
	@RequestMapping("delUserinfoById")
	@ResponseBody
	public String delUserinfoById(int uId,HttpServletRequest request){
		Admin a = (Admin) request.getSession().getAttribute("currentadmin");
		if(isAdmin(a)) {
			return ResponseUtil.successToClient(adminUserService.delUserinfoById(uId));
		}else{
			return "{\"admin\":\"false\"}";
		}
	}
	
	//更新加载用户
	@RequestMapping("updateGoUserinfoById")
	@ResponseBody
	public String updateGoUserinfoById(int uId){
		return ResponseUtil.successToClient(adminUserService.updateGoUserinfoById(uId));
	}
	
	//更新用户
	@RequestMapping("updateUserinfoById")
	@ResponseBody
	public String updateUserinfoById(Userinfo userinfo,HttpServletRequest request){
		Admin a = (Admin) request.getSession().getAttribute("currentadmin");
		if(isAdmin(a)) {
			return ResponseUtil.successToClient(adminUserService.updateUserinfoById(userinfo));
		}else{
			return "{\"admin\":\"false\"}";
		}
	}
	
	@RequestMapping("mainToAdmin")
	public String mainToAdmin(HttpServletRequest request){
		List<Role> rList=null;
		rList=service.getAllRoles();
		request.setAttribute("rList",rList);
		return "admin/user/adminAdmin";
	}

	//加载用户
	@RequestMapping("adminAdminLimit")
	@ResponseBody
	public DataTables adminAdminLimit(HttpServletRequest request,int start,int length,DoAdmin doAdmin){
		Map<Object,Object> map=new HashMap<Object, Object>();
		map.put("pageStart",start);
		map.put("pageSize",length);
		PageHelp<Admin> pageHelp= adminUserService.selectAdminLimit(map,doAdmin);
		DataTables datatable=new DataTables();
		datatable.setData(pageHelp.getList());
		datatable.setRecordsFiltered(pageHelp.getRecord());
		datatable.setRecordsTotal(pageHelp.getRecord());
		return datatable;
	}
	
	//新建
	@RequestMapping("addNewAdmin")
	@ResponseBody
	public String addNewAdmin(Admin admin,HttpServletRequest request){
		Admin a = (Admin) request.getSession().getAttribute("currentadmin");
		if(isAdmin(a)){
			admin.setAdPassword(MyMd5.getMd5(admin.getAdPassword()));
			return ResponseUtil.successToClient(adminUserService.addAdmin(admin));
		}else{
			return "{\"admin\":\"false\"}";
		}
	}
	
	//删除用户
	@RequestMapping("delAdminById")
	@ResponseBody
	public String delAdminById(Admin admin,HttpServletRequest request){
		Admin a = (Admin) request.getSession().getAttribute("currentadmin");
		if(isAdmin(a)) {
			return ResponseUtil.successToClient(adminUserService.delAdmin(admin));
		}else{
			return "{\"admin\":\"false\"}";
		}
	}
	
	//更新加载用户
	@RequestMapping("updateGoAdminById")
	@ResponseBody
	public String updateGoAdminById(HttpServletRequest request,Admin admin){
		return ResponseUtil.successToClient(adminUserService.selectAdminByOne(admin));
	}
	
	//更新用户
	@RequestMapping("updateAdminById")
	@ResponseBody
	public String updateAdminById(Admin admin,HttpServletRequest request){
		Admin a = (Admin) request.getSession().getAttribute("currentadmin");
		if(isAdmin(a)) {
			return ResponseUtil.successToClient(adminUserService.updateAdmin(admin));
		}else{
			return "{\"admin\":\"false\"}";
		}
	}

	public boolean isAdmin(Admin admin){
		boolean result = false;
		if(null != admin && admin.getRoleId()==1){
			result = true;
		}
		return result;
	}

}
