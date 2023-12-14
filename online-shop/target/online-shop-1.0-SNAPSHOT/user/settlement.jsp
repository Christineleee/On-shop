<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/4
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品结算</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/main.css" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/user/js/order.js"></script>
</head>
<body class="main">
<jsp:include page="head.jsp" />
<div class="divcontent_s1">
    <table width="100%" border="0" cellspacing="0">
        <tr>
            <td>
                <form id="orderForm" action="${pageContext.request.contextPath}/opOrderServlet?methods=create" method="post">
                    <table cellspacing="0" class="infocontent">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellspacing="0">
                                    <tr>
                                        <td><img src="${pageContext.request.contextPath}/user/images/registerSuccess.jpg" width="900" height="89" />
                                            <p>你好，${user.username}！欢迎您来到线上商城结算中心,记得填写收货地址哦！</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table cellspacing="1" class="carttable">
                                                <tr>
                                                    <td width="10%">序号</td>
                                                    <td width="40%">商品名称</td>
                                                    <td width="10%">价格</td>
                                                    <td width="10%">类别</td>
                                                    <td width="10%">数量</td>
                                                    <td width="10%">小计</td>
                                                </tr>
                                            </table>
                                            <c:set value="0" var="totalPrice"/>
                                            <c:forEach items="${cart}" var="entry" varStatus="vs">
                                                <table width="100%" border="0" cellspacing="0">
                                                    <tr>
                                                        <td width="10%">${vs.count}</td>
                                                        <td width="40%">${entry.key.name }</td>
                                                        <td width="10%">${entry.key.price }</td>
                                                        <td width="10%">${entry.key.category}</td>
                                                        <td width="10%">
                                                            <input name="text" type="text" value="${entry.value}" style="width:20px" readonly="readonly"/>
                                                        </td>
                                                        <td width="10%">${entry.key.price*entry.value}</td>
                                                    </tr>
                                                </table>
                                                <c:set var="totalPrice" value="${totalPrice+entry.key.price*entry.value}"/>
                                            </c:forEach>

                                            <table cellspacing="1" class="carttable">
                                                <tr>
                                                    <td style="text-align:right; padding-right:40px;"><font
                                                            style="color:#FF0000">合计：&nbsp;&nbsp;${totalPrice}元</font>
                                                        <input type="hidden" name="money" value="${totalPrice}">
                                                    </td>
                                                </tr>
                                            </table>
                                            <p>
                                                收货地址：<input id="receiverAddress" name="receiverAddress" type="text" value=""style="width:350px" onkeyup="checkReceiverAddress();" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <span id="receiverAddressMsg"></span>
                                                <br/>
                                                收货人：&nbsp;&nbsp;&nbsp;&nbsp;<input id="receiverName" name="receiverName" type="text" value="${user.username}" style="width:150px" onkeyup="checkReceiverName();" />
                                                <span id="receiverNameMsg"></span>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <br/>
                                                收货人邮箱：<input type="text" id="receiverEmail" name="receiverEmail" value="${user.email}" style="width:150px" onkeyup="checkReceiverEmail();" />
                                                <span id="receiverEmailMsg"></span>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                            </p>
                                            <hr />
                                            <p style="text-align:right">
                                                <input type="button" class="submit5" name="submit_order" value="提交订单" onclick="checkOnSubmit();"/>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
