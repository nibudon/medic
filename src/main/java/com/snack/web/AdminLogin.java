package com.snack.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.snack.mapper.AccountMapper;
import com.snack.model.Admin;
import com.snack.model.Permission;
import com.snack.service.adminLoginService;
import com.snack.utils.MyMd5;
import com.snack.utils.ResponseUtil;

@Controller
@RequestMapping("/admin/login/")
public class AdminLogin {
	
	@Autowired
	private adminLoginService adminLoginService;
	
	@Autowired
	private AccountMapper accountMapper;
	
	//登录login
	@RequestMapping("adminLogin")
	public String adminLogin(){
		return "admin/adminLogin";
	}


	//登录
	@RequestMapping("adminGoLogin")
	public String adminGoLogin(HttpServletRequest request,Admin admin){
		admin.setAdPassword(MyMd5.getMd5(admin.getAdPassword()));
		List<Admin> adminSelect = adminLoginService.adminLogin(admin);
		if(adminSelect.size()==1){
			request.getSession().setAttribute("adminName", adminSelect.get(0).getAdUsername());
			request.getSession().setAttribute("adminId", adminSelect.get(0).getAdId());
			request.getSession().setAttribute("adminPass", adminSelect.get(0).getAdPassword());
			List<Permission> allPer = adminLoginService.selectAllPermission();
			List<Permission> userPer = adminLoginService.selectRolePermission(adminSelect.get(0).getRoleId());
			request.getSession().setAttribute("allPer", allPer);
			request.getSession().setAttribute("userPer", userPer);
			return "redirect:adminGoMain";
		}
		request.setAttribute("msg","用户名或密码错误");
		return "admin/adminLogin";
	}
	
	//登录Main
	@RequestMapping("adminGoMain")
	public String adminLogin(HttpServletRequest request){
		request.setAttribute("adminMenu",adminLoginService.selectAllAdminMenu());
		request.setAttribute("adminMenuChild",adminLoginService.selectAllAdminMenuChild());
		return "admin/adminMain";
	}
	
	//退出
	@RequestMapping("adminMainToLoginOut")
	@ResponseBody
	public String adminMainToLoginOut(HttpServletRequest request){
		request.getSession().removeAttribute("adminName");
		return ResponseUtil.successToClient();
	}

	@RequestMapping("alertPass.html")
	@ResponseBody
	public String alterPass(Integer id,String oldPass,String cOldPass,String newPass,HttpServletRequest request){
		String myPass=request.getSession().getAttribute("adminPass").toString();
		String message="";
		int r=0;
		if(myPass!=null && !myPass.equals(oldPass)){
			message="{\"message\":\"原密码错误!\"}";
		}else{
			if(oldPass!=null && !myPass.equals(cOldPass)){
				message="{\"message\":\"两次密码不一致!\"}";
			}else{
				if(oldPass!=null && oldPass.equals(newPass)){
					message="{\"message\":\"新密码与原密码一致,请重新设置新密码!\"}";
				}else{
					//执行修改密码的操作
					Map<String,Object> map=new HashMap<String, Object>();
					map.put("newPass",newPass);
					map.put("id",id);
					r=adminLoginService.alterPass(map);
					if(r>0){
						message="{\"message\":\"密码修改成功!\"}";
					}else{
						message="{\"message\":\"密码修改失败!\"}";
					}
				}
			}
		}
		return message;
	}

}
