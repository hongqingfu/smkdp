package com.smkdp.common.persistence;

import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

public class Page<T> extends RowBounds {

    private int page = 1;                // 当前页数
    private int pageSize = 1;            // 每页显示行数
    private int totalCount;                // 总行数
    private int totalPages;                // 总页数

    private List<T> result = new ArrayList<T>();// 查询结果

    private int offset;                    // 偏移量 : 第一条数据在表中的位置
    private int limit;                    // 限定数 : 每页的数量

    private int length = 8;                // 页显示数
    private String funcName = "page";    // 点击页码调用的js函数名称，默认为page
    private int prev;                    // 上一页
    private int next;                    // 下一页

    public Page() {
        super();
        this.offset = (this.page - 1) * this.pageSize;
        this.limit = this.pageSize;
    }

    public Page(List<T> result) {
        this.result = result;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {

        this.page = page <= 0 ? 1 : page;
        this.offset = (this.page - 1) * this.pageSize;
        this.limit = this.pageSize;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {

        this.totalCount = totalCount;

        if (totalCount < 0) {

            this.totalPages = -1;
        }

        int pages = totalCount / this.pageSize;

        this.totalPages = totalCount % this.pageSize > 0 ? pages + 1 : pages;

        this.prev = this.page == 1 ? 1 : (this.page - 1);
        this.next = (this.page + 1) > this.totalPages ? this.totalPages : (this.page + 1);
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public String getFuncName() {
        return funcName;
    }

    public void setFuncName(String funcName) {
        this.funcName = funcName;
    }

    public int getPrev() {
        return prev;
    }

    public void setPrev(int prev) {
        this.prev = prev;
    }

    public int getNext() {
        return next;
    }

    public void setNext(int next) {
        this.next = next;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Page [page=").append(page).append(", pageSize=").append(pageSize).append(", results=")
                .append(getResult()).append(", totalCount=").append(totalCount).append(", totalPages=").append(totalPages)
                .append("]");
        return builder.toString();
    }
}
