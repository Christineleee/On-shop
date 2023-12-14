<%--
  Created by IntelliJ IDEA.
  User: 22057
  Date: 2023/12/2
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>商城首页</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/main.css" type="text/css" />
  <!-- 导入首页轮播图css和js脚本 -->
  <link type="text/css" href="${pageContext.request.contextPath }/user/css/autoplay.css" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/list.css" type="text/css" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/user/js/autoplay.js"></script>

</head>
<body class="main1">
<%@include file="head.jsp" %>
<!-- 首页轮播图  start -->
<div id="box_autoplay">
  <div class="list">
    <ul class="auto">
      <li class="auto1"><img src="${pageContext.request.contextPath }/user/ad/img1.png" width="900" height="340" /></li>
      <li class="auto1"><img src="${pageContext.request.contextPath }/user/ad/img2.png" width="900" height="340" /></li>
      <li class="auto1"><img src="${pageContext.request.contextPath }/user/ad/img3.png" width="900" height="340" /></li>
      <li class="auto1"><img src="${pageContext.request.contextPath }/user/ad/img4.png" width="900" height="340" /></li>
      <li class="auto1"><img src="${pageContext.request.contextPath }/user/ad/img5.png" width="900" height="340" /></li>
    </ul>
  </div>
</div>
<!-- 首页轮播图  end -->



<div>
  <table>
    <tr>
      <td>
        <div id="divpagecontent1">
          <ul>
            <!-- <li><img src="images/registerSuccess.jpg" width="200" height="100" /></li> -->
            <li><a class="active" href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品分类</a></li>
            <li><a href="${pageContext.request.contextPath}/showGoodsServlet">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;全部商品</a></li>
            <li><a href="${pageContext.request.contextPath}/showGoodsServlet?methods=category&category=phone">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手&nbsp;&nbsp;机</a></li>
            <li><a href="${pageContext.request.contextPath}/showGoodsServlet?methods=category&category=food">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;食&nbsp;&nbsp;品</a></li>
            <li><a href="${pageContext.request.contextPath}/showGoodsServlet?methods=category&category=clothes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;服&nbsp;&nbsp;饰</a></li>
            <li><a href="${pageContext.request.contextPath}/showGoodsServlet?methods=category&category=daily">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日&nbsp;&nbsp;用</a></li>
          </ul>
        </div>
      </td>


      <td class="divpagecontent2">
        <div>
          <table border="0" cellspacing="0">
            <tr>
              <td>
                <table cellspacing="0" class="listcontent">
                  <tr>
                    <td>
                      <h2 align="center">欢迎来到线上商城！</h2>
                      <div style="margin-top:20px; margin-bottom:5px" class="list_0">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;商品列表</p>
                      </div>
                      <div class="test">
                        <ul class="test2">
                          <c:forEach items="${list}" var="goods">
                            <li class="test6">
                              <a class="test7" href="${pageContext.request.contextPath}/showDetailServlet?gid=${goods.gid}">
                                <img src="${pageContext.request.contextPath}/user/images/picture.png" width="100px" height="100px" class="test4">
                                <h3 class="test3">${goods.name}</h3>
                                <p class="test5">售价：￥${goods.price}</p>
                              </a>
                            </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      <td>
    </tr>
  </table>
</div>
</body>
</html>
