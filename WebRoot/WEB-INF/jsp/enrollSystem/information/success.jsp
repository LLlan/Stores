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
    <link rel="stylesheet" href="static/css/rq/baoming.css"/>
    <script type="text/javascript" src="static/js/rq/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/rq/fastclick.js"></script>
    <title>${pd.type=="bm"?"报名":"提交" }成功</title>
    <style>
        html,body{
            background-color: #fff;
        }
        .success{
            width: 100%;
            overflow: hidden;
            padding: 0 3%;
            margin-top: 50px;
            text-align: center;
        }
        .success img{
            width: 80px;
            height: 80px;
            display: block;
            margin: 0 auto;
        }
        .success p{
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            margin-bottom: 40px;
        }
        .ok{
            width: 100%;
            height: 50px;
            line-height: 50px;
            text-align: center;
            color: #fff;
            border-radius: 5px;
            background-color: #5B8CC7;
        }
    </style>
</head>
<body ontouchstart>
<div class="success">
    <img src="static/images/rq/success_03.png" alt=""/>
    <p>
    	${pd.type=="bm"?"您已成功报名!":"您的咨询已成功提交,我们将尽快为您解答!" }
    </p>
    <div class="ok" onclick="window.location.href='api/customerOperation/serviceCenter.do'">确定</div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>