package com.smkdp.modules.sys.web;

import com.github.pagehelper.PageInfo;
import com.smkdp.common.base.BaseMessage;
import com.smkdp.modules.sys.entity.SysMenu;
import com.smkdp.modules.sys.entity.SysUser;
import com.smkdp.modules.sys.service.SysOfficeService;
import com.smkdp.modules.sys.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Controller
@RequestMapping("user")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private SysOfficeService sysOfficeService;

    @RequestMapping({"get"})
    @ResponseBody
    public SysUser get(String id)
    {
        if (StringUtils.isNotBlank(id)) {
            return this.sysUserService.get(id);
        }
        return new SysUser();
    }

    @RequestMapping(value = {"index"})
    public String index(SysUser user, Model model) {
        return "sys/userIndex";
    }

    @RequestMapping(value = {"list", ""})
    @ResponseBody
    public PageInfo list(SysUser user) {
        PageInfo<SysUser> page = sysUserService.findPage(user);
        return page;
    }

    @RequestMapping({"form"})
    public String form(SysUser user, Model model) {
//        if ((user.getCompany() == null) || (user.getCompany().getId() == null)) {
//            user.setCompany(UserUtils.getUser().getCompany());
//        }
//        if ((user.getOffice() == null) || (user.getOffice().getId() == null)) {
//            user.setOffice(UserUtils.getUser().getOffice());
//        }
        return "sys/userForm";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public BaseMessage save(SysUser user) {
        if (StringUtils.isNotBlank(user.getNewPassword())) {
            user.setPassword(this.sysUserService.entryptPassword(user.getNewPassword()));
        }
        if (!checkLoginName(user.getOldLoginName(), user.getLoginName())) {
            return new BaseMessage(500, "保存失败," + user.getLoginName() + "用户名已存在");
        }
        int save = this.sysUserService.save(user);
        if (save > 0) {
            return new BaseMessage(200, "保存成功");
        }
        return new BaseMessage(500, "保存失败");
    }

    @RequestMapping({"checkLoginName"})
    public boolean checkLoginName(String oldLoginName, String loginName) {
        if ((loginName != null) && (loginName.equals(oldLoginName))) {
            return true;
        }
        if ((loginName != null) && (this.sysUserService.getByLoginName(loginName) == null)) {
            return true;
        }
        return false;
    }

    @RequestMapping({"delete"})
    @ResponseBody
    public BaseMessage delete(SysUser user) {
        //TODO(xxx):不允许删除当前用户、不允许删除超级管理员用户
        int delete = sysUserService.delete(user.getId());
        if(delete > 0) {
            return new BaseMessage(200, "删除成功");
        }
        return new BaseMessage(500, "删除失败");
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public BaseMessage login(SysUser user) {
        SysUser sysUser = sysUserService.getByLoginName(user.getLoginName());
        if (null == sysUser) {
            return new BaseMessage(500, "登陆失败");
        }
        String password = sysUser.getPassword();
        if (user.getPassword().equals(password)) {
            return new BaseMessage(200, "登陆成功");
        }
        return new BaseMessage(500, "登陆失败");
    }

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public @ResponseBody
    String upload(HttpServletRequest request,
                      HttpServletResponse response, ModelMap model, HttpSession session) throws IOException {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile mFile = multipartRequest.getFile("file");
        String path="D:\\EasyCare\\userfiles\\";
        String fileName = mFile.getOriginalFilename();
//        fileName = fileName.substring(fileName.lastIndexOf("")+1);      //获取扩展
        String extName = fileName.substring(fileName.lastIndexOf("."));
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String newName = uuid+extName;
        InputStream inputStream = mFile.getInputStream();
        byte[] b = new byte[1048576];
        int length = inputStream.read(b);
        String url =path + newName;
        System.out.println(url);
        FileOutputStream outputStream = new FileOutputStream(url);
        outputStream.write(b, 0, length);
        inputStream.close();
        outputStream.close();
        return newName;
    }

}
