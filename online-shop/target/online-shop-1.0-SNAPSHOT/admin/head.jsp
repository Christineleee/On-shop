<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/4
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/user/css/main.css" type="text/css" />
<header>
    <div class="header">
        <div class="container">
            <div class="logo1"><a href="${pageContext.request.contextPath}/admin/home.jsp">线 上 商 城 后&nbsp;&nbsp;台</a></div>
        </div>
        <div>
            <ul class="head_right1">
                <li class="head-compose1"><a href="#">
                    <img class="profile" src="${pageContext.request.contextPath}/admin/images/registerSuccess.jpg" width="45" height="45" /></a></li>
                <li class="head-compose2"><a href="#">${user.username}</a></li>
            </ul>
        </div>
    </div>
</header>
