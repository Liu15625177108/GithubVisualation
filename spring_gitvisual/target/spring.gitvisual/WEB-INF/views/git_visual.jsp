<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/5/12
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Git-Visualization</title>
    <link rel="stylesheet" href="css/semantic.css"/>
    <script src="js/semantic.js"></script>
    <script src="js/jquery.js"></script>
    <script src="js/echarts.min.js"></script>
    <style>
        body{
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
    <a class="item" id="language">
        语言
        <i class="sellsy icon"></i>
    </a>
    <a class="item">
        地区
        <i class="pagelines icon"></i>
    </a>
    <a class="item">
        仓库
        <i class="simplybuilt icon"></i>
    </a>
    <a class="item">
        用户
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
        <a class="active item" id="survey">
            概况
        </a>
        <a class="item" id="about">
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
    <div id="page"></div>
</div>
<script>
    $('#my_menu').click(function () {
        $('.ui.sidebar').sidebar('toggle');
    });

    $(function(){       //加载page0.html，概况页
        $('#page').load('page0.html');
    });
    $('#survey').click(function () {
        $('.item').removeClass('active');
        $('#page').load('page0.html');
        $('#survey').addClass('active');
    });

    $('#about').click(function () {      //加载about_us.html，介绍我们
        $('.item').removeClass('active');
        $('#page').load('about_us.html');
        $('#about').addClass('active');
    });

    $('#language').click(function () {      //加载page1.html，语言页
        $('.item').removeClass('active');
        $('#page').load('page1.html');
        $('#language').addClass('active');
    });
</script>
</body>
</html>
