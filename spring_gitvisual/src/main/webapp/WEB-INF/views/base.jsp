<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/5/12
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Git-Visualization</title>
    <link rel="stylesheet" href="css/semantic.css"/>
    <script src="js/semantic.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/echarts.min.js"></script>
    <style>
        body {
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body>
<!--左侧栏-->
<div class="ui left visible sidebar inverted vertical menu">
    <div class="item">
        <a class="ui icon image" href="#">
            <img src="img/github.jpg" height="50px" width="50px"/>
        </a>
        <a href="#">
            <b>&nbsp;&nbsp;&nbsp;GitHub可视化</b>
        </a>
    </div>
    <a class="item" id="language" href="http://localhost:8080/spring_gitvisual/language">
        语言/Language
        <i class="sellsy icon"></i>
    </a>
    <a class="item" id="area" href="http://localhost:8080/spring_gitvisual/area">
        地区/Area
        <i class="pagelines icon"></i>
    </a>
    <a class="item" id="repository" href="http://localhost:8080/spring_gitvisual/repository">
        仓库/Repository
        <i class="simplybuilt icon"></i>
    </a>
    <a class="item" id="user" href="http://localhost:8080/spring_gitvisual/user">
        用户/User
        <i class="computer icon"></i>
    </a>
</div>
<!--以下为网站内容-->
<div class="pusher">
    <!--这是顶部菜单-->
    <div class="ui secondary menu" style="padding: 15px 280px 5px 16px;margin: 0px">
        <a class="item" id="my_menu">
            Menu
            <i class="content icon"></i>
        </a>
        <a class="item" id="summary" href="http://localhost:8080/spring_gitvisual/summary">
            概况
        </a>
        <a class="item" id="about" href="http://localhost:8080/spring_gitvisual/about">
            关于我们
        </a>
        <div class="right menu">
            <div class="item">
                <div class="ui icon input">
                    <input type="text" placeholder="Search...">
                    <i class="search link icon"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="ui divider" style="margin: 0px"></div>
    <!--这是正文部分-->
    <rapid:block name="content">
        123
    </rapid:block>
</div>
<script>
    $('#my_menu').click(function () {
        $('.ui.sidebar').sidebar('toggle');
    });
    // $('#summary').click(function () {
    //     $('.item').removeClass('active');
    //     $('#summary').addClass('active');
    //     window.location.href = "http://localhost:8080/spring_gitvisual/summary";
    // });
</script>
</body>
</html>
