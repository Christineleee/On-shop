<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/2
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/user/css/main.css" type="text/css" />
</head>
<body class="main">
<jsp:include page="head.jsp" />
<div id="divpagecontent">
    <ul>
        <li><img src="${pageContext.request.contextPath}/admin/images/registerSuccess.jpg" width="200" height="150" /></li>
        <li><a class="active" href="#">后台中心</a></li>
        <li><a href="${pageContext.request.contextPath}/listGoodsServlet" target="mainFrame">商品管理</a></li>
        <li><a href="${pageContext.request.contextPath}/salesListServlet" target="mainFrame">销售榜单</a></li>
        <li><a href="${pageContext.request.contextPath}/findSurfRecordServlet?type=admin&methods=all" target="mainFrame">用户浏览记录</a></li>
        <li><a href="${pageContext.request.contextPath}/findOrderServlet?methods=all" target="mainFrame">订单管理</a></li>
        <li><a href="${pageContext.request.contextPath}/logoutServlet">退出系统</a></li>
    </ul>
</div>
<div class="divcontent_2">
    <img src="${pageContext.request.contextPath}/user/images/registerSuccess.jpg" width="840" height="300" />
    <table><tr height="30px"></tr></table>
    <p><b style="font-size:23px">欢迎来到线上商城,这里是后台管理中心，请在左栏选择需要查看的内容。</b></p>
</div>
</body>
</html>
