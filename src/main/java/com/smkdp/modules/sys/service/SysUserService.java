package com.smkdp.modules.sys.service;

import com.smkdp.common.base.BaseService;
import com.smkdp.modules.sys.entity.SysUser;

public interface SysUserService extends BaseService<SysUser> {

    SysUser getByLoginName(String loginName);

    String entryptPassword(String paramString);

    boolean validatePassword(String paramString1, String paramString2);
}
