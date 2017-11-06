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
			var alltotol = $("#alltotol").val();
			if(alltotol==0){
				alert("单价栏和件数栏都不能为空！")
				return false;
			}
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
	table tr td input{
		width: 110px;
	}
	.jbrSpan{
		float:right;
		right:100px;
		font-size: 14px;
		font-weight: bolder;
	}
	.jiahao{
		width:80px;
	    padding: 0 3px;
	    height: 25px;
	    line-height: 22px;
	    border-width: 2px;
	    font-size: 12px;
		background-image: url("static/images/jiahao3.png");
		background-repeat:no-repeat;
		background-position:center;
		border: 1px solid #abbac3;
   		border-radius: 0!important;
    	box-shadow: none!important;
   		background-color: #F9F9F9!important;
        display: inline-block;
        margin-top: 5px;
        cursor: pointer;
	}
	.jianhao{
		width:80px;
	    padding: 0 3px;
	    height: 25px;
	    line-height: 22px;
	    border-width: 2px;
	    font-size: 12px;
		background-image: url("static/images/jianhao2.png");
		background-repeat:no-repeat;
		background-position:center;
		border: 1px solid #abbac3;
   		border-radius: 0!important;
    	box-shadow: none!important;
   		background-color: #F9F9F9!important;
        display: inline-block;
        margin-top: 5px;
        cursor: pointer;
	}
</style>
	</head>
