<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/2
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
    <link rel="stylesheet" href="css/main.css" type="text/css" />
    <script type="text/javascript" src="js/my.js"></script>
</head>
<body class="main">
<jsp:include page="head.jsp" />

<div class="divcontent">
    <table border="0" cellspacing="0">
        <tr>
            <td class="registerSuccess" style="padding:30px; text-align:center">
                <table border="0" cellspacing="0" style="margin-top:70px">
                    <tr>
                        <td style="width:98px">
                            <img src="images/registerSuccess.jpg" width="700" height="310" />
                        </td>

                    </tr>
                    <tr>
                        <td class="registerSuccess1" style="padding-top:30px">
                            <font style="font-weight:bold; color:#000000" size="5px">恭喜您！注册成功,欢迎进入网上商城！</font><br />
                            <br /> <br />
                            <a class="skip" href="${pageContext.request.contextPath }/user/login.jsp">
                                <span id="second">4</span>秒后自动为您跳转登录
                            </a>
                        </td>
                    </tr>
                </table>
                <h1>&nbsp;</h1></td>
        </tr>
    </table>
</div>
</body>
</html>
