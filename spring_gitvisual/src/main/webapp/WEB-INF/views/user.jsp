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
                <div class="ui container segment">
                    <div>
                        这是菜单栏部分
                    </div>
                    <div class="ui bottom attached segment" id="chart" style="height: 400px;padding: 2px">
                        这是用户画图的地方
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('#user').addClass('active');
    </script>
</rapid:override>
<%@ include file="base.jsp" %>
