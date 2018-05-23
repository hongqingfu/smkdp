package com.smkdp.modules.gen.service;


import com.smkdp.common.base.BaseService;
import com.smkdp.modules.gen.entity.GenTable;

public interface GenTableService extends BaseService<GenTable> {

    GenTable getTableAndColumns(String id);

    int saveTableAndColumn(GenTable genTable);

    int deleteTableAndColumn(String id);
}
