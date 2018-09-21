package com.smkdp.modules.sys.web;

import com.github.pagehelper.PageInfo;
import com.smkdp.common.base.BaseMessage;
import com.smkdp.modules.sys.entity.SysRole;
import com.smkdp.modules.sys.service.SysRoleService;
import com.smkdp.modules.sys.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("role")
public class SysRoleController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysRoleService sysRoleService;

    @RequestMapping({"get"})
    @ResponseBody
    public SysRole get(String id) {
        if (StringUtils.isNotBlank(id)) {
            return this.sysRoleService.get(id);
        }
        return new SysRole();
    }

    @RequestMapping(value = {"index"})
    public String index() {
        return "sys/userIndex";
    }

    @RequestMapping(value = {"list", ""})
    @ResponseBody
    public PageInfo list(SysRole role) {
        PageInfo<SysRole> page = sysRoleService.findPage(role);
        return page;
    }

    @RequestMapping({"form"})
    public String form() {
        return "sys/userForm";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public BaseMessage save(SysRole role) {

        return new BaseMessage(500, "保存失败");
    }

    @RequestMapping({"delete"})
    @ResponseBody
    public BaseMessage delete(SysRole role) {
        return new BaseMessage(500, "删除失败");
    }

}
