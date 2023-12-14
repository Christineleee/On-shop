<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    /**
     * my_click和my_blur均是用于前台页面搜索框的函数
     */
//鼠标点击搜索框时执行
    function my_click(obj, myid){
        //点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
        if (document.getElementById(myid).value == document.getElementById(myid).defaultValue){
            document.getElementById(myid).value = '';
            obj.style.color='#000';
        }
    }
    //鼠标不聚焦在搜索框时执行
    function my_blur(obj, myid){
        //鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
        if (document.getElementById(myid).value == ''){
            document.getElementById(myid).value = document.getElementById(myid).defaultValue;
            obj.style.color='#999';
        }
    }
    //退出确认框
    function confirm_logout() {
        let msg = "您确定要退出登录吗？";
        if (confirm(msg) == true) {
            return true;
        } else {
            return false;
        }
    }
    /**
     * 点击搜索按钮执行的函数
     */
    function search(){
        document.getElementById("searchform").submit();
    }
</script>
<header>
    <div class="header">
        <div class="container">
    <div class="logo"><a href="#">线上商城</a></div>
            <ul class="head_left">
                <li class="head-nav-home"><a href="${pageContext.request.contextPath}/showGoodsServlet">首页</a></li>
            </ul>
        </div>
        <div>
            <div class="search">
                <form action="${pageContext.request.contextPath }/searchServlet" id="searchform">
                    <table>
                        <tr>
                            <td>
                                <input type="text" name="textfield" class="inputtable" id="textfield" value="Search"
                                       onmouseover="this.focus();"
                                       onclick="my_click(this, 'textfield');"
                                       onBlur="my_blur(this, 'textfield');" />
                            </td>
                            <td>
                                <button class="search" onclick="search()">Go</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <%
                if(session.getAttribute("user")==null||session.getAttribute("user")==""||(boolean) session.getAttribute("isLogin")==false){

            %>
                <ul class="head_right">
                    <li class="head-compose"><a href="${pageContext.request.contextPath}/user/register.jsp" id="registerLink">新会员注册</a></li>
                    <li class="head-compose"><a href="${pageContext.request.contextPath}/user/login.jsp" id="loginLink">登录</a></li>
                </ul>
            <% }else{
            %>
            <ul class="head_right">
                <li class="head-compose"><a href="#">${sessionScope.user.username}</a></li>
                <li class="head-compose"><a href="${pageContext.request.contextPath}/user/cart.jsp">购物车</a></li>
                <li class="head-compose"><a href="${pageContext.request.contextPath}/findOrderServlet?methods=user">个人中心</a></li>
            </ul>
            <% }
            %>
        </div>
    </div>
</header>