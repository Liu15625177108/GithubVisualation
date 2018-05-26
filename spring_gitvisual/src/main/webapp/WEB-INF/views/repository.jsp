<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/5/26
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %><%--这个非常重要--%>

<rapid:override name="content">
    <div class="ui equal width grid" style="margin: 5px 0 5px 30px;width: 75%">
        <div class="row">
            <div class="column">
                <!--以下为图表区域-->
                <div class="ui container segment" style="line-height: 40px">
                    <h3>Top 30 Repositories</h3>
                    <c:forEach items="${repositories}" var="rep" varStatus="i">
                        <a class="ui ${colors[(i.index)%12]} label" style="font-size: 14px">${rep}</a>
                    </c:forEach>
                </div>
            </div>
        </div>

            <%--第二行--%>
        <div class="row">
            <div class="column">
                <!--以下为图表区域-->
                <div class="ui container segment">
                        <%--菜单栏--%>
                    <div class="ui floating dropdown labeled search icon button">
                        <i class="filter icon"></i>
                        <span class="text">Select Language</span>
                        <div class="menu">
                            <c:forEach items="${languages}" var="lan">
                                <div class="item">${lan}</div>
                            </c:forEach>
                        </div>
                    </div>
                        <%--图表区域--%>
                    <div class="ui bottom attached segment" id="chart" style="height: 400px;padding: 2px"></div>

                </div>
            </div>
        </div>
    </div>

    <script>
        $('#area').addClass('active');
        $('.ui.floating.dropdown').dropdown();  //下拉菜单
        // 基于准备好的dom，初始化echarts实例
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
                data: ['freeCodeCamp', 'react', 'vue', 'react-native', 'create-react-app', 'angular.js']
            },
            series: [
                {
                    name: 'Star Numbers',
                    type: 'bar',
                    // color: '#297bf3',
                    // barWidth : 30,
                    data: [18203, 23489, 29034, 104970, 131744, 130230]
                },
                {
                    name: 'Fork Numbers',
                    type: 'bar',
                    // color: '#d1313a',
                    // barWidth : 30,
                    data: [19325, 23438, 31000, 121594, 134141, 181807]
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</rapid:override>
<%@ include file="base.jsp" %>