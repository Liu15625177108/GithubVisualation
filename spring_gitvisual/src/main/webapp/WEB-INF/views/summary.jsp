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
    <div class="ui equal width grid" style="margin: 5px 0 5px 30px;width: 70%">
        <div class="row">
            <div class="column">
                <div class="ui red segment">
                    <div class="ui statistic">
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
                <div class="ui blue segment">
                    <div class="ui statistic">
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
                <div class="ui link card">
                    <img src="img/language.jpg" height="100px">
                    <table class="ui striped table" style="margin-top: 0px">
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
                <div class="ui link card">
                    <img src="img/area.jpg" height="100px">
                    <table class="ui striped table" style="margin-top: 0px">
                        <tbody>
                        <tr>
                            <td>No.1</td>
                            <td>Area A</td>
                        </tr>
                        <tr>
                            <td>No.2</td>
                            <td>Area B</td>
                        </tr>
                        <tr>
                            <td>No.3</td>
                            <td>Area C</td>
                        </tr>
                        <tr>
                            <td>No.4</td>
                            <td>Area D</td>
                        </tr>
                        <tr>
                            <td>No.5</td>
                            <td>Area E</td>
                        </tr>
                        <tr>
                            <td>No.6</td>
                            <td>Area F</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="column">
                <div class="ui link card">
                    <img src="img/repository.jpg" height="100px">
                    <table class="ui striped table" style="margin-top: 0px">
                        <tbody>
                        <tr>
                            <td>No.1</td>
                            <td>repository A</td>
                        </tr>
                        <tr>
                            <td>No.2</td>
                            <td>repository B</td>
                        </tr>
                        <tr>
                            <td>No.3</td>
                            <td>repository C</td>
                        </tr>
                        <tr>
                            <td>No.4</td>
                            <td>repository D</td>
                        </tr>
                        <tr>
                            <td>No.5</td>
                            <td>repository E</td>
                        </tr>
                        <tr>
                            <td>No.6</td>
                            <td>repository F</td>
                        </tr>
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

