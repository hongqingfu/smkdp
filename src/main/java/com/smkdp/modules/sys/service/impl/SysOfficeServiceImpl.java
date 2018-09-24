package com.smkdp.modules.sys.service.impl;

import com.smkdp.common.base.BaseServiceImpl;
import com.smkdp.modules.sys.dao.SysOfficeDao;
import com.smkdp.modules.sys.entity.SysOffice;
import com.smkdp.modules.sys.service.SysOfficeService;
import org.springframework.stereotype.Service;

@Service("sysOfficeServiceImpl")
public class SysOfficeServiceImpl extends BaseServiceImpl<SysOfficeDao, SysOffice> implements SysOfficeService {
}
