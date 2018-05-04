package com.smkdp.common.base;

import com.smkdp.common.persistence.Page;

import java.util.List;

public interface BaseDao<T> {

    int insert(T entity);

    int delete(String id);

    int update(T entity);

    T get(String id);

    List<T> findList(T entity);

//    int insertBatch(List<T> entity);
//
//    int updateBatch(List<T> entity);

}
