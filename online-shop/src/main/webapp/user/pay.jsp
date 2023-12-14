<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/4
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>支付</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/user/css/main.css" type="text/css" />
</head>
<body>
<jsp:include page="head.jsp" />
<div id="divpagecontent">
    <ul>
        <li><img src="${pageContext.request.contextPath}/user/images/registerSuccess.jpg" width="200" height="150" /></li>
        <li><a class="active" href="#">个人中心</a></li>
        <li><a href="${pageContext.request.contextPath}/findOrderServlet?methods=user">订单查询</a></li>
        <li><a href="${pageContext.request.contextPath}/logoutServlet" onclick="javascript:return confirm_logout()">退出登录</a></li>
    </ul>
</div>
<div class="divcontent_2">
    <p style="float:left"><b>&nbsp;&nbsp;支付中心&nbsp;>>&nbsp;确认支付</b></p>
    <img src="${pageContext.request.contextPath}/user/images/registerSuccess.jpg" width="850" height="89" />
    <table><tr height="30px"></tr></table>
    <form action="${pageContext.request.contextPath}/payServlet" method="post">
        订单号&nbsp;&nbsp;<INPUT class="textinput" TYPE="text" NAME="oid" value="${param.oid}" style="color:#FF0000">
        &nbsp;&nbsp;&nbsp;&nbsp;
        支付金额&nbsp;&nbsp;<INPUT class="textinput" TYPE="text" NAME="money" value="${param.money}" style="color:#FF0000">元
        <div class="divBank">
            <table><tr height="15px"></tr></table>
            <div class="divText">选择支付方式</div>
            <table><tr height="15px"></tr>
            </table>
            <div style="margin-left: 20px;">
                <div style="margin-bottom: 20px;">
                    <label class="demo--label">
                        <input class="demo--radio" type="radio" name="yh" value="ICBC-NET-B2C" checked="checked">
                        <span class="demo--radioInput"></span><img name="ICBC-NET-B2C" align="middle" src="<c:url value='/user/images/WeChatpay.png'/>" />
                    </label>
                    <label class="demo--label">
                        <input class="demo--radio" type="radio" name="yh" value="ICBC-NET-B2C">
                        <span class="demo--radioInput"></span><img name="CMBCHINA-NET-B2C" align="middle" src="<c:url value='/user/images/Alipay.png'/>" />
                    </label>
                </div>
            </div>
            <div style="margin: 40px;">
                <INPUT TYPE="submit" class="submit6" value="确定支付"/>
            </div>
        </div>
    </form>
</div>
</body>
</html>
