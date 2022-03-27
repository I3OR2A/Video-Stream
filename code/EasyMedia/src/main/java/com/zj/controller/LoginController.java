package com.zj.controller;

import com.zj.common.AjaxResult;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin  //解决跨域
@RequestMapping("user")
public class LoginController {
    //login
    @PostMapping("login")
    public AjaxResult login() {
        return AjaxResult.ok().data("token","admin");
    }

    //info
    @GetMapping("info")
    public AjaxResult info() {
        return AjaxResult.ok().data("roles","[admin]").data("name","admin").data("avatar","https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
    }
}
