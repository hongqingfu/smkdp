package com.smkdp.common.persistence;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.smkdp.common.config.Global;
import com.smkdp.common.utils.CookieUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class Page<T> implements Serializable {
    private static final long serialVersionUID = -5021619094785456065L;
    private int page = 1;
    private int pageSize = Integer.valueOf(Global.getConfig("page.pageSize")).intValue();
    private long count;
    private int first;
    private int last;
    private int prev;
    private int next;
    private boolean firstPage;
    private boolean lastPage;
    private int length = 8;
    private int slider = 1;
    private List<T> list = new ArrayList();
    private String orderBy = "";
    private String funcName = "page";
    private String funcParam = "";
    private String message = "";
    private int take;
    private int skip;

    public Page() {
        this.pageSize = -1;
    }

    public Page(HttpServletRequest request, HttpServletResponse response) {
        this(request, response, -2);
    }

    public Page(HttpServletRequest request, HttpServletResponse response, int defaultPageSize) {
        String no = request.getParameter("page");
        if (StringUtils.isNumeric(no)) {
            CookieUtils.setCookie(response, "page", no);
            setPage(Integer.parseInt(no));
        } else if (request.getParameter("repage") != null) {
            no = CookieUtils.getCookie(request, "page");
            if (StringUtils.isNumeric(no)) {
                setPage(Integer.parseInt(no));
            }
        }
        String size = request.getParameter("pageSize");
        if (StringUtils.isNumeric(size)) {
            CookieUtils.setCookie(response, "pageSize", size);
            setPageSize(Integer.parseInt(size));
        } else if (request.getParameter("repage") != null) {
            size = CookieUtils.getCookie(request, "pageSize");
            if (StringUtils.isNumeric(size)) {
                setPageSize(Integer.parseInt(size));
            }
        } else if (defaultPageSize != -2) {
            this.pageSize = defaultPageSize;
        }
        String funcName = request.getParameter("funcName");
        if (StringUtils.isNotBlank(funcName)) {
            CookieUtils.setCookie(response, "funcName", funcName);
            setFuncName(funcName);
        } else if (request.getParameter("repage") != null) {
            funcName = CookieUtils.getCookie(request, "funcName");
            if (StringUtils.isNotBlank(funcName)) {
                setFuncName(funcName);
            }
        }
        String orderBy = request.getParameter("orderBy");
        if (StringUtils.isNotBlank(orderBy)) {
            setOrderBy(orderBy);
        }
    }

    public Page(int page, int pageSize) {
        this(page, pageSize, 0L);
    }

    public Page(int page, int pageSize, long count) {
        this(page, pageSize, count, new ArrayList());
    }

    public Page(int page, int pageSize, long count, List<T> list) {
        setCount(count);
        setPage(page);
        this.pageSize = pageSize;
        this.list = list;
    }

    public void initialize() {
        this.first = 1;

        this.last = ((int) (this.count / (this.pageSize < 1 ? 20 : this.pageSize) + this.first - 1L));
        if ((this.count % this.pageSize != 0L) || (this.last == 0)) {
            this.last += 1;
        }
        if (this.last < this.first) {
            this.last = this.first;
        }
        if (this.page <= 1) {
            this.page = this.first;
            this.firstPage = true;
        }
        if (this.page >= this.last) {
            this.page = this.last;
            this.lastPage = true;
        }
        if (this.page < this.last - 1) {
            this.next = (this.page + 1);
        } else {
            this.next = this.last;
        }
        if (this.page > 1) {
            this.prev = (this.page - 1);
        } else {
            this.prev = this.first;
        }
        if (this.page < this.first) {
            this.page = this.first;
        }
        if (this.page > this.last) {
            this.page = this.last;
        }
    }

    public long getCount() {
        return this.count;
    }

    public void setCount(long count) {
        this.count = count;
        if (this.pageSize >= count) {
            this.page = 1;
        }
    }

    public int getPage() {
        return this.page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = (pageSize <= 0 ? 10 : pageSize);
    }

    @JsonIgnore
    public int getFirst() {
        return this.first;
    }

    @JsonIgnore
    public int getLast() {
        return this.last;
    }

    @JsonIgnore
    public int getTotalPage() {
        return getLast();
    }

    @JsonIgnore
    public boolean isFirstPage() {
        return this.firstPage;
    }

    @JsonIgnore
    public boolean isLastPage() {
        return this.lastPage;
    }

    @JsonIgnore
    public int getPrev() {
        if (isFirstPage()) {
            return this.page;
        }
        return this.page - 1;
    }

    @JsonIgnore
    public int getNext() {
        if (isLastPage()) {
            return this.page;
        }
        return this.page + 1;
    }

    public List<T> getList() {
        return this.list;
    }

    public Page<T> setList(List<T> list) {
        this.list = list;
        initialize();
        return this;
    }

    @JsonIgnore
    public String getOrderBy() {
        String reg = "(?:')|(?:--)|(/\\*(?:.|[\\n\\r])*?\\*/)|(\\b(select|update|and|or|delete|insert|trancate|char|into|substr|ascii|declare|exec|count|master|into|drop|execute)\\b)";

        Pattern sqlPattern = Pattern.compile(reg, 2);
        if (sqlPattern.matcher(this.orderBy).find()) {
            return "";
        }
        return this.orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    @JsonIgnore
    public String getFuncName() {
        return this.funcName;
    }

    public void setFuncName(String funcName) {
        this.funcName = funcName;
    }

    @JsonIgnore
    public String getFuncParam() {
        return this.funcParam;
    }

    public void setFuncParam(String funcParam) {
        this.funcParam = funcParam;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @JsonIgnore
    public boolean isDisabled() {
        return this.pageSize == -1;
    }

    @JsonIgnore
    public boolean isNotCount() {
        return this.count == -1L;
    }

    public int getFirstResult() {
        int firstResult = (getPage() - 1) * getPageSize();
        if (firstResult >= getCount()) {
            firstResult = 0;
        }
        return firstResult;
    }

    public int getMaxResults() {
        return getPageSize();
    }
}
