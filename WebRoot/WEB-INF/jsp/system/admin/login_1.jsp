<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title>登录</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="static/login/login.css" />
		<link rel="stylesheet" href="static/login/common.css" />
		<!-- <link rel="stylesheet" href="static/login/css/camera.css" /> -->
	<!-- 	<link rel="stylesheet" href="static/login/bootstrap.min.css" />
		<link rel="stylesheet" href="static/login/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="static/login/font-awesome.css"/> -->
		<script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>
	</head>

	<body>
		<div class="container-box">
			<div class="g-container">
				<div class="g-login-box">
					<div class="login-logo"></div>
					<div class="g-login-img"></div>
					<div class="login-box">
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
									            <input class="username" type="text" name="loginname" id="loginname" value="" placeholder="请输入用户名" />
											</div>
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<div class="main_input_box">
												<input class="password" type="password" name="password" id="password" placeholder="请输入密码" value="" />
											</div>
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<div class="main_input_box">
												<input class="verify_input"  name="code" id="code"  type="text" placeholder="验证码" value=""/>
												<img class="capthaCode" id="codeImg" alt="点击更换" title="点击更换" src="" />
											</div>
										</div>
									</div>
									
									<!-- 	<input name="form-field-checkbox" class="savePwd"  id="saveid" type="checkbox"
											onclick="savePaw();" style="padding-top:0px;" />
											<span style="font-size: 12px;">记住密码</span> -->
									
									<div class="control-group">
										<div class="controls">
											<div class="main_input_box">
												<input class="submit_btn" onclick="severCheck();" type="button"  value="登录" id="to-recover" />
												<a href="#" class="toForgetPwd">忘记密码?</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- loginbox end -->
						</form>
					</div>
				</div>
			</div>
		</div>
	<!-- <script src="static/js/bootstrap.min.js"></script> -->
	<script src="static/js/jquery-1.7.2.js"></script>
	<!-- <script src="static/login/js/jquery.easing.1.3.js"></script> -->
	<!-- <script src="static/login/js/jquery.mobile.customized.min.js"></script> -->
	<!-- <script src="static/login/js/camera.min.js"></script> -->
	<script src="static/js/jquery.tips.js" type="text/javascript"></script>
	<script src="static/js/jquery.cookie.js" type="text/javascript"></script>
	<script type="text/javascript">
	
		//服务器校验
		function severCheck(){
			if(check()){
				var loginname = $("#loginname").val();
				var password = $("#password").val();
				var code =loginname+",fh,"+password+",fh,"+$("#code").val();
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
	
		$(document).ready(function() {
			//setLoginBoxPosition();
			changeCode();
			$("#codeImg").bind("click", changeCode);
			 $(window).resize(function(){
                //setLoginBoxPosition();
            });
            if ( navigator . userAgent . toLowerCase (). indexOf ( "chrome" ) >= 0 ) {
				$ ( window ). load ( function (){
					$ ( '.main_input_box input:not(input[type=submit])' ). each ( function (){
					var outHtml = this . outerHTML ;
					$ ( this ). append ( outHtml );
					});
				});
			}
			
		});
		//设置登录框div的高宽
		/*  function setLoginBoxPosition() {
		   var height;
		   var width;
		   height = ($(window).height() - 120) / 2;
		   alert(height)
		  
		   $(".loginform").css("top", height);
		   width = ($(window).width() - 340) / 2;
		    alert(width)
           $(".loginform").css("left", width);
	   } */

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#loginname").val() == "") {

				$("#loginname").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#loginname").focus();
				return false;
			} else {
				$("#loginname").val(jQuery.trim($('#loginname').val()));
			}

			if ($("#password").val() == "") {

				$("#password").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});

				$("#password").focus();
				return false;
			}
			if ($("#code").val() == "") {

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
		function savePaw() {
			if (!$("#saveid").attr("checked")) {
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
		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('loginname', $("#loginname").val(), {
					expires : 7
				});
				$.cookie('password', $("#password").val(), {
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
</body>
</html>