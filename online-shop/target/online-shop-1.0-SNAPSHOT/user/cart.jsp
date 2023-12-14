<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/2
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/main.css" type="text/css" />
    <script>
        //当商品数量发生变化时触发该方法
        function changeProductNum(count, totalCount, gid) {
            count = parseInt(count);
            totalCount = parseInt(totalCount);
            //如果数量为0，判断是否要删除商品
            if (count == 0) {
                let flag = window.confirm("确认删除商品吗?");

                if (!flag) {
                    count = 1;
                }
            }
            if (count > totalCount) {
                alert("已达到商品最大购买量");
                count = totalCount;
            }
            location.href = "${pageContext.request.contextPath}/updateCartServlet?gid="
                + gid + "&count=" + count;
        }
        //删除购物车中的商品
        function cart_del() {
            let msg = "您确定要删除该商品吗？";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body class="main">
<jsp:include page="head.jsp" />
<div class="divcontent_s1">
    <table border="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" class="infocontent">
                    <tr>
                        <td><p>购物车&nbsp;>>&nbsp;订&nbsp;&nbsp;单&nbsp;&nbsp;(待支付)<p>
                            <img src="${pageContext.request.contextPath}/user/images/registerSuccess.jpg" width="900" height="89" />
                            <table border="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <table cellspacing="1" class="carttable">
                                            <tr>
                                                <td width="10%">序号</td>
                                                <td width="30%">商品名称</td>
                                                <td width="10%">价格</td>
                                                <td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
                                                <td width="10%">库存</td>
                                                <td width="10%">小计</td>
                                                <td width="10%">取消</td>
                                            </tr>
                                        </table>
                                        <!-- 循环输出商品信息 -->
                                        <c:set var="total" value="0" />
                                        <c:forEach items="${cart}" var="entry" varStatus="vs">
                                            <table width="100%" border="0" cellspacing="0">
                                                <tr>
                                                    <td width="10%">${vs.count}</td>
                                                    <td width="30%">${entry.key.name }</td>
                                                    <td width="10%">${entry.key.price }</td>
                                                    <td width="20%">
                                                        <!-- 减少商品数量 -->
                                                        <input type="button" value='-' style="width:20px"
                                                               onclick="changeProductNum('${entry.value-1}','${entry.key.stock}','${entry.key.gid}')">
                                                        <!-- 商品数量显示 -->
                                                        <input name="text" type="text" value="${entry.value}" style="width:40px;text-align:center" />
                                                        <!-- 增加商品数量 -->
                                                        <input type="button" value='+' style="width:20px"
                                                               onclick="changeProductNum('${entry.value+1}','${entry.key.stock}','${entry.key.gid}')">
                                                    </td>
                                                    <td width="10%">${entry.key.stock}</td>
                                                    <td width="10%">${entry.key.price*entry.value}</td>
                                                    <td width="10%">
                                                        <!-- 删除商品 -->
                                                        <a href="${pageContext.request.contextPath}/updateCartServlet?gid=${entry.key.gid}&count=0"
                                                           style="color:#FF0000; font-weight:bold" onclick="javascript:return cart_del()">X</a>
                                                    </td>
                                                </tr>
                                            </table>
<%--                                            总价--%>
                                            <c:set value="${total+entry.key.price*entry.value}" var="total" />
                                        </c:forEach>

                                        <table cellspacing="1" class="carttable">
                                            <tr>
                                                <td style="text-align:right; padding-right:40px;">
                                                    <font style="color:#FF6600; font-weight:bold">合计：&nbsp;&nbsp;${total}元</font>
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="text-align:right; margin-top:10px">
                                            <!--继续购物 -->
                                            <a href="${pageContext.request.contextPath}/showGoodsServlet">
                                                <input type="button" class="submit3" name="con_buy" value="继续购物"/>
                                            </a>

                                            <!--结账 -->
                                            <a href="${pageContext.request.contextPath}/user/settlement.jsp">
                                                <input type="button" class="submit4" name="buy" value="结账"/>
                                            </a>
                                        </div>
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
