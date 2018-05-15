package com.example.controller;

import com.example.model.language;
import com.example.service.languageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private languageService lanService;

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
    public String language(ModelMap model){
        List<language> lanList = lanService.findAll();
        language lan = lanService.findByType("Java");
        model.addAttribute("lan",lan);
        model.addAttribute("lanList",lanList);
        return "language";
    }
}
