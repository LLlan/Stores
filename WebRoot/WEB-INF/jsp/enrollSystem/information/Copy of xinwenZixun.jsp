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
    <title>新闻资讯</title>
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
    </style>
</head>
<body ontouchstart>
    <div class="contentDiv">
        <div class="bannerDiv">
            <img src="static/images/rq/nm.jpeg" alt=""/>
        </div>
        <div class="middleDiv">
            <span></span><span>服务功能</span><span></span>
        </div>
        <div class="bottomDiv">
            <div>
                <a href="zhengce.html"><i class="iconfont icon-zhengcefagui"></i></a>
                <p>政策法规</p>
            </div>
            <div style="width:34%;">
                <a href="zhengce.html" style="background-color:#fe8937;"><i class="iconfont icon-guifan"></i></a>
                <p>行业规范</p>
            </div>
            <div>
                <a href="zhengce.html" style="background-color:#ef405a;"><i class="iconfont icon-zixun"></i></a>
                <p>行业资讯</p>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            FastClick.attach(document.body);
            $(".bottomDiv").height($(window).height()*0.38);
            $(".bannerDiv").height($(window).height()-$(".bottomDiv").height()-53);
        });
    </script>
</body>
</html>