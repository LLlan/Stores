<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="stylesheet" href="static/css/rq/iconfont.css"/>
    <link rel="stylesheet" href="static/css/rq/yahu.css"/>
    <link rel="stylesheet" href="static/css/rq/jquery-weui.css"/>
    <link rel="stylesheet" href="static/css/rq/weui.css"/>
    <link rel="stylesheet" href="static/css/rq/commen.css"/>
    <script type="text/javascript" src="static/js/rq/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/rq/fastclick.js"></script>
    <title>联系方式</title>
    <style>
        html,body{
            background-color: #fff;
        }
        .contact{
            width: 100%;
            overflow: hidden;
            margin-top: 20px;
            text-align: center;
            padding: 0px 25px;
        }
        .phone,.address{
            color: #000;
        }
        .address{
            margin-top: 20px;
        }
    </style>
</head>
<body ontouchstart>
<div class="contact">
	<c:forEach items="${list }" var="va">
		<p class="address">${va.title }：</p>
    	<p class="address1">${va.content }</p>
	</c:forEach>
    <!--  
    <p class="phone">联系电话：</p>
    <p class="phone1">0898-1234567</p>
    <p class="address">办公地址：</p>
    <p class="address1">海口市龙华区金沙路北京大厦5楼4323室</p>
    -->
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>