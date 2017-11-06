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
    <title>我要报名</title>
    <style>
        html,body{
            background-color: #fff;
        }
    </style>
</head>
<body ontouchstart>
<div class="sing">
    <form action="api/customerOperation/saveEnrollInfo.do" method="post">
    	<!-- 选择的培训工种名称 -->
    	<input type="hidden" name="train_category_name" id="train_category_name" value="${train_category_name }">
    	<!-- 类型，进入成功页面时使用 -->
    	<input type="hidden" name="type" value="bm">
    	
        <div class="sing_a">
            <label for="username">姓名:</label>
            <input type="text" placeholder="填写真实姓名" name="userName" id="userName"/>
        </div>
        
        <div class="sing_a">
            <label for="sex">姓别:</label>
            <div style="width: 80%;float: right;text-align: right">
                <select name="sex" id="sex" style="width: 100%;background-color: #F7F7F7;color: #757575;">
                    <option value="">选择性别</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>
        
        <div class="sing_a">
            <label for="identity">身份证号:</label>
            <input type="text" placeholder="填写您的身份证号码" name="ID_number" id="ID_number"/>
        </div>
        
        <div class="sing_a">
            <label for="company">公司名称:</label>
            <input type="text" placeholder="填写您所在公司名称" name="compayName" id="compayName"/>
        </div>
        
        <div class="sing_a">
            <label for="Identification">企业纳税人识别号:</label>
            <input type="text" placeholder="填写企业纳税人识别号码" name="tax_number" id="tax_number"/>
        </div>
        
        <div class="sing_a">
            <label for="phone">联系电话:</label>
            <input type="text" placeholder="填写联系电话" name="contact_number" id="contact_number"/>
        </div>
        
        <div class="sing_a">
            <label for="address">公司地址:</label>
            <input type="text" placeholder="填写您公司详细地址" name="company_detaile_address" id="company_detaile_address"/>
        </div>
        
        <input type="hidden" name="diploma_receive_method" id="diploma_receive_method" value="自提">
        <div class="sing_a">
            <label >证书领取方式:</label>
            <div class="zq">
                <span>自提</span>
                <i class="iconfont icon-dagou" ></i>
            </div>
            <div class="zq">
                <span>邮寄</span>
                <i class="iconfont icon-yuanquan"></i>
            </div>
        </div>
        
        <div class="instantly">立即报名</div>
    </form>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    
    //证书领取方式
    $(".zq i").click(function(){
        $(this).addClass("icon-dagou").removeClass("icon-yuanquan").parent().siblings(".zq").find("i").removeClass("icon-dagou").addClass("icon-yuanquan");
    	$("#diploma_receive_method").val($(this).parent().find("span").html());
    });
    
    //立即报名
    $(".instantly").click(function(){
    	if($("#userName").val() == ""){
    		layer.open({
    			content:'请填写姓名'
    			,skin:'msg'
    			,time:1.5
    		});
    		return;
    	}
    	
    	if($("#sex").val() == ""){
    		layer.open({
    			content:'请选择性别'
    			,skin:'msg'
    			,time:1.5
    		});
    		return;
    	}
    	
    	if($("#ID_number").val() == ""){
    		layer.open({
    			content:'请填写身份证号码'
    			,skin:'msg'
    			,time:1.5
    		});
    		return;
    	}
    	
    	if($("#compayName").val() == ""){
    		layer.open({
    			content:'请填写公司名称'
    			,skin:'msg'
    			,time:1.5
    		});
    		return;
    	}
    	
    	if($("#tax_number").val() == ""){
    		layer.open({
    			content:'请填写纳税人识别号'
    			,skin:'msg'
    			,time:1.5
    		});
    		return;
    	}
    	
    	if($("#contact_number").val() == ""){
    		layer.open({
    			content:'请填写联系电话'
    			,skin:'msg'
    			,time:1.5
    		});
    		return;
    	}
    	
    	if($("#company_detaile_address").val() == ""){
    		layer.open({
    			content:'请完善公司详细地址'
    			,skin:'msg'
    			,time:1.5
    		});
    		return;
    	}
    	
    	//判断是否已经报名
    	$.post('api/customerOperation/isExsitOfEnrollInfo.do'
    			,{ID_number:$("#ID_number").val(),train_category_name:$("#train_category_name").val()}
    			,function(data){
    				if(data.respCode=="01"){
    					document.forms[0].submit(); 
    				}else{
    					var obj=data.tempData;
    					var msg = "您于'"+obj.addTime+"'已成功报名'"+obj.train_category_name+"'培训,无需再次报名?";
    					layer.open({
    					    content: msg
    					    ,btn: ['重新报名', '退出']
    					    ,yes: function(index){
    					      //location.reload();
    					      //layer.close(index);
    					    	window.location.href="api/customerOperation/toEnrollOfSelectTrainCategory";
    					    }
    						,no: function(index){
    							window.location.href="api/customerOperation/serviceCenter";
    						}
    					});
    				}
    			}
    	);
        //window.location.href="success.html";
    });
</script>
</body>
</html>