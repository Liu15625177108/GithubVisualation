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
    public String summary(ModelMap model) {
        //return jsp的文件名就可以跳转到对应的jsp
        List<language> lanList = lanService.findAll();
        int repNums = 0;
        int userNums = 0;
        //获取每种语言的仓库数和用户数，分别相加得到仓库总数和用户总数
        //这种方法应该没错?总觉得不对——18.05.26 Zhong
        for (int i = 0; i < lanList.size(); i++) {
            repNums = repNums + lanList.get(i).getRepositories();
            userNums = userNums + lanList.get(i).getUsers();
        }
        model.addAttribute("repNums", repNums);  //仓库数量
        model.addAttribute("userNums", userNums);    //用户数量

        //语言榜，按仓库数进行降序排序输出
        List<language> lanList2 = lanService.sortByRep();
        model.addAttribute("lanList2", lanList2);
        return "summary";
    }

    @RequestMapping("/about")
    //http://localhost:8080/spring_gitvisual/about
    public String about() {
        return "about";
    }

    @RequestMapping("/language")
    //http://localhost:8080/spring_gitvisual/language
    public String language(ModelMap model) {
        List<language> lanList = lanService.findAll();
        language lan = lanService.findByType("Java");
        model.addAttribute("lan", lan);
        model.addAttribute("lanList", lanList);
        return "language";
    }

    @RequestMapping("/area")
    //http://localhost:8080/spring_gitvisual/area
    public String area(ModelMap model) {
        return "area";
    }

    @RequestMapping("/repository")
    //http://localhost:8080/spring_gitvisual/repository
    public String repository(ModelMap model) {
        String[] languages = {"JavaScript", "Python", "Java", "C#", "C++", "PHP", "Ruby", "HTML", "C", "Shell"};
        String[] colors = {"orange", "red", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black"};
        String[] repositories = {"freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow"};  //这个需要改为数据库获取
        model.addAttribute("languages", languages);
        model.addAttribute("colors", colors);
        model.addAttribute("repositories", repositories);
        return "repository";
    }

    @RequestMapping("/user")
    //http://localhost:8080/spring_gitvisual/user
    public String user(ModelMap model) {
        String[] languages = {"JavaScript", "Python", "Java", "C#", "C++", "PHP", "Ruby", "HTML", "C", "Shell"};
        String[] users = {"Ruan YiFeng", "TJ Holowaychuk", "Evan You", "Ruan YiFeng", "TJ Holowaychuk", "Evan You"};
        String[] colors = {"orange", "red", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black"};
        model.addAttribute("colors", colors);
        model.addAttribute("users", users);
        model.addAttribute("languages", languages);
        return "user";
    }
}
