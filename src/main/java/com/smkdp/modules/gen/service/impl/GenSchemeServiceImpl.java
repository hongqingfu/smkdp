package com.smkdp.modules.gen.service.impl;

import com.smkdp.common.base.BaseServiceImpl;
import com.smkdp.modules.gen.dao.GenSchemeDao;
import com.smkdp.modules.gen.entity.GenScheme;
import com.smkdp.modules.gen.service.GenSchemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("genSchemeService")
public class GenSchemeServiceImpl extends BaseServiceImpl<GenSchemeDao, GenScheme> implements GenSchemeService {

    @Autowired
    private GenSchemeDao genSchemeDao;

    @Override
    public GenScheme getTableScheme(GenScheme genScheme) {
        if ("".equals(genScheme.getGenTableId())) {
            return genSchemeDao.getTableScheme(genScheme);
        }
        return null;
    }
}
