package com.smkdp.modules.gen.service.impl;

import com.smkdp.common.base.BaseServiceImpl;
import com.smkdp.modules.gen.dao.GenTableColumnDao;
import com.smkdp.modules.gen.dao.GenTableDao;
import com.smkdp.modules.gen.entity.GenTable;
import com.smkdp.modules.gen.entity.GenTableColumn;
import com.smkdp.modules.gen.service.GenTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("genTableService")
public class GenTableServiceImpl extends BaseServiceImpl<GenTableDao, GenTable> implements GenTableService {

    @Autowired
    private GenTableDao genTableDao;

    @Autowired
    private GenTableColumnDao genTableColumnDao;

    @Override
    public GenTable getTableAndColumns(String id) {
        return genTableDao.getTableAndColumns(id);
    }

    @Override
    @Transactional
    public int saveTableAndColumn(GenTable genTable) {

        if (!"".equals(genTable.getId()) && null != genTable.getId()) { //更新
            genTable.preUpdate();
            genTableDao.update(genTable);
        } else { //新增
            genTable.preInsert();
            genTableDao.insert(genTable);
        }
        if (genTable.getColumns().size() > 0) {
            for (GenTableColumn column : genTable.getColumns()) {
                column.setGenTableId(genTable.getId());
                if (!"".equals(column.getId()) && null != column.getId()) {
                    column.preUpdate();
                    genTableColumnDao.update(column);
                } else {
                    column.preInsert();
                    genTableColumnDao.insert(column);
                }
            }
//            return this.genTableColumnMapper.insertBatch(genTable.getColumns());
        }
        return 0;
    }

    @Override
    @Transactional
    public int deleteTableAndColumn(String id) {
        genTableDao.delete(id);
        return genTableColumnDao.deleteByTableId(id);

    }
}
