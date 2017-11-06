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
    <link rel="stylesheet" href="static/css/rq/xinwenZixun.css"/>
    <script type="text/javascript" src="static/js/rq/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/rq/fastclick.js"></script>
    <script type="text/javascript" src="static/js/rq/jquery-weui.js"></script>
    <title>服务中心</title>
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
            background-color:#f7f7f7;
        }
        .bottomDiv li{  
        	width: 25%;
		    height: 90px;
		    margin-top: 10%;
		    float: left;
		    text-align: center;
        }
        .bottomDiv li a{
        	display: inline-block;   
        }
         .bottomDiv li a img{
          margin-bottom: 10px;
	      width: 55px;
	      height: 55px;
         }
    </style>
</head>
<body ontouchstart>
<div class="contentDiv">
    <div class="bannerDiv">
        <c:choose>
           	<c:when test="${not empty mainImgList && mainImgList.size() > 0 }">
           		<img src="<%=basePath%>${mainImgList[0].img_path }"/>
           	</c:when>
           	<c:otherwise>
           		<img src="static/images/rq/nm.jpeg"/>
           	</c:otherwise>
        </c:choose>
    </div>
    <div class="middleDiv">
        <span></span><span>工种培训</span><span></span>
    </div>
    <ul class="bottomDiv">
    	<c:forEach items="${list }" var="va">
    		<li onclick="window.location.href='api/customerOperation/toEnrollOfWriteEnrollInfo.do?train_category_name=${va.train_category_name}'">
	            <a href="javascript:void(0)">
	            	<img src="${va.icon_path }">
	            	<p>${va.train_category_name }</p>
	            </a>
	        </li>
    	</c:forEach>
    	<!--  
        <li>
            <a href="javascript:void(0)">
            	<img src="static/images/rq/1234.png">
            	<p>液化石油气</p>
            </a>
        </li>
        --> 
    </div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
        $(".bottomDiv").height($(window).height()-273);
//        $(".bannerDiv").height($(window).height()-$(".bottomDiv").height()-53);
    });
</script>
</body>
</html>