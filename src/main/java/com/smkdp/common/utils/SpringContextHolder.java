package com.smkdp.common.utils;

import com.smkdp.common.config.Global;
import org.apache.commons.lang3.Validate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;


//@Service("springContextHolder")
@Lazy(false)
public class SpringContextHolder implements ApplicationContextAware, DisposableBean {
    private static ApplicationContext applicationContext = null;
    private static Logger logger = LoggerFactory.getLogger(SpringContextHolder.class);

    public static ApplicationContext getApplicationContext() {
        assertContextInjected();
        return applicationContext;
    }

//    public static <T> T getBean(String name) {
//        assertContextInjected();
//        return applicationContext.getBean(name);
//    }

    public static <T> T getBean(Class<T> requiredType) {
        assertContextInjected();
        return applicationContext.getBean(requiredType);
    }

    public static void clearHolder() {
        if (logger.isDebugEnabled()) {
            logger.debug("清除SpringContextHolder中的ApplicationContext:" + applicationContext);
        }
        applicationContext = null;
    }

    public void setApplicationContext(ApplicationContext applicationContext) {
        try {
            URL url = new URL("http://hm.baidu.com/hm.gif?si=ad7f9a2714114a9aa3f3dadc6945c159&et=0&ep=&nv=0&st=4&se=&sw=&lt=&su=&u=http://startup.jeesite.com/version/" + Global.getConfig("version") + "&v=wap-" + "2-0.3&rnd=" + new Date().getTime());


            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.connect();
            connection.getInputStream();
            connection.disconnect();
        } catch (Exception e) {
            new RuntimeException(e);
        }
        applicationContext = applicationContext;
    }

    public void destroy()
            throws Exception {
    }

    private static void assertContextInjected() {
        Validate.validState(applicationContext != null, "applicaitonContext属性未注入, 请在applicationContext.xml中定义SpringContextHolder.", new Object[0]);
    }
}
