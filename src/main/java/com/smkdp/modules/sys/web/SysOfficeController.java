package com.smkdp.modules.sys.web;

import com.github.pagehelper.PageInfo;
import com.smkdp.modules.sys.entity.SysOffice;
import com.smkdp.modules.sys.service.SysOfficeService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("office")
public class SysOfficeController {

    @Autowired
    private SysOfficeService sysOfficeService;

    @RequestMapping({"get"})
    @ResponseBody
    public SysOffice get(String id) {
        if (StringUtils.isNotBlank(id)) {
            return this.sysOfficeService.get(id);
        }
        return new SysOffice();
    }

    @RequestMapping(value = {"index"})
    public String index(SysOffice office, Model model) {
        return "sys/officeIndex";
    }

    @RequestMapping(value = {"list", ""})
    @ResponseBody
    public PageInfo list(SysOffice office) {
        PageInfo<SysOffice> page = sysOfficeService.findPage(office);
        return page;
    }

    @RequestMapping(value = "officeList")
    @ResponseBody
    public List<SysOffice> officeList(SysOffice office) {
        List<SysOffice> list = new ArrayList<>();
        list = sysOfficeService.findList(office);
        return list;
    }
}
