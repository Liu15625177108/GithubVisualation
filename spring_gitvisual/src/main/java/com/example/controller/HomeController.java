package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class HomeController {
    @RequestMapping("/git_visual")
    //当访问http://localhost:8080/spring_gitvisual/git_visual
    //就会执行这个方法
    public String git_visual(){
        //return jsp的文件名就可以跳转到对应的jsp
        return "git_visual";
    }

}
