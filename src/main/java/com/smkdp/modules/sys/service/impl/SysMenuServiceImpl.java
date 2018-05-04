package com.smkdp.modules.sys.service.impl;

import com.smkdp.common.base.BaseServiceImpl;
import com.smkdp.modules.sys.dao.SysMenuDao;
import com.smkdp.modules.sys.entity.SysMenu;
import com.smkdp.modules.sys.service.SysMenuService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("sysMenuService")
public class SysMenuServiceImpl extends BaseServiceImpl<SysMenuDao, SysMenu> implements SysMenuService {

}
