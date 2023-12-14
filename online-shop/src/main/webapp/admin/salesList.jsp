<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/4
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>销售榜单</title>
    <link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
</head>
<body>
<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
    <TBODY>
    <tr>
        <td class="ta_01" align="center" bgColor="#afd1f3" height="40px" FONT-SIZE: 15pt>
            <strong >榜 单 列 表 （ 按 照 销 量 排 序 ）</strong>
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
                    <td align="center" width="13%">排名</td>
                    <td align="center" width="13%">商品编号</td>
                    <td align="center" width="20%">商品名称</td>
                    <td align="center" width="15%">商品单价</td>
                    <td width="15%" align="center">销量</td>
                    <td width="15%" align="center">销售额</td>
                </tr>
                <c:forEach items="${salelist}" var="array" varStatus="vs">
                    <tr onmouseover="this.style.backgroundColor = 'white'"
                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="13%">${vs.count}</td>
                        <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="13%">${array[0]}</td>
                        <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="20%">${array[1] }</td>
                        <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="15%">${array[2]}</td>
                        <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="15%">${array[3] }</td>
                        <td style="CURSOR: hand; HEIGHT: 30px" align="center" width="15%">${array[2]*array[3] }</td>
                    </tr>
                </c:forEach>
            </table>
        </td>
    </tr>
    </TBODY>
</table>
</body>
</html>
