<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/4
  Time: 22:42
  To change this template use File | Settings | File Templates.
  显示订单详情并进行结算
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详情</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/user/css/main.css" type="text/css" />
<body class="main">
<jsp:include page="head.jsp" />
<div id="divpagecontent">
    <ul>
        <li><img src="user/images/registerSuccess.jpg" width="200" height="150" /></li>
        <li><a class="active" href="#">个人中心</a></li>
        <li><a href="${pageContext.request.contextPath}/findOrderServlet?methods=user">订单查询</a></li>
        <li><a href="${pageContext.request.contextPath}/logoutServlet" onclick="javascript:return confirm_logout()">退出登录</a></li>
    </ul>
</div>
<div class="divcontent_6">
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td><p>&nbsp;&nbsp;订单查询&nbsp;>>&nbsp;订单详细信息<p>
                <table cellspacing="0" class="infocontent">
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0">

                                <tr>
                                    <td><p>订单编号:${order.oid}</p>
                                        <img src="${pageContext.request.contextPath}/user/images/registerSuccess.jpg" width="892" height="89" />
                                        <table cellspacing="1" class="carttable">
                                            <tr>
                                                <td width="10%">序号</td>
                                                <td width="40%">商品名称</td>
                                                <td width="10%">价格</td>
                                                <td width="10%">数量</td>
                                                <td width="10%">小计</td>
                                            </tr>
                                        </table>
                                        <c:forEach items="${order.items}" var="item" varStatus="vs">
                                            <table width="100%" border="0" cellspacing="0">
                                                <tr>
                                                    <td width="10%">${vs.count }</td>
                                                    <td width="40%">${item.goods.name}</td>
                                                    <td width="10%">${item.goods.price }</td>
                                                    <td width="10%">${item.num }</td>
                                                    <td width="10%">${item.num*item.goods.price }</td>
                                                </tr>
                                            </table>
                                        </c:forEach>
                                        <table cellspacing="1" class="carttable">
                                            <tr>
                                                <td style="text-align:right; padding-right:40px;"><font
                                                        style="color:#FF0000">合计：&nbsp;&nbsp;${order.money}</font>
                                                </td>
                                            </tr>
                                        </table>
                                        <p>
                                            收货地址：${order.receiverAddress }&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                            收货人：&nbsp;&nbsp;&nbsp;&nbsp;${order.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                            联系方式：${order.receiverEmail }&nbsp;&nbsp;&nbsp;&nbsp;
                                        </p>
                                        <hr>
                                        <c:if test="${order.payState != 1 }">
                                            <p style="text-align:right">
                                                <a href="${pageContext.request.contextPath}/user/pay.jsp?oid=${order.oid}&money=${order.money}">
                                                    <input type="button" class="submit4" name="buy" value="支付"/>
                                                </a>
                                            </p>
                                        </c:if>
                                    </td>
                                </tr>
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
