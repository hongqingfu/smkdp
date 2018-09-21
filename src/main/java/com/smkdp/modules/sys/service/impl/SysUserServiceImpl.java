package com.smkdp.modules.sys.service.impl;

import com.smkdp.common.base.BaseServiceImpl;
import com.smkdp.common.utils.Digests;
import com.smkdp.common.utils.Encodes;
import com.smkdp.modules.sys.dao.SysUserDao;
import com.smkdp.modules.sys.entity.SysUser;
import com.smkdp.modules.sys.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("sysUserServiceImpl")
public class SysUserServiceImpl extends BaseServiceImpl<SysUserDao, SysUser> implements SysUserService {

    @Autowired
    private SysUserDao sysUserDao;

    @Override
    public SysUser getByLoginName(String loginName) {
        return sysUserDao.getByLoginName(loginName);
    }

    @Override
    public String entryptPassword(String paramString) {
        String plain = Encodes.unescapeHtml(paramString);
        byte[] salt = Digests.generateSalt(8);
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
        return Encodes.encodeHex(salt) + Encodes.encodeHex(hashPassword);
    }

    @Override
    public boolean validatePassword(String paramString1, String paramString2) {
        String plain = Encodes.unescapeHtml(paramString1);
        byte[] salt = Encodes.decodeHex(paramString2.substring(0, 16));
        byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, 1024);
        return paramString2.equals(Encodes.encodeHex(salt) + Encodes.encodeHex(hashPassword));
    }
}
