<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/5
  Time: 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/Style.css" type="text/css" />
</head>
<body>
<form id="userAction_save_do" name="Form1"
      action="${pageContext.request.contextPath}/addGoodsServlet" method="post">
    &nbsp;
    <table cellSpacing="1" cellPadding="5" width="100%" align="center"
           bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
                height="50"><strong><STRONG>添加商品</STRONG> </strong>
            </td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
            <td class="ta_01" bgColor="#ffffff"><input type="text" name="name" class="bg" /></td>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品价格：</td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="price" class="bg" />
            </td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品库存：</td>
            <td class="ta_01" bgColor="#ffffff">
                <input type="text" name="stock" class="bg" />
            </td>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品类别：</td>
            <td class="ta_01" bgColor="#ffffff">
                <select name="category" id="category">
                    <option value="" selected="selected">--选择商品类--</option>
                    <option value="phone">手机</option>
                    <option value="clothes">衣服</option>
                    <option value="food">食品</option>
                    <option value="daily">日用</option>
                </select>
            </td>
        </tr>
        <TR>
            <TD class="ta_01" align="center" bgColor="#f5fafe">商品描述：</TD>
            <TD class="ta_01" bgColor="#ffffff" colSpan="3">
                <textarea name="description" cols="30" rows="3" style="WIDTH: 96%"></textarea>
            </TD>
        </TR>
        <TR>
            <td align="center" colSpan="4" class="sep1"><img
                    src="${pageContext.request.contextPath}/admin/images/shim.gif">
            </td>
        </TR>
        <tr>
            <td class="ta_01" style="WIDTH: 100%" align="center"
                bgColor="#f5fafe" colSpan="4">
                <input type="submit" class="button_ok" value="确定">
                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
                <input type="reset" value="重置" class="button_cancel">
                <FONT face="宋体">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </FONT>
                <INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" />
                <span id="Label1"></span>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
