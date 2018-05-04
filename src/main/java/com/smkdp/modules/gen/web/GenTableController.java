package com.smkdp.modules.gen.web;

import com.github.pagehelper.PageInfo;
import com.smkdp.modules.gen.entity.GenTable;
import com.smkdp.modules.gen.service.GenTableService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/table")
public class GenTableController {

    private static final Logger logger = Logger.getLogger(GenTableController.class);

    @Autowired
    private GenTableService genTableService;

    @RequestMapping("/list")
    public String list() {
        return "gen/tableList";
    }

    @RequestMapping("/form")
    public String form() {
        return "gen/tableForm";
    }

    @RequestMapping("/get")
    @ResponseBody
    public GenTable get(String id) {
        return genTableService.get(id);
    }

    @RequestMapping("/getTableAndColumns")
    @ResponseBody
    public GenTable getTableAndColumns(String id) {
        return genTableService.getTableAndColumns(id);
    }

    @RequestMapping("/findPage")
    @ResponseBody
    public PageInfo<GenTable> findPage(GenTable genTable) {
        return genTableService.findPage(genTable);
    }
}
