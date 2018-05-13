package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/summary")
    //当访问http://localhost:8080/spring_gitvisual/summary
    //就会执行这个方法
    public String summary(){
        //return jsp的文件名就可以跳转到对应的jsp
        return "summary";
    }
    @RequestMapping("/about")
    //http://localhost:8080/spring_gitvisual/about
    public String about(){
        return "about";
    }
    @RequestMapping("/language")
    //http://localhost:8080/spring_gitvisual/language
    public String language(){
        return "language";
    }
}
