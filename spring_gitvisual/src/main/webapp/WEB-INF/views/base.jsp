<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/5/12
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%--<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1" />--%>
<html>

<head>
    <%--<meta charset="UTF-8">--%>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Git-Visualization</title>
    <link rel="stylesheet" href="css/semantic.css"/>
    <script src="js/jquery.js"></script>    <%--放在semantic.js前面--%>
    <script src="js/semantic.js"></script>
    <script src="js/echarts.min.js"></script>
    <script src="js/china.js"></script>
</head>
<body>
<!--左侧栏-->
<div class="ui left sidebar inverted vertical menu">
    <div class="item">
        <a class="ui icon image" href="#">
            <img src="img/github.jpg" height="50px" width="50px"/>
        </a>
        <a href="#">
            <b>&nbsp;&nbsp;&nbsp;GitHub Visualization</b>
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
    <div class="ui inverted vertical masthead center aligned segment" style="padding: 8px 8px;">
        <div class="ui container">
            <div class="ui large secondary inverted pointing menu">
                <a class="item" id="my_menu">
                    Menu
                    <i class="sidebar icon"></i>
                </a>
                <a class="item" id="home" href="http://localhost:8080/spring_gitvisual/homepage">Home</a>
                <a class="item" id="summary" href="http://localhost:8080/spring_gitvisual/summary">Summary</a>
                <a class="item"  id="about" href="http://localhost:8080/spring_gitvisual/about">About</a>
            </div>
        </div>
    </div>
    <!--这是正文部分-->
    <rapid:block name="content">
        123
    </rapid:block>
</div>
<script>
    $('#my_menu').click(function () {
        $('.ui.sidebar').sidebar('toggle');
        // $('.change_margin').css("margin", "50px auto 20px");      //点击隐藏菜单后使内容居中

        // $('.change_color').removeClass("secondary");    //反转顶部菜单栏颜色，并使其固定在顶部
        // $('.change_color').addClass("large fixed");     //加上颜色很丑，就不加吧（颜色：blue inverted）
        // $('.change_color').css("margin", "0px 0px");
    });
    // $('#summary').click(function () {
    //     $('.item').removeClass('active');
    //     $('#summary').addClass('active');
    //     window.location.href = "http://localhost:8080/spring_gitvisual/summary";
    // });
</script>
</body>
</html>
