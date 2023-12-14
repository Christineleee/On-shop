<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/4
  Time: 17:47
  To change this template use File | Settings | File Templates.
  订单列表
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/main.css" type="text/css" />
</head>
<body class="main">
<!-- 使用了自定义标签 -->
<jsp:include page="head.jsp" />
<div id="divpagecontent">
    <ul>
        <li><img src="user/images/registerSuccess.jpg" width="200" height="150" /></li>
        <li><a class="active" href="#">个人中心</a></li>
        <li><a href="${pageContext.request.contextPath}/findOrderServlet?methods=user">订单查询</a></li>
        <li><a href="${pageContext.request.contextPath}/findSurfRecordServlet?type=user">浏览记录</a></li>
        <li><a href="${pageContext.request.contextPath}/logoutServlet" onclick="javascript:return confirm_logout()">退出登录</a></li>
    </ul>
</div>
<div class="divcontent_2">
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" class="infocontent">
                    <tr>
                        <td style="padding:20px"><p><b>我的订单</b></p>
                            <p>
                                共有<font style="color:#FF0000" >${orders.size()}</font>订单
                            </p>
                            <table width="100%" border="0" cellspacing="0" class="tableopen">
                                <tr>
                                    <td bgcolor="#A3E6DF" class="tableopentd01">订单号</td>
                                    <td bgcolor="#A3D7E6" class="tableopentd01">收件人</td>
                                    <td bgcolor="#A3CCE6" class="tableopentd01">订单时间</td>
                                    <td bgcolor="#A3B6E6" class="tableopentd01">状态</td>
                                    <td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
                                </tr>
                                <c:forEach items="${orders}" var="order">
                                    <tr>
                                        <td class="tableopentd02">${order.oid}</td>
                                        <td class="tableopentd02">${order.receiverName }</td>
                                        <td class="tableopentd02">
                                                ${order.orderTime}
                                        </td>
                                        <td class="tableopentd02">${order.payState==0?"未支付":"已支付"}</td>
                                        <td class="tableopentd03">
                                            <a href="${pageContext.request.contextPath}/findOrderServlet?methods=oid&oid=${order.oid}">查看</a>&nbsp;&nbsp;
<%--                                            <c:if test="${order.paystate==0 }">--%>
<%--                                                <a href="${pageContext.request.contextPath}/opOrderServlet?method=delete&oid=${order.id}"  onclick="javascript:return o_del()">删除</a>--%>
<%--                                            </c:if>--%>
<%--                                            <c:if test="${order.paystate!=0 }">--%>
<%--                                                <a href="${pageContext.request.contextPath}/opOrderServlet?method?id=${order.id}&type=client" onclick="javascript:return o_del()">删除</a>--%>
<%--                                            </c:if>--%>
                                            <a href="${pageContext.request.contextPath}/opOrderServlet?methods=delete&oid=${order.oid}"  onclick="javascript:return o_del()">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
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
