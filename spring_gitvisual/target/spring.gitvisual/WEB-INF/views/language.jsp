<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/5/12
  Time: 22:37
  To change this template use File | Settings | File Templates.
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
                <div class="ui container segment">
                    <div class="ui top attached tabular menu">
                        <a class="active item" id="read">用户数</a>
                        <a class="item" id="like">仓库数</a>
                    </div>
                    <div class="ui bottom attached segment" id="chart" style="height: 400px;padding: 2px"></div>

                    <!--测试用，正式版请删除这个div-->
                    <div id="test">
                        <p>测试用，正式版请删除这个div</p>
                        <p>语言:${lan.type}&nbsp;&nbsp;仓库数:${lan.repositories}&nbsp;&nbsp;用户数:${lan.users}</p>
                        <table>
                            <c:forEach items="${lanList}" var="lan2">
                                <tr>
                                    <td>${lan2.type} </td>
                                    <td>${lan2.users} </td>
                                    <td>${lan2.repositories} </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script>
        $('#language').addClass('active');
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('chart'));
        // 从HomeController中获取数据，遍历得到的表
        var lanType = [];
        var userNum = [];
        var repNum = [];
        var a = 0;
        <c:forEach items="${lanList}" var="lan2">
        lanType[a] = '${lan2.type}';    //注意这个要单引号，因为为字符串
        userNum[a] = ${lan2.users};
        repNum[a] = ${lan2.repositories};
        a = a + 1;
        </c:forEach>

        // 指定图表的配置项和数据
        var dataAxis = lanType;
        var data = userNum;
        var data2 = repNum;
        var yMax = 100;
        var dataShadow = [];

        for (var i = 0; i < data.length; i++) {
            dataShadow.push(yMax);
        }
        var option = {
            title: {
                text: '各语言用户数',
                subtext: '点击进行缩放'
            },
            xAxis: {
                data: dataAxis,
                axisLabel: {
                    inside: true,
                    textStyle: {
                        color: '#fff'
                    }
                },
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: false
                },
                z: 10
            },
            yAxis: {
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    textStyle: {
                        color: '#999'
                    }
                }
            },
            dataZoom: [
                {
                    type: 'inside'
                }
            ],
            series: [
                { // For shadow
                    type: 'bar',
                    itemStyle: {
                        normal: {color: 'rgba(0,0,0,0.05)'}
                    },
                    barGap: '-100%',
                    barCategoryGap: '40%',
                    data: dataShadow,
                    animation: false
                },
                {
                    type: 'bar',
                    itemStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#83bff6'},
                                    {offset: 0.5, color: '#188df0'},
                                    {offset: 1, color: '#188df0'}
                                ]
                            )
                        },
                        emphasis: {
                            color: new echarts.graphic.LinearGradient(
                                0, 0, 0, 1,
                                [
                                    {offset: 0, color: '#2378f7'},
                                    {offset: 0.7, color: '#2378f7'},
                                    {offset: 1, color: '#83bff6'}
                                ]
                            )
                        }
                    },
                    data: data
                }
            ]
        };

        // Enable data zoom when user click bar.
        var zoomSize = 6;
        myChart.on('click', function (params) {
            console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
            myChart.dispatchAction({
                type: 'dataZoom',
                startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
                endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
            });
        });

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
                    text: '各语言仓库数',
                    subtext: '点击进行缩放'
                },
                xAxis: {
                    data: dataAxis,
                    axisLabel: {
                        inside: true,
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    axisTick: {
                        show: false
                    },
                    axisLine: {
                        show: false
                    },
                    z: 10
                },
                yAxis: {
                    axisLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    axisLabel: {
                        textStyle: {
                            color: '#999'
                        }
                    }
                },
                dataZoom: [
                    {
                        type: 'inside'
                    }
                ],
                series: [
                    { // For shadow
                        type: 'bar',
                        itemStyle: {
                            normal: {color: 'rgba(0,0,0,0.05)'}
                        },
                        barGap: '-100%',
                        barCategoryGap: '40%',
                        data: dataShadow,
                        animation: false
                    },
                    {
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: new echarts.graphic.LinearGradient(
                                    0, 0, 0, 1,
                                    [
                                        {offset: 0, color: '#83bff6'},
                                        {offset: 0.5, color: '#188df0'},
                                        {offset: 1, color: '#188df0'}
                                    ]
                                )
                            },
                            emphasis: {
                                color: new echarts.graphic.LinearGradient(
                                    0, 0, 0, 1,
                                    [
                                        {offset: 0, color: '#2378f7'},
                                        {offset: 0.7, color: '#2378f7'},
                                        {offset: 1, color: '#83bff6'}
                                    ]
                                )
                            }
                        },
                        data: data2
                    }
                ]
            };
            myChart.setOption(option2);
        });
    </script>

</rapid:override>
<%@ include file="base.jsp" %>

