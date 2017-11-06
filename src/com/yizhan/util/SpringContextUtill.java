package com.yizhan.util;
/**
 * 代码由【萧邀阁】技术人员开发完成
 * 我们淘宝店铺：https://xiaoyaogeysq.taobao.com
 * 我们技术qq:2992014508
 * 萧邀阁学习网站：www.xyg520.cn
 * 加微信公众号：萧邀阁
 * 在学习中有任何问题可以联系我们技术qq.
 * */
/**
 * Copyright (c) 2005-2012 springside.org.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
*/

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 以静态变量保存Spring ApplicationContext, 可在任何代码任何地方任何时候取出ApplicaitonContext.
 * 
 * @author calvin
 */
public class SpringContextUtill{

    private static ApplicationContext applicationContext = null;
    /**
     * 取得存储在静态变量中的ApplicationContext.
     */
    public static ApplicationContext getApplicationContext() {
    	if(!(applicationContext!=null&&!"".equals(applicationContext))){
    		applicationContext=new ClassPathXmlApplicationContext("beans.xml");
    	}
    	
        return applicationContext;
    }

}
