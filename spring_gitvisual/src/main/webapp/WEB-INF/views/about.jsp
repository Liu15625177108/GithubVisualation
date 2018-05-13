<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/5/12
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="content">
    <div class="ui equal width grid" style="margin: 5px 0 5px 30px;width: 70%">
        <div class="row">
            <div class="column">
                <!--以下为关于正文-->
                <div class="ui container segment">
                    <div class="content">
                        <div>
                            <h2 class="ui header">关于我们</h2>
                        </div>
                        <div class="description">
                            <span class="ui label" style="color: rgba(0,132,255,0.76)">计算机</span>
                            <span class="ui label" style="color: rgba(0,132,255,0.76)">软件技术</span>
                            <span>&nbsp;&nbsp;&nbsp;&nbsp;2018.05.06</span>
                            <div style="text-indent: 2em;line-height: 1.5em">
                                <p></p>
                                <div class="ui relaxed divided list">
                                    <div class="item">
                                        <div class="content">
                                            <a class="header">后端</a>
                                            <div class="ui list">
                                                <div class="item">核心框架：Spring Framework 4.3</div>
                                                <div class="item">视图框架：Spring MVC 4.3</div>
                                                <div class="item">数据库：MySQL</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <div class="content">
                                            <a class="header">前端</a>
                                            <div class="ui list">
                                                <div class="item">UI：Semantic UI 2.3</div>
                                                <div class="item">JS：JQuery 3.3</div>
                                                <div class="item">脚手架：rapid-framework 4.0</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <div class="content">
                                            <a class="header">服务器</a>
                                        </div>
                                    </div>

                                    <div class="item">
                                        <div class="content">
                                            <a class="header">数据获取</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#about').addClass('active');
    </script>
</rapid:override>
<%@ include file="base.jsp" %>

