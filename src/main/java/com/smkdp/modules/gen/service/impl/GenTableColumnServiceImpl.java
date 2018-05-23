package com.smkdp.modules.gen.service.impl;

import com.smkdp.common.base.BaseServiceImpl;
import com.smkdp.modules.gen.dao.GenTableColumnDao;
import com.smkdp.modules.gen.entity.GenTableColumn;
import com.smkdp.modules.gen.service.GenTableColumnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("genTableColumnService")
public class GenTableColumnServiceImpl extends BaseServiceImpl<GenTableColumnDao, GenTableColumn> implements GenTableColumnService {

    @Autowired
    private GenTableColumnDao genTableColumnDao;

    @Override
    public int deleteByTableId(String tableId) {
        return this.deleteByTableId(tableId);
    }

    @Override
    @Transactional
    public void updateBatch(List<GenTableColumn> genTableColumns) {
        if (genTableColumns.size() > 0) {
            for (GenTableColumn column : genTableColumns) {
                if (!"".equals(column.getId()) && null != column.getId()) {
                    column.preUpdate();
                    genTableColumnDao.update(column);
                }
            }
        }
    }
}
