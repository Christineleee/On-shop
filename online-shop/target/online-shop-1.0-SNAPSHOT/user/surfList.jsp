<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/6
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浏览记录</title>
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
                        <td style="padding:20px"><p><b>我的浏览记录</b></p>
                            <p>
                                共有<font style="color:#FF0000" >${records.size()}</font>记录
                            </p>
                            <table width="100%" border="0" cellspacing="0" class="tableopen">
                                <tr>
                                    <td bgcolor="#A3E6DF" class="tableopentd01">用户名</td>
                                    <td bgcolor="#A3D7E6" class="tableopentd01">商品编号</td>
                                    <td bgcolor="#A3CCE6" class="tableopentd01">商品名</td>
                                    <td bgcolor="#A3B6E6" class="tableopentd01">浏览时间</td>
                                    <td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
                                </tr>
                                <c:forEach items="${records}" var="record">
                                    <tr>
                                        <td class="tableopentd02">${record.username}</td>
                                        <td class="tableopentd02">${record.gid }</td>
                                        <td class="tableopentd02">
                                                ${record.goodsname}
                                        </td>
                                        <td class="tableopentd02">${record.surfTime}</td>
                                        <td class="tableopentd03">
                                            <a href="${pageContext.request.contextPath}/showDetailServlet?gid=${record.gid}">查看商品</a>&nbsp;&nbsp;
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
