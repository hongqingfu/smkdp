package com.smkdp.modules.gen.dao;

import com.smkdp.common.base.BaseDao;
import com.smkdp.modules.gen.entity.GenScheme;

public interface GenSchemeDao extends BaseDao<GenScheme> {

    GenScheme getTableScheme(GenScheme genScheme);
}