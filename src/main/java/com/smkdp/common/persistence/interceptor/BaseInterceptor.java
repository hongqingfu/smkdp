package com.smkdp.common.persistence.interceptor;

import java.io.Serializable;
import java.util.Properties;

import com.smkdp.common.config.Global;
import com.smkdp.common.persistence.Page;
import com.smkdp.common.persistence.dialect.Dialect;
import com.smkdp.common.persistence.dialect.db.*;
import com.smkdp.common.utils.Reflections;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Invocation;

public class BaseInterceptor implements Interceptor, Serializable {

    private static final long serialVersionUID = 1L;
    protected static final String PAGE = "page";
    protected static final String DELEGATE = "delegate";
    protected static final String MAPPED_STATEMENT = "mappedStatement";
    protected Log log = LogFactory.getLog(getClass());
    protected Dialect DIALECT;

    protected static Page<Object> convertParameter(Object parameterObject, Page<Object> page)
    {
        try
        {
            if ((parameterObject instanceof Page)) {
                return (Page)parameterObject;
            }
            return (Page) Reflections.getFieldValue(parameterObject, "page");
        }
        catch (Exception e) {}
        return null;
    }

    protected void initProperties(Properties p)
    {
        Dialect dialect = null;
        String dbType = Global.getConfig("jdbc.type");
        if ("db2".equals(dbType)) {
            dialect = new DB2Dialect();
        } else if ("derby".equals(dbType)) {
            dialect = new DerbyDialect();
        } else if ("h2".equals(dbType)) {
            dialect = new H2Dialect();
        } else if ("hsql".equals(dbType)) {
            dialect = new HSQLDialect();
        } else if ("mysql".equals(dbType)) {
            dialect = new MySQLDialect();
        } else if ("oracle".equals(dbType)) {
            dialect = new OracleDialect();
        } else if ("postgre".equals(dbType)) {
            dialect = new PostgreSQLDialect();
        } else if (("mssql".equals(dbType)) || ("sqlserver".equals(dbType))) {
            dialect = new SQLServer2005Dialect();
        } else if ("sybase".equals(dbType)) {
            dialect = new SybaseDialect();
        }
        if (dialect == null) {
            throw new RuntimeException("mybatis dialect error.");
        }
        this.DIALECT = dialect;
    }

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        return null;
    }

    @Override
    public Object plugin(Object o) {
        return null;
    }

    @Override
    public void setProperties(Properties properties) {

    }
}
