<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/5
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/Style.css" type="text/css" />
    <script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
</head>
<body>
<table cellSpacing="1" cellPadding="5" width="100%" align="center"
       bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
  <tr>
    <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4" height="30">
      <strong>
        订单详细信息
      </strong>
    </td>
  </tr>
  <tr>
    <td width="18%" align="center" bgColor="#f5fafe" class="ta_01" >订单编号：</td>
    <td class="ta_01" bgColor="#ffffff">${order.oid}</td>
    <td align="center" bgColor="#f5fafe" class="ta_01">所属用户：</td>
    <td class="ta_01" bgColor="#ffffff">${order.user.username }</td>
  </tr>
  <tr>
    <td align="center" bgColor="#f5fafe" class="ta_01">收件人：</td>
    <td class="ta_01" bgColor="#ffffff">${order.receiverName }</td>
    <td align="center" bgColor="#f5fafe" class="ta_01">联系邮箱：</td>
    <td class="ta_01" bgColor="#ffffff">${order.receiverEmail }</td>
  </tr>
  <tr>
    <td align="center" bgColor="#f5fafe" class="ta_01">送货地址：</td>
    <td class="ta_01" bgColor="#ffffff">${order.receiverAddress}</td>
    <td align="center" bgColor="#f5fafe" class="ta_01">总价：</td>
    <td class="ta_01" bgColor="#ffffff">${order.money }</td>
  </tr>
  <tr>
    <td align="center" bgColor="#f5fafe" class="ta_01">下单时间：</td>
    <td class="ta_01" bgColor="#ffffff" colSpan="3">${order.orderTime}</td>
  </tr>
  <TR>
    <TD class="ta_01" align="center" bgColor="#f5fafe">商品信息</TD>
    <TD class="ta_01" bgColor="#ffffff" colSpan="3">
      <table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
             style="BORDER-RIGHT: rgb(128,128,128) 1px solid; BORDER-TOP: rgb(128,128,128) 1px solid; BORDER-LEFT: rgb(128,128,128) 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: rgb(128,128,128) 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
        <tr style="FONT-WEIGHT: bold; FONT-SIZE: 15pt; HEIGHT: 40px; BACKGROUND-COLOR: #afd1f3">
          <td align="center" width="7%">商品序号</td>
          <td align="center" width="18%">商品编号</td>
          <td align="center" width="10%">商品名称</td>
          <td align="center" width="10%">商品价格</td>
          <td width="7%" align="center">购买数量</td>
          <td width="7%" align="center">商品类别</td>
          <td width="31%" align="center">商品描述</td>
        </tr>
        <c:forEach items="${order.items}" var="item" varStatus="vs">
          <tr style="FONT-WEIGHT: bold; FONT-SIZE: 15pt; HEIGHT: 35px; BACKGROUND-COLOR: #eeeeee">
            <td align="center" width="7%">${vs.count }</td>
            <td align="center" width="18%">${item.goods.gid }</td>
            <td align="center" width="10%">${item.goods.name }</td>
            <td align="center" width="10%">${item.goods.price }</td>
            <td width="7%" align="center">${item.num }</td>
            <td width="7%" align="center">${item.goods.category }</td>
            <td width="31%" align="center">${item.goods.description}</td>
          </tr>
        </c:forEach>
      </table>
    </TD>
  </TR>
  <TR>
    <td align="center" colSpan="4" class="sep1"><img
            src="${pageContext.request.contextPath}/admin/images/shim.gif">
    </td>
  </TR>
  <TR>
    <td class="ta_01" style="WIDTH: 100%" align="right" bgColor="#f5fafe" colSpan="4" height="30px">
      <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
      <a href="${pageContext.request.contextPath }/sendEmailServlet?oid=${order.oid}">发货</a>
      <span id="Label2"></span>
    </td>
  </TR>
  <TR>
    <td class="ta_01" style="WIDTH: 100%" align="right" bgColor="#f5fafe" colSpan="4">
      <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
      <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
      <span id="Label1"></span>
    </td>
  </TR>
</table>
</body>
</html>
