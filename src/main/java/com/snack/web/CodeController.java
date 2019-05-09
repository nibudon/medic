package com.snack.web;

import com.snack.rest.SDKTestSendTemplateSMS;
import com.snack.utils.RandomCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Random;

@RequestMapping("/code")
@Controller
public class CodeController {

    Logger logger = LoggerFactory.getLogger(CodeController.class);

    @RequestMapping("/getCode.html")
    @ResponseBody
    public String getCode(String tel, HttpServletRequest request){
        String r = "";
        SDKTestSendTemplateSMS sendMSG = new SDKTestSendTemplateSMS();
        String rCode = RandomCode.randomCode();
        logger.info("验证码 : "+rCode);
        request.getSession().setAttribute("code",rCode);
        boolean result = sendMSG.sendMessage(tel,rCode);
//        boolean result = true;
        if(result){
            r = "{\"success\":\"true\",\"code\":\""+rCode+"\"}";
        }else{
            r = "{\"success\":\"false\"}";
        }
        return r;
    }
}
