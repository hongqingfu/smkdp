package com.smkdp.modules.sys.dao;

import com.smkdp.common.base.BaseDao;
import com.smkdp.common.persistence.annotation.MyBatisDao;
import com.smkdp.modules.sys.entity.SysUser;

@MyBatisDao
public interface SysUserDao extends BaseDao<SysUser> {

    SysUser getByLoginName(String loginName);
}