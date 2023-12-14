<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/2
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/main.css" type="text/css" />
</head>

<body class="main">
<jsp:include page="head.jsp" />
<div class="divcontent_s">
    <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <table width="850px" border="0" cellspacing="0">
            <tr>
                <td style="padding:30px"><div style="height:470px">

                    <div>
                        <table  border="0" cellspacing="0">
                            <tr>
                                <td>
                                    <div>
                                        <table border="0" cellspacing="0">

                                            <tr>
                                                <td style="text-align:center;padding-top:20px;"><font
                                                        color="#ff0000">${requestScope["error"]}</font>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="login" style="text-align:center"><h2>用户登录</h2>
                                                    <table border="0" cellspacing="0"
                                                           style="margin-top:15px ;margin-left:auto; margin-right:auto">

                                                        <tr>
                                                            <td
                                                                    style="text-align:right; padding-top:5px; width:25%">用户名&emsp;</td>
                                                            <td style="text-align:left">
                                                                <input name="username" id="usernameInput"
                                                                                               type="text" class="textinput" onblur="checkUsername()" />
                                                                <span id="usernameMsg"></span>
                                                            </td>
                                                        </tr>
                                                        <tr height="15px"></tr>
                                                        <tr>
                                                            <td style="text-align:right; padding-top:5px">密&nbsp;&nbsp;&nbsp;&nbsp;码&emsp;</td>
                                                            <td style="text-align:left"><input name="password" id="userPwdInput"
                                                                                               type="password" class="textinput" onblur="checkUserPwd()" />
                                                                <span id="userPwdMsg"></span>
                                                            </td>
                                                        </tr>
                                                        <tr height="15px"></tr>
                                                        <tr height="15px"></tr>
                                                        <tr>
                                                            <td colspan="2"
                                                                style="padding-top:10px; text-align:center">
                                                                <button class="submit1" onclick="return formCheck()">登录</button>
                                                            </td>
                                                        </tr>
                                                        <tr height="50px"></tr>
                                                    </table>
                                                    <table>
                                                        <tr>
                                                            <td style="text-align:left; padding-top:30px; width:60%">
                                                                <p>没有账号？</p>
                                                                <p style="text-align:left">
                                                                    <a href="${pageContext.request.contextPath }/user/register.jsp">
                                                                        <input type="button" class="submit2" name="submit" value="注册"/>
                                                                    </a>
                                                                </p>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
<script type="text/javascript">
    // 检验用户名格式是否合法的函数
    function checkUsername(){
        // 定义正则表示字符串的规则
        let  usernameReg=  /^[a-zA-Z_]\w{0,9}$/
        // 获得用户在页面上输入的信息
        let usernameInput =document.getElementById("usernameInput")
        let username = usernameInput.value
        // 获得格式提示的框
        let usernameMsg =document.getElementById("usernameMsg")
        // 格式有误时,返回false,在页面上提示
        if(!usernameReg.test(username)){
            usernameMsg.innerText="用户名格式有误"
            return false
        }
        // 格式OK,返回true 在页面上提示OK
        usernameMsg.innerText="OK"
        return true

    }

    // 检验密码格式是否合法的函数
    function checkUserPwd(){
        // 定义正则表示字符串的规则
        let  userPwdReg= /^.{4,15}$/
        // 获得用户在页面上输入的信息
        let userPwdInput =document.getElementById("userPwdInput")
        let userPwd = userPwdInput.value
        // 获得格式提示的框
        let userPwdMsg =document.getElementById("userPwdMsg")
        // 格式有误时,返回false,在页面上提示
        if(!userPwdReg.test(userPwd)){
            userPwdMsg.innerText="密码格式有误"
            return false
        }
        // 格式OK,返回true 在页面上提示OK
        userPwdMsg.innerText="OK"
        return true

    }

    // 表单在提交时,校验用户名和密码格式,格式OK才会提交
    function formCheck(){
        let flag1 =checkUsername()
        let flag2 =checkUserPwd()

        return flag1&&flag2
    }
</script>
</html>
