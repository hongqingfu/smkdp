package com.smkdp.modules.gen.entity;

import com.smkdp.common.base.BaseEntity;

import java.util.ArrayList;
import java.util.List;

public class GenTable extends BaseEntity {

    private String name;            //表名

    private String comments;        //备注

    private String className;       //类名

    private String parentTable;     //关联父表

    private String parentTableFk;   //关联父表外键

    private List<GenTableColumn> columns = new ArrayList<>();//列

    private String nameLike;
    private List<String> pkList;
    private GenTable parent;
    private List<GenTable> childList = new ArrayList<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments == null ? null : comments.trim();
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public String getParentTable() {
        return parentTable;
    }

    public void setParentTable(String parentTable) {
        this.parentTable = parentTable;
    }

    public String getParentTableFk() {
        return parentTableFk;
    }

    public void setParentTableFk(String parentTableFk) {
        this.parentTableFk = parentTableFk;
    }

    public List<GenTableColumn> getColumns() {
        return columns;
    }

    public void setColumns(List<GenTableColumn> columns) {
        this.columns = columns;
    }

    public String getNameLike() {
        return nameLike;
    }

    public void setNameLike(String nameLike) {
        this.nameLike = nameLike;
    }

    public List<String> getPkList() {
        return pkList;
    }

    public void setPkList(List<String> pkList) {
        this.pkList = pkList;
    }

    public GenTable getParent() {
        return parent;
    }

    public void setParent(GenTable parent) {
        this.parent = parent;
    }

    public List<GenTable> getChildList() {
        return childList;
    }

    public void setChildList(List<GenTable> childList) {
        this.childList = childList;
    }
}