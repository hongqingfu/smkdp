package com.smkdp.modules.gen.dao;


import com.smkdp.common.base.BaseDao;
import com.smkdp.modules.gen.entity.GenTableColumn;

public interface GenTableColumnDao extends BaseDao<GenTableColumn> {

    int deleteByTableId(String tableId);
}