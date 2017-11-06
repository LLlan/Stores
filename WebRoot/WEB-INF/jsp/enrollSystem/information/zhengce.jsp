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
    <link rel="stylesheet" href="static/css/rq/iconfont.css"/>
    <link rel="stylesheet" href="static/css/rq/yahu.css"/>
    <link rel="stylesheet" href="static/css/rq/zhengce.css"/>
    <script type="text/javascript" src="static/js/rq/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/rq/fastclick.js"></script>
    <script type="text/javascript" src="static/js/rq/jquery-weui.js"></script>
    <title>政策法规</title>
    <style>
        a{
            cursor:none;
        }
        .mask{
            background-color:rgba(0,0,0,0.3);
            display:none;
        }
        ::-webkit-scrollbar{width:0px;height:0px;}
        .weui-tabbar{
            z-index: 630;
        }
        body{
            background-color:#fff;
        }
    </style>
</head>
<body ontouchstart>
<div class="contentDiv">
	<c:forEach items="${newsList }" var="va">
		<a href="api/customerOperation/newsDetailes.do?news_detailes_id=${va.news_detailes_id }" class="content">
	        <div class="left">》</div>
	        <div class="center">
	            <p>${va.title }</p>
	            <p>${va.publish_time }</p>
	        </div>
	        <div class="right">
	            <i class="iconfont icon-xiangyou"></i>
	        </div>
	    </a>
	</c:forEach>
	<!--  
    <a href="xiangqing.html" class="content">
        <div class="left">》</div>
        <div class="center">
            <p>城镇燃气管理条例</p>
            <p>2.15-05-13</p>
        </div>
        <div class="right">
            <i class="iconfont icon-xiangyou"></i>
        </div>
    </a>
    -->
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>