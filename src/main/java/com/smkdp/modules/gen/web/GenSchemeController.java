package com.smkdp.modules.gen.web;

import com.smkdp.common.base.BaseMessage;
import com.smkdp.modules.gen.entity.GenScheme;
import com.smkdp.modules.gen.service.GenDataSourceService;
import com.smkdp.modules.gen.service.GenSchemeService;
import com.smkdp.modules.gen.service.GenTableColumnService;
import com.smkdp.modules.gen.service.GenTableService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/scheme")
public class GenSchemeController {

    private static final Logger logger = Logger.getLogger(GenTableController.class);

    @Autowired
    private GenSchemeService genSchemeService;

    @Autowired
    private GenTableService genTableService;

    @Autowired
    private GenDataSourceService genDataSourceService;

    @Autowired
    private GenTableColumnService genTableColumnService;

    @RequestMapping("form")
    public String form() {
        return "/gen/schemeForm";
    }

    @RequestMapping("/get")
    @ResponseBody
    public GenScheme get(String id) {
        return genSchemeService.get(id);
    }

    @RequestMapping("/save")
    @ResponseBody
    public BaseMessage save(GenScheme genScheme) {
        int count = genSchemeService.save(genScheme);
        if (count > 0) {
            return new BaseMessage(200, "保存成功");
        }
        return new BaseMessage(500, "保存失败");
    }

    @RequestMapping("/delete")
    @ResponseBody
    public BaseMessage delete(String id) {
        int count = genSchemeService.delete(id);
        if (count > 0) {
            return new BaseMessage(200, "删除成功");
        }
        return new BaseMessage(500, "删除失败");
    }

    @RequestMapping("/create")
    @ResponseBody
    public void create(@RequestBody GenScheme genScheme) {
        logger.debug("业务表id为：" + genScheme.getGenTable());
        try {
//            GenTable genTable = genTableService.findTableAndColumn(genScheme.getGenTableId());
//            genScheme.setGenTable(genTable);
//            // 生成代码
//            CodeGenerateUtils generate = new CodeGenerateUtils(genScheme);
//            generate.generateFile();

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
    }

}
