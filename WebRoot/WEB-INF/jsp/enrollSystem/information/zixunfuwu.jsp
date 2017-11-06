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
    <script src="static/layer/mobile/layer.js"></script>
    <title>咨询服务</title>
    <style>
        html,body{
            background-color: #fff;
        }
        textarea {
		    resize: none;
		    width: 100%;
		    padding: 10px;
		    height: 150px;
		    margin: 10px 0;
		    border: 1px solid #ddd;
		    background-color: #F7F7F7;
		}
    </style>
</head>
<body ontouchstart>
<div class="sing">
    <form action="api/customerOperation/saveConsultService.do" method="post">
    	<!-- 类型，进入成功页面时使用 -->
    	<input type="hidden" name="type" value="zx">
    
        <textarea name="content" id="content" placeholder="填写您所需协会服务的内容"></textarea>
        <div class="sing_a">
            <label for="username">姓名:</label>
            <input type="text" placeholder="填写联系人姓名" name="consult_person_name" id="consult_person_name"/>
        </div>
        <div class="sing_a">
            <label for="phone">联系电话:</label>
            <input type="number" placeholder="填写联系人电话" name="contact_number" id="contact_number"/>
        </div>
        <div class="instantly">提交</div>
    </form>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    
    //提交信息
    $(".instantly").click(function(){
    	if($("#content").val() == ""){
    		layer.open({
    			content:'请填写咨询内容'
    			,skin:'msg'
    			,time:2
    		});
    		return;
    	}
    	
    	if($("#consult_person_name").val() == ""){
    		layer.open({
    			content:'请填写姓名'
    			,skin:'msg'
    			,time:2
    		});
    		return;
    	}
    	
    	if($("#contact_number").val() == ""){
    		layer.open({
    			content:'请填写联系电话'
    			,skin:'msg'
    			,time:2
    		});
    		return;
    	}
    	
    	document.forms[0].submit(); 
    });
</script>
</body>
</html>