<%--
  Created by IntelliJ IDEA.
  User: Rory_Zhong
  Date: 2018/5/12
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %><%--这个非常重要--%>
<rapid:override name="content">
    <div class="ui equal width grid change_margin" style="margin: 5px 0 5px 30px;width: 70%">
        <div class="row">
            <div class="column">
                <div class="ui red segment" style="height: 15%">
                    <div class="ui statistic" style="margin: auto;">
                        <div class="value">
                                ${repNums}
                        </div>
                        <div style="font-size: 16px">
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;GitHub Repositories</strong>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column">
                <div class="ui blue segment" style="height: 15%">
                    <div class="ui statistic" style="margin: auto;">
                        <div class="value">
                                ${userNums}
                        </div>
                        <div style="font-size: 16px">
                            <strong>&nbsp;&nbsp;&nbsp;&nbsp;GitHub Users</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <!--卡片组，用于显示排行榜-->
            <div class="column">
                <div class="ui fluid card">
                    <img src="img/language.jpg" height="20%" >
                    <table class="ui striped table" style="margin-top: 0px;height: 40%">
                        <tbody>
                        <c:forEach begin="0" end="5" var="i">
                            <c:set var="item" value="${lanList2[i]}"/>
                            <tr>
                                <td>No.${i+1}</td>
                                <td>${item.type}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="column">
                <div class="ui fluid card">
                    <img src="img/area.jpg" height="20%">
                    <table class="ui striped table" style="margin-top: 0px;height: 40%">
                        <tbody>
                        <c:forEach begin="0" end="5" var="i">
                            <c:set var="item2" value="${areaList[i]}"/>
                            <tr>
                                <td>No.${i+1}</td>
                                <td>${item2.chinaName}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="column">
                <div class="ui fluid card">
                    <img src="img/repository.jpg" height="20%">
                    <table class="ui striped table" style="margin-top: 0px;height: 40%">
                        <tbody>
                        <c:forEach begin="0" end="5" var="i">
                            <c:set var="item3" value="${repList[i]}"/>
                            <tr>
                                <td>No.${i+1}</td>
                                <td><a href="${item3.url}" target="_blank" style="color:#0f0f0f;">${item3.name}</a></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
    <script>
        $('#summary').addClass('active');
    </script>
</rapid:override>
<%@ include file="base.jsp" %>

