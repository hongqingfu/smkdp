package com.smkdp.modules.gen.service;


import com.smkdp.common.base.BaseService;
import com.smkdp.modules.gen.entity.GenTableColumn;

import java.util.List;

public interface GenTableColumnService extends BaseService<GenTableColumn> {
    int deleteByTableId(String tableId);
    void updateBatch(List<GenTableColumn> genTableColumns);
}
