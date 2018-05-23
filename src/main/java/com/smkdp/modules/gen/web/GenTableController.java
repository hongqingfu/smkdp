package com.smkdp.modules.gen.web;

import com.github.pagehelper.PageInfo;
import com.smkdp.common.base.BaseMessage;
import com.smkdp.modules.gen.entity.GenDataSource;
import com.smkdp.modules.gen.entity.GenTable;
import com.smkdp.modules.gen.entity.GenTableColumn;
import com.smkdp.modules.gen.service.GenDataSourceService;
import com.smkdp.modules.gen.service.GenTableColumnService;
import com.smkdp.modules.gen.service.GenTableService;
import com.smkdp.modules.gen.util.ReadTableUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/table")
public class GenTableController {

    private static final Logger logger = Logger.getLogger(GenTableController.class);

    @Autowired
    private GenDataSourceService genDataSourceService;

    @Autowired
    private GenTableService genTableService;

    @Autowired
    private GenTableColumnService genTableColumnService;

    @RequestMapping("/list")
    public String list() {
        return "gen/tableList";
    }

    @RequestMapping("/form")
    public String form() {
        return "gen/tableForm";
    }

    @RequestMapping("/buildTable")
    public String bulidTable() {
        return "gen/buildTable";
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

    @RequestMapping("getTales")
    @ResponseBody
    public List<GenTable> getTales(String dataSourceId) {
        GenDataSource genDataSource = genDataSourceService.get(dataSourceId);
        List<GenTable> list = new ArrayList<>();
        try {
            List<String> tableNames = new ReadTableUtils().readAllTableNames(genDataSource);
            if (tableNames.size() > 0) {
                for (int i = 0; i < tableNames.size(); i++) {
                    GenTable genTable = new GenTable();
                    genTable.setName(tableNames.get(i));
                    list.add(genTable);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @ResponseBody
    @RequestMapping("save")
    public BaseMessage save(GenTable genTable, String dataSourceId, String name) {
        try {
            GenDataSource dataSource = genDataSourceService.get(dataSourceId);
            List<GenTableColumn> columns = new ReadTableUtils().readTableColumn(dataSource, name);
            genTable.setColumns(columns);
            int count = genTableService.saveTableAndColumn(genTable);
            if (count > 0) {
                return new BaseMessage(200, "保存成功");
            }
            return new BaseMessage(500, "保存失败");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new BaseMessage(500, "保存失败");
    }

    @RequestMapping("delete")
    @ResponseBody
    public BaseMessage delete(String id) {
        int count = genTableService.deleteTableAndColumn(id);
        if (count > 0) {
            return new BaseMessage(200, "删除成功");
        }
        return new BaseMessage(500, "删除失败");
    }

    @RequestMapping("getColumns")
    @ResponseBody
    public List<GenTableColumn> getTableColumn(GenTableColumn genTableColumn) {
        List<GenTableColumn> list = genTableColumnService.findList(genTableColumn);
        return list;
    }

    @RequestMapping("savaTableColumns")
    @ResponseBody
    public BaseMessage savaTableColumns(@RequestBody List<GenTableColumn> genTableColumns) {
        logger.debug("接收到的List=========》" + genTableColumns.toString());
        genTableColumnService.updateBatch(genTableColumns);
        return new BaseMessage(200, "更新成功");
    }
}
