package com.smkdp.modules.sys.web;

import com.smkdp.common.base.BaseMessage;
import com.smkdp.modules.sys.entity.SysMenu;
import com.smkdp.modules.sys.service.SysMenuService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("menu")
public class SysMenuController {

    @Autowired
    private SysMenuService sysMenuService;

    @RequestMapping("menulist")
    public String menuList() {
        return "/sys/menuList";
    }

    @RequestMapping(value = "menuList", method = RequestMethod.POST)
    @ResponseBody
    public List<SysMenu> menuList(SysMenu sysMenu) {
        if ("".equals(sysMenu.getId()) || null == sysMenu.getId()) {
            sysMenu.setParentId("0");
        } else {
            sysMenu.setParentId(sysMenu.getId());
        }
        return sysMenuService.findList(sysMenu);
    }

    @RequestMapping("menus")
    @ResponseBody
    public List<SysMenu> menus(SysMenu sysMenu) {
        List<SysMenu> list = sysMenuService.findList(sysMenu);
        return buildByRecursive(list);
    }

    @RequestMapping(value = "saveMenu", method = RequestMethod.POST)
    @ResponseBody
    public BaseMessage saveMenu(SysMenu sysMenu) {
        if (StringUtils.isEmpty(sysMenu.getParentId())) {
            sysMenu.setParentId("0"); // 表示最大的父节点
        } else {
            SysMenu pMenu = sysMenuService.get(sysMenu.getParentId());
            pMenu.setHasChildren("1");
            sysMenuService.save(pMenu);
        }
        int i = sysMenuService.save(sysMenu);
        if (i > 0) {
            return new BaseMessage(200, "保存成功");
        }
        return new BaseMessage(500, "保存失败");
    }

    @RequestMapping(value = "deleteMenu", method = RequestMethod.POST)
    @ResponseBody
    public BaseMessage deleteMenu(SysMenu sysMenu) {
        int i = sysMenuService.delete(sysMenu.getId());
        if (i > 0) {
            return new BaseMessage(200, "删除成功");
        }
        return new BaseMessage(500, "删除失败");
    }

    public List<SysMenu> buildByRecursive(List<SysMenu> sysMenuList) {
        List<SysMenu> list = new ArrayList<>();
        for (int i = 0; i < sysMenuList.size(); i++) {
            SysMenu sysMenu = sysMenuList.get(i);
            if ("0".equals(sysMenu.getParentId())) {
                list.add(findChildren(sysMenu,sysMenuList));
            }
        }
        return list;
    }

    public SysMenu findChildren(SysMenu sysMenu,List<SysMenu> sysMenuList) {
        for (SysMenu it : sysMenuList) {
            if (sysMenu.getId().equals(it.getParentId())){
                if (sysMenu.getMenuList() == null) {
                    sysMenu.setMenuList(new ArrayList<SysMenu>());
                }
                sysMenu.getMenuList().add(findChildren(it,sysMenuList));
            }
        }
        return sysMenu;
    }

}
