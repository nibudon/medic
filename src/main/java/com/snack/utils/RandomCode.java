package com.snack.utils;

import java.util.Random;

public class RandomCode {

    //生成六位随机数
    public static String randomCode(){
        Random random = new Random();
        Integer i = random.nextInt(899999)+100000;
        return String.valueOf(i);
    }
}
