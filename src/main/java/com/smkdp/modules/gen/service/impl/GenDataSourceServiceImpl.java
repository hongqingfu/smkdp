package com.smkdp.modules.gen.service.impl;

import com.smkdp.common.base.BaseServiceImpl;
import com.smkdp.modules.gen.dao.GenDataSourceDao;
import com.smkdp.modules.gen.entity.GenDataSource;
import com.smkdp.modules.gen.service.GenDataSourceService;
import org.springframework.stereotype.Service;

@Service("genDataSourceService")
public class GenDataSourceServiceImpl extends BaseServiceImpl<GenDataSourceDao, GenDataSource> implements GenDataSourceService {
}
