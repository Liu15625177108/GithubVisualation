<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/5/26
  Time: 16:58
  To change this template use File | Se6tttings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %><%--这个非常重要--%>

<rapid:override name="content">
    <div class="ui equal width grid change_margin" style="margin: 5px 0 5px 30px;width: 75%">
        <div class="row">
            <div class="column">
                <!--以下为图表区域-->
                <div class="ui container segment" style="line-height: 40px">
                    <h3>Top 30 Repositories</h3>
                    <c:forEach items="${repositories}" var="rep" varStatus="i">
                        <a class="ui ${colors[(i.index)%12]} label" style="font-size: 14px" href="${rep.url}" target="_blank">${rep.name}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
<%--try of form--%>
        <%--<form action="${pageContext.request.contextPath }/repository" method="post">--%>
            <%--<input type="text" name="language"  value=${test}>--%>
            <%--<input type="submit"/>--%>
        <%--</form>--%>

            <%--第二行--%>
        <div class="row">
            <div class="column">
                <!--以下为图表区域-->
                <div class="ui container segment">
                        <%--菜单栏--%>
                    <div class="ui floating dropdown labeled icon button">
                        <i class="filter icon"></i>
                        <span class="text">Select Language</span>
                        
                        <div class="menu">

                            <div class="ui icon search input">
                                <i class="search icon"></i>

                                    <input id="search" type="text" placeholder="Search tags...">
                            </div>
                            <div class="divider"></div>
                            <div class="scrolling menu">
                                <c:forEach items="${languages}" var="lan">
                                    <div class="item">${lan}</div>
                                        <%--<div class="ui empty circular label"></div>--%>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                        <%--图表区域--%>
                    <div class="ui bottom attached segment" id="chart" style="height: 400px;padding: 2px"></div>

                </div>
            </div>
        </div>
    </div>

    <script>


        $('#repository').addClass('active');
        $('.ui.floating.dropdown').dropdown();  //下拉菜单
        $(".menu.scrolling .item").click(function () {
            // alert($(this).text());

            var L=$(this).text();
            var qData = {
                language:$(this).text()
            };
            $.ajax({
                type: "POST",
                url:"http://localhost:8080/spring_gitvisual/repository/ajax",
                data: qData,
                success: function (data) {
                    //此处省略
                    // alert("success");
                    var Repositoryname = new Array();
                    var star = new Array();
                    var fork = new Array();
                    for (var i = 0; i < 6; i++) {
                    Repositoryname[i]=data.result[i].name;
                    star[i]=data.result[i].star;
                    fork[i]=data.result[i].fork;
                    }
                    var myChart = echarts.init(document.getElementById('chart'));
                    // 从HomeController中获取数据，遍历得到的表

                    // 指定图表的配置项和数据
                    var option = {
                        title: {
                            text: 'Popular Repositories'
                        },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                type: 'shadow'
                            }
                        },
                        legend: {
                            data: ['Star Numbers', 'Fork Numbers']
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis: {
                            type: 'value',
                            boundaryGap: [0, 0.01]
                        },
                        yAxis: {
                            type: 'category',
                            // data: ['freeCodeCamp', 'react', 'vue', 'react-native', 'create-react-app', 'angular.js']
                            data:Repositoryname
                        },
                        series: [
                            {
                                name: 'Star Numbers',
                                type: 'bar',
                                // color: '#297bf3',
                                // barWidth : 30,
                                // data: [18203, 23489, 29034, 104970, 131744, 130230]
                                data:star
                            },
                            {
                                name: 'Fork Numbers',
                                type: 'bar',
                                // color: '#d1313a',
                                // barWidth : 30,
                                // data: [19325, 23438, 31000, 121594, 134141, 181807]
                                data:fork
                            }
                        ]
                    };

                    // 使用刚指定的配置项和数据显示图表。
                    myChart.setOption(option);

                },
                error: function (data) {
                    alert("error");

                }
            });

            // var search = document.getElementById("search");
            //
            // var form = document.createElement("form");
            // form.name = "form";
            // form.method = "post";
            // form.action = "http://localhost:8080/spring_gitvisual/repository";
            //
            // var input = document.createElement("input");
            // input.name = "language";
            // input.type = "text";
            //
            // input.value = $(this).text();
            //
            // document.body.appendChild(form);
            // form.appendChild(input);
            // form.submit();
        });



        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart'));
        // 从HomeController中获取数据，遍历得到的表

        // 指定图表的配置项和数据
        var Repositoryname=new Array();
        var star=new Array();
        var fork=new Array();
        var i=0;
        <c:forEach items="${lanrepository}" var="lan">
            Repositoryname[i]="${lan.name}";
            star[i]=${lan.star};
            fork[i]=${lan.fork}
            i++;
        </c:forEach>
        var option = {
            title: {
                text: 'Popular Repositories'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: ['Star Numbers', 'Fork Numbers']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                boundaryGap: [0, 0.01]
            },
            yAxis: {
                type: 'category',
                // data: ['freeCodeCamp', 'react', 'vue', 'react-native', 'create-react-app', 'angular.js']
                data:Repositoryname
            },
            series: [
                {
                    name: 'Star Numbers',
                    type: 'bar',
                    // color: '#297bf3',
                    // barWidth : 30,
                    // data: [18203, 23489, 29034, 104970, 131744, 130230]
                    data:star
                },
                {
                    name: 'Fork Numbers',
                    type: 'bar',
                    // color: '#d1313a',
                    // barWidth : 30,
                    // data: [19325, 23438, 31000, 121594, 134141, 181807]
                    data:fork
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</rapid:override>
<%@ include file="base.jsp" %>