<body>
	<form action="xiaoshou/${msg }.do" id="residenceForm" method="post">
		<input type="hidden" name="sp_id" id="sp_id" value="${pd.sp_id}"/>
		<input type="hidden" id="count" value="2"/>
		<input type="hidden" id="tagid" value="0"/>
		<input type="hidden" id="alltotol" name="all_totol" value=""/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered" id="tab">
				<tr>
					<td colspan="2"> 顾客名称：
					<select class="chzn-select" name="gkmc_id" id="gkmc_id" data-placeholder="请选择客户" style="vertical-align:top;">
					            <option value=""></option>
					            <c:forEach items="${kehuList}" var="kehu">
						          <option value="${kehu.kehu_id }" <c:if test="${kehu.kehu_id  == pd.khmc_id }">selected</c:if>>${kehu.kehu_name }</option>
					            </c:forEach>
					 </select>
					
					</td>
					<td colspan="3">日期：<input style="width:330px;" name="xiaoshou_time" value="${pd.xiaoshou_time }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td>商品名称</td>
					<td>规格型号</td>
					<td>件数(公斤,包,桶等)</td>
					<td>单价(元)</td>
					<td>金额(元)</td>
				</tr>
				<c:forEach items="${resultList }" var="detail" varStatus="v_index">
				<tr id="secondTr">
					<td>
					<select class="chzn-select" name="spmc_id" id="spmc_id" data-placeholder="请选择商品" style="vertical-align:top;">
					            <option value=""></option>
					            <c:forEach items="${detail.goodsList}" var="good">
						          <option value="${good.goods_id }" <c:if test="${good.goods_id == detail.spmc_id }">selected==</c:if>>${good.goods_name }</option>
					            </c:forEach>
					 </select>
					</td>
					<td><input name="ggxh" value="${detail.ggxh }" placeholder="请输入规格型号"/></td>
					<td><input name="jianshu" value="${detail.jianshu }" id="jianshu" placeholder="请输入件数(数字)"/></td>
					<td><input name="danjia" value="${detail.danjia }" id="danjia" placeholder="请输入单价(数字)"/></td>
					<td>
					<input name="money" value="${detail.money }" id="money" placeholder="请输入金额"/>
					<input name="money_dx" type="hidden" id="money_dx"/>
					</td>
				</tr>
				</c:forEach>
				
				<tr>
					<td colspan="5" >
						备注：<input  style="width: 685px; height: 30px;" type="text" name="remark" value="${xiaoshou.remark}" placeholder="请输入备注（如已付款或未付款等）"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="5" >
						<div class="jbrSpan">
							<!-- <input type="button" class="btn btn-small btn-success" id="qiuhe" style="height: 30px; width: 55px;" title="点击计算总金额" value="求和"> -->
							<span id="totol">
							</span>
						</div>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center;" colspan="5">
						<a class="jiahao" title="添加"  onclick="appendTr();"></a>
						<a class="jianhao" title="退格" style="width: 60px;" id="delTr"></a>
					</td>
				</tr>
				
				<tr>
					<td style="text-align: center;" colspan="5">
						<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
				
				<tr>	
					<td colspan="5" >
						<input type="hidden" name="jbr" value="${pd.userName}"/>
						<div class="jbrSpan">经办人:<c:out value="${pd.userName}"></c:out></div>
					</td>
				</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
		
	</form>
		<!-- 引入 -->
		<!-- <script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script> -->
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script src="static/js/chosen.jquery.min.js" type="text/javascript"></script><!-- 下拉框 -->
		
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
		$("#delTr").hide();
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
		
		});
		
		
		//添加Tr
		function appendTr(){
			//count从2开始
			var count =$("#count").val();
		 	//var secondTr = document.getElementById('tab').rows [count];
		 	//var secondTr = document.getElementById('secondTr');
		 	var appendTr ='<tr><td>';
		 	appendTr +='<select name="spmc_id" id="spmc_id'+count+'" data-placeholder="请选择商品" style="vertical-align:top;">';
			appendTr +='<option value=""></option>';	 
			appendTr +='<c:forEach items="${goodsList}" var="good">';            
			appendTr +='<option value="${good.goods_id }" <c:if test="${good.goods_id == pd.spmc_id }">selected</c:if>>${good.goods_name }</option>';	            
			appendTr +=' </c:forEach></select></td>';		          
			appendTr +='<td><input name="ggxh" placeholder="请输入规格型号"/></td>';
			appendTr +='<td><input name="jianshu" id="jianshu'+count+'"  placeholder="请输入件数(数字)"/></td>';
			appendTr +='<td><input name="danjia" id="danjia'+count+'" placeholder="请输入单价(数字)"/></td>'	;
			appendTr +='<td><input name="money" id="money'+count+'"  placeholder="请输入金额"/>';
			appendTr +='<input name="money_dx" type="hidden" id="money_dx'+count+'"/></td></tr>';	           
			//$('#tableid tr:eq(0) td:eq(1)').html();
			
			//添加Tr
			$("#tab tr:eq("+count+")").after(appendTr);
			//给select添加样式
			$("#spmc_id"+count+"").addClass("chzn-select");
			count++;
			$("#count").val(count);
			if(count>2){
				$("#delTr").show();
			}
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			//重载，获取值，并让监听函数刷新监听
			refresh();
		}
		
		//$("body").on("click","#two",function(data){
		//   alert(data);
		//});
		/* $("input").on("keydown","#jianshu2",function(event){
   		 	alert(event.keyCode);
		}) */
		
		//重载
		function refresh(){
			$(document).ready(function(){
			 var count =$("#count").val();
			 count =count-1;
			 //使用js添加元素后，bind()函数失效，on函数失效，基于jquery版本
			 //货物件数监听事件，计算金额
			  $("#jianshu"+count).live("input propertychange",function(e){  
				  		var jianshu = $("#jianshu"+count).val();
			            var danjia = $("#danjia"+count).val();
		               if(jianshu!=''&&danjia!=''){
		                  $("#money"+count).val((jianshu*danjia).toFixed(2));
		                  $("#money_dx"+count).val(DX(jianshu*danjia));
		               }
		               qiuhe();
			               
				}); 
				//货物单价输入框监听事件，计算金额
				$("#danjia"+count).live("input propertychange", function(){
		               var jianshu = $("#jianshu"+count).val();
		               var danjia = $("#danjia"+count).val();
		               if(jianshu!=''&&danjia!=''){
		                  $("#money"+count).val((jianshu*danjia).toFixed(2));
		                  $("#money_dx"+count).val(DX(jianshu*danjia));
		               }
		               qiuhe();
		        }); 
			})
		}
		
		  //件数监听
			$("#jianshu").bind("input propertychange", function(){
	               var jianshu = $("#jianshu").val();
	               var danjia = $("#danjia").val();
	               if(jianshu!=''&&danjia!=''){
	                  $("#money").val((jianshu*danjia).toFixed(2));
	                  $("#money_dx").val(DX(jianshu*danjia));
	               }
	               //不是数字
	              /*  if(isNaN(jianshu)){
	               	alert(22344)
	               } */
	               qiuhe();
	             
	        }); 
	        
			//货物单价输入框监听事件，计算金额
			$("#danjia").bind("input propertychange", function(){
	               var jianshu = $("#jianshu").val();
	               var danjia = $("#danjia").val();
	               if(jianshu!=''&&danjia!=''){
	                  $("#money").val((jianshu*danjia).toFixed(2));
	                  $("#money_dx").val(DX(jianshu*danjia));
	               }
	               qiuhe();
	        }); 
	        
	        
			/* 		
					$("#qiuhe").live("click",function(){
							 var count =$("#count").val();
							 //count =3
							 //第一行的moeny
							 var money = $("#money").val();
							 var moneys = 0 ;
							  for(var i=2;i<count;i++){
							  //最后的总和
							 	moneys = parseInt(moneys);
							 	var tmoneys = $("#money"+i).val();
							 	console.log(tmoneys)
							 	moneys = parseInt(moneys)+parseFloat(tmoneys);
							 } 
							 moneys += parseFloat(money);
							 alert(moneys)
							 document.getElementById("totol").innerHTML="合计：<span>"+moneys+"元</span>";
					});
					
			 */		
 
	 		//求合计数
	 		function qiuhe(){
			 		var count =$("#count").val();
					 //count =3
					 //第一行的moeny
					 var money = $("#money").val();
					 var moneys = 0 ;
					  for(var i=2;i<count;i++){
					  //最后的总和
					 	moneys = parseFloat(moneys);
					 	var tmoneys = $("#money"+i).val();
					 	moneys = moneys+parseFloat(tmoneys);
					 } 
					 //后面after的tr+第一个tr=总和
					 moneys += parseFloat(money);
					 //isNaN函数是判断不是数字
					 if(isNaN(moneys.toFixed(2))){
					 	console.log("不是数字");
					 	moneys =0;
					 }
					 document.getElementById("totol").innerHTML="合计：<span>"+moneys.toFixed(2)+"元</span>";
					 //将总和数添加到总和字段中
					 $("#alltotol").val(moneys.toFixed(2));
			}
		
			//退格，删除Tr
			$("#delTr").click(function(event){
				var count =$("#count").val();
				$("#tab tr:eq("+count+")").remove();
				count--;
				$("#count").val(count);
				//如果只剩一个tr,则隐藏删除按钮
				if(count==2){
					$("#delTr").hide();
				}
				//求和
				qiuhe();
			});
		  
	        
		//-------------------------------按count-------------------------------///
			
		
        //转换成大写
        function DX(n){
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