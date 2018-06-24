package com.example.controller;

import com.example.model.area;
import com.example.model.user;
import com.example.model.language;
import com.example.model.repository;
import com.example.service.userService;
import com.example.service.areaService;
import com.example.service.languageService;
import com.example.service.repositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;


import java.io.IOException;
import java.util.*;

@Controller
public class HomeController {
    @Autowired
    private languageService lanService;
    @Autowired
    private repositoryService rService;
    @Autowired
    private areaService AreaService;
    @Autowired
    private userService UserService;

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

        //地区榜，按用户数进行降序排序输出
        List<area> areaList = AreaService.sortByUsernums();
        model.addAttribute("areaList", areaList);

        //仓库榜，按star数进行降序排序输出
        List<repository> repList = rService.sortByStar();
        model.addAttribute("repList", repList);

        return "summary";
    }

    @RequestMapping("/about")
    //http://localhost:8080/spring_gitvisual/about
    public String about() {
        return "about";
    }
    @RequestMapping("/homepage")
    //http://localhost:8080/spring_gitvisual/about
    public String homepage() {
        return "homepage";
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
        List<area> areas = AreaService.findAll();
        model.addAttribute("areas", areas);
        return "area";
    }

//
//    @RequestMapping("/repository/{language}")
//    public  String fun (@PathVariable(value = "language") String language,ModelMap model){
//
//        String[] languages = {"JavaScript", "Python", "Java", "C#", "C++", "PHP", "Ruby", "HTML", "C", "Shell"};
//        String[] colors = {"orange", "red", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black"};
//        System.out.println(language);
//        List <repository> repositories=rService.sortByStar();
//
//
//        List<repository> lanrepository=rService.findByLanguage(language);
//        model.addAttribute("lanrepository",lanrepository);
//        model.addAttribute("languages", languages);
//        model.addAttribute("colors", colors);
//        model.addAttribute("repositories", repositories);
//        return "repository";
//    }

    @ResponseBody
    @RequestMapping("repository/ajax")
        Map<String,List<repository>> fun(HttpServletRequest request){
        String language=request.getParameter("language");
        List <repository> mylist=rService.findByLanguage(language);
        System.out.println(mylist.size());
        for (int i = 0; i < mylist.size(); i++)
            System.out.println(mylist.get(i).getName());
        Map<String,List<repository>> map=new HashMap<String,List<repository>>();
        map.put("result",mylist);
        return  map;
    }



  @RequestMapping("/repository")
    //http://localhost:8080/spring_gitvisual/repository
    public String repository(ModelMap model){//, HttpServletRequest rsp,HttpServletResponse response) throws IOException {
        String[] languages = {"JavaScript", "Python", "Java", "C#", "C++", "PHP", "Ruby", "HTML", "C", "Shell"};
        String[] colors = {"orange", "red", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black"};

//        String[] repositories = {"freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
//                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
//                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
//                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
//                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow",
//                "freeCodeCamp", "bootstrap", "free-programming-books", "tensorflow"};  //这个需要改为数据库获取

        List <repository> repositories=rService.sortByStar();

//      String language=rsp.getParameter("language");

//        if(language!=null) {
//            System.out.println(language + "----" + language.length());
//            List<repository> lanrepository = rService.findByLanguage(language);
//            model.addAttribute("lanrepository",lanrepository);
//            System.out.println(lanrepository.size());
//            for (int i = 0; i < lanrepository.size(); i++)
//                System.out.println(lanrepository.get(i).getName());
//        }
//        String l="java";
//        model.addAttribute("test",l);
        List<repository> jsRepository = rService.findByLanguage("JavaScript");
        model.addAttribute("jsRepository",jsRepository);    //初始化的数据，默认为js的数据
        model.addAttribute("languages", languages);
        model.addAttribute("colors", colors);
        model.addAttribute("repositories", repositories);
        return "repository";

    }





    @RequestMapping("/user")
    //http://localhost:8080/spring_gitvisual/user
    public String user(ModelMap model) {
        String[] languages = {"JavaScript", "Python", "Java", "C#", "C++", "PHP", "Ruby", "HTML", "C", "Shell"};
//        String[] users = {"Ruan YiFeng", "TJ Holowaychuk", "Evan You", "Ruan YiFeng", "TJ Holowaychuk", "Evan You"};
        String[] colors = {"orange", "red", "yellow", "olive", "green", "teal", "blue", "violet", "purple", "pink", "brown", "grey", "black"};
       List<user> users=UserService.sortByStar();
        List<user> jsUsers=UserService.findByLanguage("JavaScript");
        model.addAttribute("colors", colors);
        model.addAttribute("languages", languages);
        model.addAttribute("users", users);
        model.addAttribute("jsUsers", jsUsers);     //初始化的数据，默认为js的数据
        return "user";
    }


    @ResponseBody
    @RequestMapping("/user/ajax")
  public Map<String,List<user>> userAjax(HttpServletRequest request){
        String  language=request.getParameter("language");
        System.out.println(language);
        List<user> mylist=UserService.findByLanguage(language);
        System.out.println(mylist.size());
        for(int i=0;i<mylist.size();i++)
            System.out.println(mylist.get(i).getName());
        Map <String,List<user>> map=new HashMap<String, List<user>>();
        map.put("result",mylist);
        return  map;
    }
}
