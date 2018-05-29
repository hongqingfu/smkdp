package com.smkdp.modules.gen.entity;


import com.smkdp.common.base.BaseEntity;

public class GenScheme extends BaseEntity {

    //方案名称
    private String name;

    //目录
    private String category;

    //包名
    private String packageName;

    //模块名
    private String moduleName;

    //子模块名
    private String subModuleName;

    //方法名
    private String functionName;

    //方法名简称
    private String functionNameSimple;

    //作者
    private String functionAuthor;

    //业务表
    private String genTableId;

    //业务表
    private GenTable genTable;

    //项目路径
    private String projectPath;

    //页面目录路径
    private String pagePath;

    //
    private String[] flags;

    private GenTable table;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category == null ? null : category.trim();
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName == null ? null : packageName.trim();
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName == null ? null : moduleName.trim();
    }

    public String getSubModuleName() {
        return subModuleName;
    }

    public void setSubModuleName(String subModuleName) {
        this.subModuleName = subModuleName == null ? null : subModuleName.trim();
    }

    public String getFunctionName() {
        return functionName;
    }

    public void setFunctionName(String functionName) {
        this.functionName = functionName == null ? null : functionName.trim();
    }

    public String getFunctionNameSimple() {
        return functionNameSimple;
    }

    public void setFunctionNameSimple(String functionNameSimple) {
        this.functionNameSimple = functionNameSimple == null ? null : functionNameSimple.trim();
    }

    public String getFunctionAuthor() {
        return functionAuthor;
    }

    public void setFunctionAuthor(String functionAuthor) {
        this.functionAuthor = functionAuthor == null ? null : functionAuthor.trim();
    }

    public String getGenTableId() {
        return genTableId;
    }

    public void setGenTableId(String genTableId) {
        this.genTableId = genTableId == null ? null : genTableId.trim();
    }

    public GenTable getGenTable() {
        return genTable;
    }

    public void setGenTable(GenTable genTable) {
        this.genTable = genTable;
    }

    public String getProjectPath() {
        return projectPath;
    }

    public void setProjectPath(String projectPath) {
        this.projectPath = projectPath;
    }

    public String getPagePath() {
        return pagePath;
    }

    public void setPagePath(String pagePath) {
        this.pagePath = pagePath;
    }

    public String[] getFlags() {
        return flags;
    }

    public void setFlags(String[] flags) {
        this.flags = flags;
    }

    public GenTable getTable() {
        return table;
    }

    public void setTable(GenTable table) {
        this.table = table;
    }
}