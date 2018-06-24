<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/6/24
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="content">
    <style type="text/css">
        .change_size {
            min-height: 700px;
            padding: 1em 0em;
        }
        .masthead h1.ui.header {
            margin-top: 3em;
            margin-bottom: 0em;
            font-size: 4em;
            font-weight: normal;
        }
        .masthead h2 {
            font-size: 1.7em;
            font-weight: normal;
        }
        @media only screen and (max-width: 700px) {
            .change_size {
                min-height: 350px;
            }
            .masthead h1.ui.header {
                font-size: 2em;
                margin-top: 1.5em;
            }
            .masthead h2 {
                margin-top: 0.5em;
                font-size: 1.5em;
            }
        }
    </style>
    <script>
        $('#home').addClass('active');
    </script>
    <div class="ui inverted vertical masthead center aligned segment change_size">
        <div class="ui text container">
            <h1 class="ui inverted header">
                GitHub Visualization
            </h1>
            <h2>A data analysis platform for GitHub from languages, regions, repositories, and users.</h2>
            <a class="ui huge primary button" href="http://localhost:8080/spring_gitvisual/summary">Get Started <i class="right arrow icon"></i></a>
        </div>
    </div>
</rapid:override>
<%@ include file="base.jsp" %>