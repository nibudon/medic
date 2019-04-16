package com.snack.web;

import com.snack.model.Snackinfo;
import com.snack.service.shopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    public shopService shopService;

    @RequestMapping("/")
    public String toIndex(HttpServletRequest request){
        List<Snackinfo> HotSnackList = shopService.getHotSnack();
        List<Snackinfo> newSnackList = shopService.getNewSnack();
        request.setAttribute("HotSnackList",HotSnackList);
        request.setAttribute("newSnackList",newSnackList);
        return "user/index";
    }

    @RequestMapping("admin.html")
    public String toAdminLogin(HttpServletRequest request){
        return "admin/adminLogin";
    }

    @RequestMapping("paste.html")
    public String toPaste(HttpServletRequest request){
        return "redirect:/paste.jsp";
    }

}
