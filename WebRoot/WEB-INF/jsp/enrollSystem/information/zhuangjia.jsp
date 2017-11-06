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
    <link rel="stylesheet" href="static/css/rq/chengji.css"/>
    <script type="text/javascript" src="static/js/rq/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/rq/fastclick.js"></script>
    <script type="text/javascript" src="static/js/rq/jquery-weui.js"></script>
    <script src="static/layer/mobile/layer.js"></script>
    <title>证书查询</title>
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
    <input type="text" placeholder="输入专家姓名" id="userName"/>
    <a href="javascript:void(0)" onclick="searchInfo();">查询</a>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    
  	//查询
    function searchInfo(){
    	if($("#userName").val()==""){
    		layer.open({
    			content:'请输入专家姓名'
    			,skin:'msg'
    			,time:2
    		});
    		return;
    	}
    	window.location.href="api/customerOperation/resultExpertLibrary.do?userName="+$("#userName").val();
    }
</script>
</body>
</html>