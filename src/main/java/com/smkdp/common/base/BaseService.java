package com.smkdp.common.base;

import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * 基础Service
 *
 * @param <T>
 */
public interface BaseService<T> {

    /**
     * 根据主键查询实体
     *
     * @param id 主键
     * @return 实体
     */
    T get(String id);

    /**
     * 多条件查询实体
     *
     * @param entity 实体
     * @return 实体
     */
    List<T> findList(T entity);

    /**
     * 多条件分页查询实体
     *
     * @param entity 实体
     * @return 实体
     */
    PageInfo<T> findPage(T entity);

    /**
     * 保存实体，根据是否有id判断新增或修改
     *
     * @param entity 实体
     * @return 操作条数
     */
    int save(T entity);

    /**
     * 根据主键删除
     *
     * @param id 主键
     * @return 操作条数
     */
    int delete(String id);

}
