<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<title><%-- ${pd.SYSNAME} --%></title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="static/login/bootstrap.min.css" />
<link rel="stylesheet" href="static/login/css/camera.css" />
<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="static/login/font-awesome.css"/>
<link rel="stylesheet" id="css" href="static/login/matrix-login2.css" type="text/css"/>


</head>
<body>
	<div class="waiceng">
		<form action="" method="post" name="loginForm" id="loginForm">
			<div id="loginbox" class="loginbox">
			<div class="login_form">
				<div class="control-group normal_text">
					<h3>
					   <%--   ${pd.SYSNAME}  --%>
						<!-- <img src="static/login/logo.png" alt="Logo" />-->
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg"><i><img height="37"
									src="static/login/images/user.png" /></i></span><input type="text"
								name="loginname" id="loginname" value=""
								placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly"><i><img height="37"
									src="static/login/images/pwd.png" /></i></span><input type="password"
								name="password" id="password" placeholder="请输入密码"
								value=""/>
						</div>
					</div>
				</div>
				<div style="float:right;padding-right:10%;">
					<div style="float: left;margin-top:3px;margin-right:2px;">
						<font color="black">记住密码</font>
					</div>
					<div style="float: left;">
						<input name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="savePaw();" style="padding-top:0px;" />
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">
						<div style="float: left;">
							<i><img width="23px" height="27px;" src="static/login/images/yanzm.png" /></i>
						</div>
						<div style="float: left;" class="codediv">
							<input type="text" name="code" id="code" class="login_code"
								style="height:16px; padding-top:0px;" />
						</div>
						<div style="float: left;">
							<i><img style="height:22px;" id="codeImg" alt="点击更换"
								title="点击更换" src="" /></i>
						</div>

						<span class="pull-right">
							<a onclick="severCheck();"class="btn-login" id="to-recover">
								登录</a>
						</span>             
					</div>
				</div>
			</div>
			</div><!-- loginbox end -->
			
		</div>
		</form>
		<div class="copyRight">
			<font color="white" size="2" style="font-family: STXinwei "><span id="nameerr">Copyright © ${pd.SYSNAME} 2017</span></font>
		</div>
		
	<!-- 登录页面背景图轮换 -->
	<!-- <div id="templatemo_banner_slide" class="container_wapper">
		   <div class="camera_wrap camera_emboss" id="camera_slide">
			<div data-src="static/login/images/login_slide01 .jpg"></div>
 			<div data-src="static/login/images/login_slide02.jpg"></div> 
			<div data-src="static/login/images/login_slide03.jpg"></div>
			<div data-src="static/login/images/login_slide04.jpg"></div>
		</div>
		#camera_wrap_3
	</div> -->
	<script type="text/javascript">
	
	 $(function () {
	  	//判断是否宽屏
            /* var winWide = window.screen.width;
            //var wideScreen = false;
            
            if (winWide == 1280) {
            //1600 =1280
                $("#css").attr("href", "static/login/matrix-login2.css");
            }else if(winWide==1536){
                $("#css").attr("href", "static/login/matrix-login.css");
               // wideScreen = true; //是宽屏
            }else if(winWide==1920){
            	$("#css").attr("href", "static/login/matrix-login3.css");
            } */
            
            
		  	  /*  setLoginBoxPosition();
               $(window).resize(function(){
                setLoginBoxPosition();
               });
         
			   function setLoginBoxPosition() {
			   alert($(window).height());
			   alert($(window).width())
				   var height;
				   var width;
				   height = ($(window).height() - 120) / 2;
				   $(".login_form").css("top", height);
				   width = ($(window).width() - 340) / 2;
		           $(".login_form").css("left", width);
			   }  */
	 
           
		})
	
		//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code = loginname+",fh,"+password+",fh,"+$("#code").val();
				$.ajax({
					type: "POST",
					url: 'login_login',
			    	data: {KEYDATA:code,tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="main/index";
						}else if("usererror" == data.result){
							$("#loginname").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
							
						}else if("codeerror" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							$("#code").focus();
							changeCode();
						}else{
							$("#loginname").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#loginname").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function(){
			//setLoginBoxPosition();
			changeCode();
			$("#codeImg").bind("click", changeCode);
			 $(window).resize(function(){
               // setLoginBoxPosition();
            });
			
		});
		//设置登录框div的高宽
		 function setLoginBoxPosition() {
		   var height;
		   var width;
		   height = ($(window).height() - 120) / 2;
		   alert(height)
		  
		   $(".loginForm").css("top", height);
		   width = ($(window).width() - 340) / 2;
		    alert(width)
           $(".loginForm").css("left", width);
	   }

		$(document).keyup(function(event){
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp(){
			var time = new Date();
			return time.getTime();
		}

		function changeCode(){
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check(){
			if ($("#loginname").val() == ""){
				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				return false;
			}else{
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}

			if ($("#password").val() == ""){
				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			if ($("#code").val() == ""){
				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				$("#code").focus();
				return false;
			}

			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}
	
		//记住密码
		function savePaw(){
			if (!$("#saveid").attr("checked")){
				$.cookie('loginname', '', {
					expires : -1
				});
				$.cookie('password', '', {
					expires : -1
				});
				$("#loginname").val('');
				$("#password").val('');
			}
		}

		//保存Cookie期限为7天
		function saveCookie(){
			if ($("#saveid").attr("checked")){
				$.cookie('loginname', $("#loginname").val(),{
					expires : 7
				});
				$.cookie('password', $("#password").val(),{
					expires : 7
				});
			}
		}
		
		function quxiao() {
			$("#loginname").val('');
			$("#password").val('');
		}
		
		jQuery(function() {
			var loginname = $.cookie('loginname');
			var password = $.cookie('password');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#loginname").val(loginname);
				$("#password").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/jquery-1.7.2.js"></script>
	<script src="static/login/js/jquery.easing.1.3.js"></script>
	<script src="static/login/js/jquery.mobile.customized.min.js"></script>
	<script src="static/login/js/camera.min.js"></script>
	<script src="static/login/js/templatemo_script.js"></script>
	<script src="static/js/jquery.tips.js" type="text/javascript"></script>
	<script src="static/js/jquery.cookie.js" type="text/javascript"></script>
	<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
</body>

</html>