<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/2
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <%--导入css和js --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/main.css" type="text/css"/>
  <script type="text/javascript" src="${pageContext.request.contextPath}/user/js/form.js" charset="UTF-8"></script>
</head>
<body class="main">
<%@include file="head.jsp" %>
<div class="divcontent">
  <form action="${pageContext.request.contextPath}/registerServlet" method="post" onsubmit="return checkForm();">
    <table width="850px" border="0" cellspacing="0">
      <tr>
        <td class="new_users" style="padding: 30px"><h2>新用户注册</h2>
          <table width="70%" border="0" cellspacing="2" class="upline">
            <tr height="15px"></tr>
            <tr>

              <td style="text-align: right">用户名 &emsp; </td>
              <td><input type="text" class="textinput"  id="username" name="username" onkeyup="checkUsername();"/>
              </td>
              <td colspan="2"><span id="usernameMsg"></span><font color="#999999" size="2px">&nbsp;字母数字下划线1到10位, 不能是数字开头</font></td>
            </tr>
            <tr height="15px"></tr>
            <tr>
              <td style="text-align: right">密码 &emsp; </td>
              <td><input type="password" class="textinput"  id="password" name="password" onkeyup="checkPassword();"/></td>
              <td><span id="passwordMsg"></span><font color="#999999" size="2px">&nbsp;密码请设置4-15位字符</font></td>
            </tr>
            <tr height="15px"></tr>
            <tr>
              <td style="text-align: right">重复密码 &emsp; </td>
              <td>
                <input type="password" class="textinput"  id="repassword" name="repassword" onkeyup="checkConfirm();"/>
              </td>
              <td><span id="confirmMsg"></span>&nbsp;</td>
            </tr>
            <tr>
              <td style="text-align: right; width: 20%">邮箱 &emsp; </td>
              <td style="width: 40%">
                <input type="text" class="textinput"  id="email" name="email" onkeyup="checkEmail();"/>
              </td>
              <td colspan="2"><span id="emailMsg"></span><font color="#999999" size="2px">&nbsp;请输入有效的qq邮箱地址</font></td>
            </tr>
            <tr height="5px"></tr>
          </table>
          <table>
            <tr height="20px"></tr>
            <tr>
              <td>
                <button class="submit" name="submit">提交</button>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
