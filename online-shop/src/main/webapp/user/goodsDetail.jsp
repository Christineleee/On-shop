<%@ page import="com.demo.pojo.Goods" %><%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/3
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/user/css/main.css" type="text/css" />
</head>
<body class="main">
<jsp:include page="head.jsp" />
<div class="divpagecontent3">
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td>
                <div style="text-align:right; margin:5px 10px 5px 0px">
                    <a class="p1" href="${pageContext.request.contextPath}/showGoodsServlet?methods=category&category=${goods.category}">&nbsp;商品详情</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${goods.name}
                </div>
                <table cellspacing="0" class="infocontent">
                    <tr>
                        <td><img src="${pageContext.request.contextPath }/user/images/registerSuccess.jpg" width="900" height="84" />
                            <table width="100%" border="0" cellspacing="0">
                                <tr>
                                    <td style="padding:20px 5px 5px 5px">
                                        <img src="${pageContext.request.contextPath }/user/images/miniicon3.gif" width="16" height="16" />
                                        <font class="bookname">&nbsp;${goods.name}</font>
                                        <hr />售价：<font color="#FF0000">￥${goods.price}</font>
                                        <hr /> 类别：${goods.category }
                                        <hr />库存量：${goods.stock}
                                        <hr />
                                        <p>
                                            <b>内容简介：</b>
                                        </p> ${goods.description}
                                    </td>
                                </tr>
                                <c:if test="${sessionScope.isLogin==true}">
                                    <tr><td><div style="text-align:center; margin-top:10px">
                                        <a href="${pageContext.request.contextPath}/addCartServlet?gid=${goods.gid}">
                                            <button class="submit" name="submit">购买</button>
                                        </a>
                                    </div>
                                    </td></tr>
                                </c:if>
                                <c:if test="${sessionScope.isLogin==false}">
                                    <tr><td>
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录后即可购买噢</p>
                                    </td></tr>
                                </c:if>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
