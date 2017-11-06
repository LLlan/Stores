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
    <link rel="stylesheet" href="static/css/rq/jieguo.css"/>
    <script type="text/javascript" src="static/js/rq/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/rq/fastclick.js"></script>
    <script type="text/javascript" src="static/js/rq/jquery-weui.js"></script>
    <title>协会专家库</title>
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
<c:choose>
	<c:when test="${respCode=='01' }">
		<div class="contentDiv">
		    <div class="line">
		        <div class="left">姓名：</div>
		        <div class="right">${pd.userName }</div>
		    </div>
		    <div class="line">
		        <div class="left">性别：</div>
		        <div class="right">${pd.sex }</div>
		    </div>
		    <div class="line">
		        <div class="left">专家职称：</div>
		        <div class="right">${pd.position }</div>
		    </div>
		    <div class="line">
		        <div class="left">聘书编号：</div>
		        <div class="right">${pd.contract_number }</div>
		    </div>
		    <div class="line">
		        <div class="left">就职公司：</div>
		        <div class="right">${pd.Inauguration_company }</div>
		    </div>
		</div>
	</c:when>
	<c:otherwise>
		<div style="text-align: center;">
	    	<img style="width: 100px;margin-top: 50%;" src="static/images/rq/yihan.png">
	    	<p style="width: 250px;font-size: 15px;margin-top: 10px;margin-left: 15%;">
	    		很遗憾,没有找到姓名为<font style="color: #0284fe;">${userName }</font>的专家信息信息
	    	</p>
	    </div>
	</c:otherwise>
</c:choose>

<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>