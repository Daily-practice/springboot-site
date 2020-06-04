package com.site.springboot.core.test;

import org.junit.Test;

import static com.site.springboot.core.util.MD5Util.MD5Encode;

public class DemoTest {
    @Test
    public void aaa(){
        System.out.println(MD5Encode("123456",""));
    }
}
