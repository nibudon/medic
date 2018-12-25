package com.snack.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.snack.model.Snackinfo;
import com.snack.model.Userinfo;
import com.snack.model.domain.DoSnack;
import com.snack.model.domain.DoSnackType;
import com.snack.service.shopService;
import com.snack.utils.DataTables;
import com.snack.utils.MyMd5;
import com.snack.utils.PageHelp;

@Controller
@RequestMapping("/shop/")
public class ShopControll {
	
	@Autowired
	public shopService shopService=null;

	private Logger logger=LoggerFactory.getLogger(ShopControll.class);

	//主页
	@RequestMapping("index")
	public String gotoIndex(HttpServletRequest request){
		List<Snackinfo> HotSnackList = shopService.getHotSnack();
		List<Snackinfo> newSnackList = shopService.getNewSnack();
		request.setAttribute("HotSnackList",HotSnackList);
		request.setAttribute("newSnackList",newSnackList);
//		System.out.println("00");
		return "user/index";
	}
	
	//登录
	@RequestMapping("userLoginGet")
	public String gotoUserLogin(){
		return "user/userLogin";
	}
	
	@RequestMapping("userLoginPost")
	public String gotoUserLogin(Userinfo userinfo,HttpServletRequest request){
		userinfo.setuPassword(MyMd5.getMd5(userinfo.getuPassword()));
		Userinfo exituser =  shopService.userLogin(userinfo);
		if(exituser ==null){
			logger.debug(userinfo.getuUsername()+"用户名或密码错误!");
			request.setAttribute("msg","用户名或密码错误");
			return "user/userLogin";
		}
		logger.info(userinfo.getuUsername()+"登陆成功!");
		request.getSession().setAttribute("exituser", exituser);
		request.getSession().setAttribute("frontuser", exituser.getuUsername());
		request.getSession().setAttribute("frontuserId", exituser.getuId());
		request.getSession().setAttribute("money", exituser.getuMoney());
		return "redirect:index";
	}
	
	//退出登录
	@RequestMapping("userlogout")
	public String showlogin(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("frontuser");
		session.removeAttribute("frontuserId");
		return "redirect:userLoginGet";
	}
	
	
	//商品详情
	@RequestMapping("proDatail")
	public String gotoProDatail(HttpServletRequest request,Snackinfo snack){
		Snackinfo sck = shopService.selectById(snack);
		request.setAttribute("sck", sck);
		return "product/proDetail";
	}
	
	//查询订单
	@RequestMapping("selectOrderSnack")
	@ResponseBody
	public DataTables selectOrderSnack(String oId,int start,int length){
		Map<Object,Object> map=new HashMap<Object, Object>();
		map.put("oId", oId);
		map.put("pageStart",start);
		map.put("pageSize",length);
		PageHelp<DoSnack> pageHelp = shopService.selectOrderSnack(map);
		DataTables datatable=new DataTables();
		datatable.setData(pageHelp.getList());
		datatable.setRecordsFiltered(pageHelp.getRecord());
		datatable.setRecordsTotal(pageHelp.getRecord());
		return datatable;
	}
	
	//type页面
	@RequestMapping("puffingType")
	public String puffing(HttpServletRequest request,DoSnackType doSnackType,Integer sImported,String snackName){
		Snackinfo info=new Snackinfo();
		info.setsType(doSnackType.getType());
		info.setsImported(sImported);
		info.setsName(snackName);
		List<Snackinfo> TypeSnackList=shopService.selectPuffing(info);
		request.setAttribute("TypeNum",doSnackType.getType());
		request.setAttribute("TypeSnackList",TypeSnackList);
		return "user/typePage";
	}
	
}
