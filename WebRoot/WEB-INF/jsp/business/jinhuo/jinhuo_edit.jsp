<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/common/jsAddress.js"></script>  
		
<script type="text/javascript">
		$(top.hangge());
		$(document).ready(function(){
		});
	
		//保存
		function save(){
			$("#residenceForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
	
	
	
	//验证邮箱格式
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	
	//验证身份证号码格式
	function isIDCard(IDCard){
		return(new RegExp(/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/).test(IDCard));
	}; 	
	
	 //判断用户名是否存在
	 function hasU(){
		var USERNAME = $("#loginname").val();
		var url = "<%=basePath%>user/hasU.do?USERNAME="+USERNAME+"&tm="+new Date().getTime();
		$.get(url,function(data){
			if(data=="error"){
				$("#loginname").css("background-color","#D16E6C");
				setTimeout("$('#loginname').val('此用户名已存在!')",500);
			}else{
				$("#userForm").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
		});
	} 
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $("#EMAIL").val();
		var url = "<%=basePath%>user/hasE.do?EMAIL="+EMAIL+"&USERNAME="+USERNAME+"&tm="+new Date().getTime();
		$.get(url,function(data){
			if(data=="error"){
				
				$("#EMAIL").tips({
					side:3,
		            msg:'邮箱已存在',
		            bg:'#AE81FF',
		            time:3
		        });
				
				setTimeout("$('#EMAIL').val('')",2000);
				
			}
		});
	}
	
	//判断编码是否存在
	function hasN(USERNAME){
		var NUMBER = $("#NUMBER").val();
		var url = "<%=basePath%>user/hasN.do?NUMBER="+NUMBER+"&USERNAME="+USERNAME+"&tm="+new Date().getTime();
		$.get(url,function(data){
			if(data=="error"){
				
				$("#NUMBER").tips({
					side:3,
		            msg:'编号已存在',
		            bg:'#AE81FF',
		            time:3
		        });
				
				setTimeout("$('#NUMBER').val('')",2000);
				
			}
		});
	}
	
</script>
<style type="text/css">
.table tr td input{
		width: 400px;
	}
	
	table tr td select{
		width: 410px;
	}
</style>
	</head>
<body>
	<form action="jinhuo/${msg }.do" id="residenceForm" method="post">
		<input type="hidden" name="sp_id" id="sp_id" value="${pd.sp_id}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered">
			<tr>
				<td width="110px;">货物名称：</td>
				<td>
				 <select  class="chzn-select" name="spmc_id" id="spmc_id" data-placeholder="请选择商品" style="vertical-align:top;">
				            <option value=""></option>
				            <c:forEach items="${goodsList}" var="good">
					          <option value="${good.goods_id}" <c:if test="${good.goods_id eq pd.spmc_id }">selected</c:if>>${good.goods_name }</option>
				            </c:forEach>
				 </select>
				</td>
			</tr>
			
			<tr>
				<td>规格型号：</td>
				<td><input type="text" name="ggxh" id="ggxh" value="${pd.ggxh }" maxlength="32" class="inputClass" placeholder="请输入规格型号"/></td>
			</tr>
			
			<tr>
				<td>单位：</td>
				<td>
				     <input type="text" name="danwei" id="danwei" value="${pd.danwei }" maxlength="32" class="inputClass" placeholder="请输入商品计价单位（如公斤或千克Kg，升，桶，袋等）" title=""/>             
				</td>
			</tr>
			<tr>
				<td>数量：</td>
				<td>
				     <input type="text" name="shuliang" id="shuliang" value="${pd.shuliang }" maxlength="32" class="inputClass" placeholder="请输入数量（单位：公斤）" title=""/>             
				</td>
			</tr>
			
			<tr>
				<td>单价：</td>
				<td>
				     <input type="text" name="danjia" id="danjia" value="${pd.danjia }" maxlength="32" class="inputClass" placeholder="请输入单价" title=""/>             
				</td>
			</tr>
			
			
			<tr>
				<td>金额：</td>
				<td>
				     <input type="text" name="money" id="money" value="${pd.money }" maxlength="32" class="inputClass" placeholder="请输入金额" title=""/>             
				</td>
			</tr>
			<tr>
				<td>大写金额：</td>
				<td>
				     <input type="text" name="money_dx" id="money_dx" value="${pd.money_dx }" maxlength="32" class="inputClass" placeholder="请输入大写金额" title=""/>             
				</td>
			</tr>
			<tr>
				<td>备注：</td>
				<td>
				     <input type="text" name="remark" id="remark" value="${pd.remark }" maxlength="32" class="inputClass" placeholder="请输入备注（没有可不输）" title=""/>             
				</td>
			</tr>
			
			<tr>
				<td>进货时间：</td>
				<td>
				     <input type="text" readonly="readonly" name="jinhuo_time" id="jinhuo_time" value="${pd.jinhuo_time }" maxlength="32" class="inputClass" title=""/>             
				</td>
			</tr>
			
			<tr>
				<td>操作员：</td>
				<td>
				     <input type="text" readonly="readonly" name="caozuoyuan" id="caozuoyuan" value="${not empty pd.caozuoyuan?pd.caozuoyuan:pd.userName }" maxlength="32" class="inputClass"  title=""/>             
				</td>
			</tr>
			
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script src="static/js/chosen.jquery.min.js" type="text/javascript"></script><!-- 下拉框 -->
		
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
		});
		
		//货物单价输入框监听事件，计算金额
		$("#danjia").bind("input propertychange", function(){
               var shuliang = $("#shuliang").val();
               var danjia = $("#danjia").val();
               if(shuliang!=''&&danjia!=''){
                  $("#money").val((shuliang*danjia).toFixed(2));
                  $("#money_dx").val(DX(shuliang*danjia));
               }
        }); 
        
        //货物单价输入框监听事件，计算金额
		$("#shuliang").bind("input propertychange", function(){
               var shuliang = $("#shuliang").val();
               var danjia = $("#danjia").val();
               if(shuliang!=''&&danjia!=''){
                  $("#money").val((shuliang*danjia).toFixed(2));
                  $("#money_dx").val(DX((shuliang*danjia).toFixed(2)));
               }
        }); 
        
        //转换成大写
        function DX(n) {
             if (!/^(0|[1-9]\d*)(\.\d+)?$/.test(n))
                 return "数据非法";
             var unit = "千百拾亿千百拾万千百拾元角分", str = "";
                 n += "00";
             var p = n.indexOf('.');
             if (p >= 0)
                 n = n.substring(0, p) + n.substr(p+1, 2);
                 unit = unit.substr(unit.length - n.length);
             for (var i=0; i < n.length; i++)
                 str += '零壹贰叁肆伍陆柒捌玖'.charAt(n.charAt(i)) + unit.charAt(i);
             return str.replace(/零(千|百|拾|角)/g, "零").replace(/(零)+/g, "零").replace(/零(万|亿|元)/g, "$1").replace(/(亿)万|壹(拾)/g, "$1$2").replace(/^元零?|零分/g, "").replace(/元$/g, "元整");
        }
		</script>
</body>
</html>