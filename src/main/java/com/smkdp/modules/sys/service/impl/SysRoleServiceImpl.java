package com.smkdp.modules.sys.service.impl;

import com.smkdp.common.base.BaseServiceImpl;
import com.smkdp.modules.sys.dao.SysRoleDao;
import com.smkdp.modules.sys.entity.SysRole;
import com.smkdp.modules.sys.service.SysRoleService;
import org.springframework.stereotype.Service;

@Service("sysRoleServiceImpl")
public class SysRoleServiceImpl extends BaseServiceImpl<SysRoleDao, SysRole> implements SysRoleService {

}
