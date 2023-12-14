<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/5
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/Style.css" type="text/css" />
    <script type="text/javascript">
        //添加商品
        function addProduct() {
            window.location.href = "${pageContext.request.contextPath}/admin/goodsAdd.jsp";
        }
        //删除商品
        function p_del() {
            var msg = "您确定要删除该商品吗？";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body>
<br />
<form id="Form1" name="Form1"
      action="${pageContext.request.contextPath}/listGoodsByCategory"
      method="post">
    <table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
        <TBODY>
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3">
                <strong>按类别查询</strong>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tr>
                        <td height="30px" align="center" bgColor="#f5fafe" class="ta_01">类别：</td>
                        <td class="ta_01" bgColor="#ffffff">
                            <select name="category" id="category">
                                <option value="" selected="selected">--选择商品类别--</option>
                                <option value="phone">手机</option>
                                <option value="clothes">衣服</option>
                                <option value="foods">食品</option>
                                <option value="daily">日用</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgColor="#ffffff" class="ta_01">
                            <button type="submit" id="search" name="search" value="&#26597;&#35810;" class="button_view">
                                &#26597;&#35810;
                            </button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" name="reset" value="&#37325;&#32622;" class="button_view" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" height="40px" FONT-SIZE: 15pt><strong>商 品 列 表</strong>
            </TD>
        </tr>
        <tr>
            <td class="ta_01" align="right">
                <button type="button" id="add" name="add" value="&#28155;&#21152;" class="button_add" onclick="addProduct()">
                    &#28155;&#21152;
                </button>
            </td>
        </tr>
        <tr>
            <td class="ta_01" align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: rgb(128,128,128) 1px solid; BORDER-TOP: rgb(128,128,128) 1px solid; BORDER-LEFT: rgb(128,128,128) 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: rgb(128,128,128) 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
                        <td align="center" width="10%">商品编号</td>
                        <td align="center" width="20%">商品名称</td>
                        <td align="center" width="10%">商品价格</td>
                        <td align="center" width="10%">商品库存</td>
                        <td width="15%" align="center">商品类别</td>
                        <td width="8%" align="center">编辑</td>
                        <td width="8%" align="center">删除</td>
                    </tr>
                    <!--  循环输出所有商品 -->
                    <c:forEach items="${goodslist}" var="goods">
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';" >
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${goods.gid }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${goods.name }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${goods.price }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${goods.stock }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">${goods.category}</td>
                            <td align="center" style="height: 22px" width="8%">
                                <a href="${pageContext.request.contextPath}/findAGoodsServlet?gid=${goods.gid}">
                                    <img src="${pageContext.request.contextPath}/admin/images/i_edit.gif" border="0" style="CURSOR: hand">
                                </a>
                            </td>
                            <td align="center" style="HEIGHT: 22px" width="8%">
                                <a href="${pageContext.request.contextPath}/delGoodsServlet?gid=${goods.gid}" onclick="javascript:return p_del()">
                                    <img src="${pageContext.request.contextPath}/admin/images/i_del.gif"
                                         width="16" height="16" border="0" style="CURSOR: hand">
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
