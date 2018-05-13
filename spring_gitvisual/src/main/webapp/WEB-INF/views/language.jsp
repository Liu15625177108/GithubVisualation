<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/5/12
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="content">
    <div class="ui equal width grid" style="margin: 5px 0 5px 30px;width: 70%">
        <div class="row">
            <div class="column">
                <!--以下为图表区域-->
                <div class="ui container segment">
                    <div class="ui top attached tabular menu">
                        <a class="active item" id="read">tab1</a>
                        <a class="item" id="like">tab2</a>
                    </div>
                    <div class="ui bottom attached segment" id="chart" style="height: 400px"></div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#language').addClass('active');
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart'));
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '各语言用户数'
            },
            tooltip: {},
            legend: {
                data: ['语言']
            },
            xAxis: {
                data: ["JavaScript", "Python", "Java", "PHP", "Ruby", "C++"]
            },
            yAxis: {},
            series: [{
                name: '数量',
                type: 'bar',
                data: [491861, 282259, 238859, 156598, 131327, 114411]
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

        /////////////////////////////////////////////////////////
        $('#read').click(function () {
            $('#like').removeClass('active');
            $('#read').addClass('active');
            myChart.setOption(option);
        });

        /////////////////////////////////////////////////////////
        $('#like').click(function () {
            $('#like').addClass('active');
            $('#read').removeClass('active');
            var option2 = {
                title: {
                    text: '各语言用户数'
                },
                tooltip: {},
                legend: {
                    data: ['语言']
                },
                xAxis: {
                    data: ["JavaScript", "Python", "Java"]
                },
                yAxis: {},
                series: [{
                    name: '数量',
                    type: 'bar',
                    data: [491861, 282259, 238859]
                }]
            }
            myChart.setOption(option2);
        });
    </script>
</rapid:override>
<%@ include file="base.jsp" %>

