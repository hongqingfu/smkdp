package com.smkdp.modules.gen.service.impl;

import com.smkdp.common.base.BaseServiceImpl;
import com.smkdp.modules.gen.dao.GenTableDao;
import com.smkdp.modules.gen.entity.GenTable;
import com.smkdp.modules.gen.service.GenTableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("genTableService")
public class GenTableServiceImpl extends BaseServiceImpl<GenTableDao, GenTable> implements GenTableService {

    @Autowired
    private GenTableDao genTableDao;

    @Override
    public GenTable getTableAndColumns(String id) {
        return genTableDao.getTableAndColumns(id);
    }
}
