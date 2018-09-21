package com.smkdp.common.base;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class BaseServiceImpl<D extends BaseDao<T>, T extends BaseEntity> {

    @Autowired
    private D dao;

    public T get(String id) {
        return this.dao.get(id);
    }

    public List<T> findList(T entity) {
        return this.dao.findList(entity);
    }

    public PageInfo<T> findPage(T entity) {
        PageHelper.startPage(entity.getPage(), entity.getPageSize());
        List<T> list = this.dao.findList(entity);
        PageInfo<T> page = new PageInfo<>(list);
        return page;
    }

    @Transactional
    public int save(T entity) {
        if ("".equals(entity.getId()) || null == entity.getId()) {
            entity.preInsert();
            return this.dao.insert(entity);
        } else {
            entity.preUpdate();
            return this.dao.update(entity);
        }
    }

    @Transactional
    public int delete(String id) {
        return this.dao.delete(id);
    }
}
