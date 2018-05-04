package com.smkdp.modules.gen.entity;


import com.smkdp.common.base.BaseEntity;

public class GenTableColumn extends BaseEntity {

    //归属表id
    private String genTableId;

    //名称
    private String name;

    //描述
    private String comments;

    //列的数据类型的字节长度
    private String jdbcType;

    //JAVA类型
    private String javaType;

    //JAVA字段名
    private String javaField;

    //是否主键
    private String isPk;

    //是否可为空
    private String isNull;

    //是否为插入字段
    private String isInsert;

    //是否编辑字段
    private String isEdit;

    //是否列表字段
    private String isList;

    //是否查询字段
    private String isQuery;

    //查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）
    private String queryType;

    //字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）
    private String showType;

    //字典类型
    private String dictType;

    //其它设置（扩展字段JSON）
    private String settings;

    //排序（升序）
    private Integer sort;


    public String getGenTableId() {
        return genTableId;
    }

    public void setGenTableId(String genTableId) {
        this.genTableId = genTableId == null ? null : genTableId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments == null ? null : comments.trim();
    }

    public String getJdbcType() {
        return jdbcType;
    }

    public void setJdbcType(String jdbcType) {
        this.jdbcType = jdbcType == null ? null : jdbcType.trim();
    }

    public String getJavaType() {
        return javaType;
    }

    public void setJavaType(String javaType) {
        this.javaType = javaType == null ? null : javaType.trim();
    }

    public String getJavaField() {
        return javaField;
    }

    public void setJavaField(String javaField) {
        this.javaField = javaField == null ? null : javaField.trim();
    }

    public String getIsPk() {
        return isPk;
    }

    public void setIsPk(String isPk) {
        this.isPk = isPk == null ? null : isPk.trim();
    }

    public String getIsNull() {
        return isNull;
    }

    public void setIsNull(String isNull) {
        this.isNull = isNull == null ? null : isNull.trim();
    }

    public String getIsInsert() {
        return isInsert;
    }

    public void setIsInsert(String isInsert) {
        this.isInsert = isInsert == null ? null : isInsert.trim();
    }

    public String getIsEdit() {
        return isEdit;
    }

    public void setIsEdit(String isEdit) {
        this.isEdit = isEdit == null ? null : isEdit.trim();
    }

    public String getIsList() {
        return isList;
    }

    public void setIsList(String isList) {
        this.isList = isList == null ? null : isList.trim();
    }

    public String getIsQuery() {
        return isQuery;
    }

    public void setIsQuery(String isQuery) {
        this.isQuery = isQuery == null ? null : isQuery.trim();
    }

    public String getQueryType() {
        return queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType == null ? null : queryType.trim();
    }

    public String getShowType() {
        return showType;
    }

    public void setShowType(String showType) {
        this.showType = showType == null ? null : showType.trim();
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType == null ? null : dictType.trim();
    }

    public String getSettings() {
        return settings;
    }

    public void setSettings(String settings) {
        this.settings = settings == null ? null : settings.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}