<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/5
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表</title>
    <link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
</head>
<body>
<br />
<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/findOrderServlet?methods=username" method="post">
    <table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
        <TBODY>
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3">
                <strong>查 询 条 件</strong>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tr>
                        <td height="40" align="center" bgColor="#f5fafe" class="ta_01">
                            用户名</td>
                        <td class="ta_01" bgColor="#ffffff">
                            <input type="text" name="username" size="15" value="" id="Form1_userName1" class="bg" />
                        </td>
                    </tr>
                    <tr>
                        <td width="100" height="40" align="center" bgColor="#f5fafe" class="ta_01"></td>
                        <td class="ta_01" bgColor="#ffffff">
                            <font face="宋体" color="red"> &nbsp;</font>
                        </td>
                        <td align="right" bgColor="#ffffff" class="ta_01">
                            <br /><br />
                        </td>
                        <td align="right" bgColor="#ffffff" class="ta_01">
                            <button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button_view">
                                &#26597;&#35810;
                            </button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" height="40px" FONT-SIZE: 15pt>
                <strong>订 单 列 表</strong>
            </td>
        </tr>
        <tr>
            <td class="ta_01" align="right"></td>
        </tr>
        <tr>
            <td class="ta_01" align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: rgb(128,128,128) 1px solid; BORDER-TOP: rgb(128,128,128) 1px solid; BORDER-LEFT: rgb(128,128,128) 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: rgb(128,128,128) 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr style="FONT-WEIGHT: bold; FONT-SIZE: 15pt; HEIGHT: 40px; BACKGROUND-COLOR: #afd1f3">
                        <td align="center" width="20%">订单编号</td>
                        <td align="center" width="10%">收件人</td>
                        <td align="center" width="15%">地址</td>
                        <td align="center" width="10%">联系邮箱</td>
                        <td width="11%" align="center">总价</td>
                        <td width="8%" align="center">所属用户</td>
                        <td width="10%" align="center">订单状态</td>
                        <td width="7%" align="center">查看</td>
                    </tr>
                    <c:forEach items="${orders}" var="order">
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="20%">${order.oid}</td>
                            <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="10%">${order.receiverName}</td>
                            <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="15%">${order.receiverAddress }</td>
                            <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="10%">${order.receiverEmail }</td>
                            <td style="CURSOR: hand; HEIGHT: 30px" align="center">${order.money}</td>
                            <td width="8%" align="center">${order.user.username}</td>
                            <td width="10%" align="center">${order.payState==0?"未支付":"已支付"}</td>
                            <td align="center" style="HEIGHT: 30px">
                                <a href="${pageContext.request.contextPath}/findOrderServlet?methods=oid&type=admin&oid=${order.oid}">
                                    <img src="${pageContext.request.contextPath}/admin/images/check.png" border="0" width="20px" height="30px" style="CURSOR: hand">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
        </TBODY>
    </table>
</form>
</body>
</html>
