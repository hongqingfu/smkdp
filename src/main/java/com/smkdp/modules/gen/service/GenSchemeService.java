package com.smkdp.modules.gen.service;


import com.smkdp.common.base.BaseService;
import com.smkdp.modules.gen.dao.GenSchemeDao;
import com.smkdp.modules.gen.entity.GenScheme;

public interface GenSchemeService extends BaseService<GenScheme> {

    public GenScheme getTableScheme(GenScheme genScheme);
}
