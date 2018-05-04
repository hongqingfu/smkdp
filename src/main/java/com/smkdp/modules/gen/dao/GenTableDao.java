package com.smkdp.modules.gen.dao;

import com.smkdp.common.base.BaseDao;
import com.smkdp.modules.gen.entity.GenTable;

public interface GenTableDao extends BaseDao<GenTable> {

    GenTable getTableAndColumns(String id);
}
