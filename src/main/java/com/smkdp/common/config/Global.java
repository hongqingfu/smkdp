package com.smkdp.common.config;

import com.google.common.collect.Maps;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.lang.reflect.Field;
import java.util.Map;

import com.smkdp.common.utils.PropertiesLoader;
import com.smkdp.common.utils.StringUtils;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;

public class Global {
    private static Global global = new Global();
    private static Map<String, String> map = Maps.newHashMap();
    private static PropertiesLoader loader = new PropertiesLoader(new String[] { "easycare.properties", "baseconfig.properties" });
    public static final String SHOW = "1";
    public static final String HIDE = "0";
    public static final String YES = "1";
    public static final String NO = "0";
    public static final String TRUE = "true";
    public static final String FALSE = "false";

    public static Global getInstance()
    {
        return global;
    }

    public static String getConfig(String key)
    {
        String value = (String)map.get(key);
        if (value == null)
        {
            value = loader.getProperty(key);
            map.put(key, value != null ? value : "");
        }
        return value;
    }

    public static String getAdminPath()
    {
        return getConfig("adminPath");
    }

    public static String getFrontPath()
    {
        return getConfig("frontPath");
    }

    public static String getUrlSuffix()
    {
        return getConfig("urlSuffix");
    }

    public static Boolean isDemoMode()
    {
        String dm = getConfig("demoMode");
        return Boolean.valueOf(("true".equals(dm)) || ("1".equals(dm)));
    }

    public static String getMenuLayout()
    {
        String menuLayout = "top-menu";
        if (getConfig("menu.layout") != null) {
            menuLayout = getConfig("menu.layout");
        }
        return menuLayout;
    }

    public static Object getConst(String field)
    {
        try
        {
            return Global.class.getField(field).get(null);
        }
        catch (Exception e) {}
        return null;
    }

    public static String getProjectPath()
    {
        String projectPath = getConfig("projectPath");
        if (StringUtils.isNotBlank(projectPath)) {
            return projectPath;
        }
        try
        {
            File file = new DefaultResourceLoader().getResource("").getFile();
            if (file != null)
            {
                for (;;)
                {
                    File f = new File(file.getPath() + File.separator + "src" + File.separator + "main");
                    if ((f == null) || (f.exists())) {
                        break;
                    }
                    if (file.getParentFile() == null) {
                        break;
                    }
                    file = file.getParentFile();
                }
                projectPath = file.toString();
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return projectPath;
    }

    public static boolean printKeyLoadMessage()
    {
        StringBuilder sb = new StringBuilder();
        sb.append("\r\n======================================================================\r\n");

        sb.append("\r\n    欢迎使用 \r\n");
        sb.append("\r\n======================================================================\r\n");
        System.out.println(sb.toString());
        return true;
    }
}
