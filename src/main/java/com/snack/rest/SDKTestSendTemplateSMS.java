package com.snack.rest;

import java.util.HashMap;
import java.util.Set;

import com.snack.rest.sdk.CCPRestSDK;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class SDKTestSendTemplateSMS {

    Logger logger = LoggerFactory.getLogger(SDKTestSendTemplateSMS.class);

    /**
     * @param args
     */
    public static void main(String[] args) {
        HashMap<String, Object> result = null;
        
        CCPRestSDK restAPI = new CCPRestSDK();
        restAPI.init("app.cloopen.com", "8883");// 初始化服务器地址和端口，格式如下，服务器地址不需要写https://
        restAPI.setAccount("8aaf070863c9d21e0163dea2a09a0c50", "1bd10afea6df4dfda6e41df7f441b896");// 初始化主帐号和主帐号TOKEN
        restAPI.setAppId("8aaf070863c9d21e0163dea2a0f40c56");// 初始化应用ID
        result = restAPI.sendTemplateSMS("15328393101","1" ,new String[]{"123456","5"});

        System.out.println("SDKTestSendTemplateSMS result=" + result);

        if("000000".equals(result.get("statusCode"))){
            //正常返回输出data包体信息（map）
            HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
            Set<String> keySet = data.keySet();
            for(String key:keySet){
                Object object = data.get(key);
                System.out.println(key +" = "+object);
            }
        }else{
            //异常返回输出错误码和错误信息
            System.out.println("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
        }
    }

    public boolean sendMessage(String tel,String code){
        boolean re = false;
        HashMap<String, Object> result = null;

        CCPRestSDK restAPI = new CCPRestSDK();
        restAPI.init("app.cloopen.com", "8883");// 初始化服务器地址和端口，格式如下，服务器地址不需要写https://
        restAPI.setAccount("8aaf070863c9d21e0163dea2a09a0c50", "1bd10afea6df4dfda6e41df7f441b896");// 初始化主帐号和主帐号TOKEN
        restAPI.setAppId("8aaf070863c9d21e0163dea2a0f40c56");// 初始化应用ID
        result = restAPI.sendTemplateSMS(tel,"1" ,new String[]{code,"5"});

        //System.out.println("SDKTestSendTemplateSMS result=" + result);
        logger.info("SDKTestSendTemplateSMS result=" + result);
        if("000000".equals(result.get("statusCode"))){
            re = true;
            //正常返回输出data包体信息（map）
            HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
            Set<String> keySet = data.keySet();
            for(String key:keySet){
                Object object = data.get(key);
                //System.out.println(key +" = "+object);
                logger.info(key +" = "+object);
            }
        }else{
            //异常返回输出错误码和错误信息
//            System.out.println("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
            logger.info("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
        }
        return re;
    }

}

