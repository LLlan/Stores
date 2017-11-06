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
		<title>xxxxxxx系统</title>
		<link rel="stylesheet" href="resource/css/common.css" />
		<link rel="stylesheet" href="resource/css/manage.css" />
		<script type="text/javascript" src="resource/js/jquery-1.9.1.min.js"></script>
		<style type="text/css">
			.jbrSpan{
				float:right;
				margin-right:0px;
				font-size: 12px;
			}
			.dright{
				float:left;
				margin-left:0px;
				font-size: 12px;
			}
			.gk_left{
				float:left;
				font-size: 12px;
			}
			.rq_right{
				float: right;
				font-size: 12px;
			}
			.sp{
				display: inline;
				margin-left:580px;
				
			}
			.centerTr td{
				font-size: 12px;
			}
		</style>
  </head>

	<body>
		<!--入库-->
		<div id="div_print" class="iframe_in">
			<table class="tb_in">
				 <div class="titleName"><h2>${merChantList[0].merchant_name}</h2></div>
				<div> 地址：${merChantList[0].address}</div>
				<div> 电话：${merChantList[0].phone}</div>
				<div>销售单</div>
				<tr>
					<td colspan="5"> 
					<div class="gk_left" >
					顾客名称：<c:out value="${xiaoshou.kehu_name }"></c:out>
					</div>
					<div class="rq_right" >
					日期：${xiaoshou.xiaoshou_time }
					</div>
					</td>
				</tr>
				<tr class="centerTr">
					<td>商品名称</td>
					<td>规格型号</td>
					<td>件数</td>
					<td>单价</td>
					<td>金额</td>
				</tr>
				<c:forEach items="${xiaoshouDetailList }" var="detail">
				<tr class="centerTr">
					<td>
						<c:out value="${detail.goods_name }"></c:out>
					</td>
					
					<td><c:out  value="${detail.ggxh }"></c:out></td>
					<td><c:out  value="${detail.jianshu }"></c:out></td>
					<td><c:out  value="${detail.danjia }"></c:out></td>
					<td><c:out  value="${detail.money }"></c:out></td>
				</tr>
				</c:forEach>
				
				<tr>
					<td colspan="5">
					<div>
					<div class="dright">备注：<c:out value="${xiaoshou.remark}"/></div>
					</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="5">
					<div class="dright">合计(大写)：${xiaoshou.all_totol_dx}</div>
					</td>
				</tr>
				
				<tr>
					<td colspan="5" >
						<div class="jbrSpan">
							合计：${xiaoshou.all_totol }
						</div>
					</td>
				</tr>
				<tr>	
					<td colspan="5" >
						<div class="jbrSpan">经办人:<c:out value="${xiaoshou.jbr}"></c:out></div>
					</td>
				</tr>
			
		</table>
		<span style="font-size: 12px;">发货人：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;">收货人：
		<c:forEach items="${bankList }" var="bank">
				<div>
				${bank.bank_name }：&nbsp;&nbsp;&nbsp;${bank.card_number } &nbsp;&nbsp;&nbsp;户名：${bank.card_huming }
				</div>
		</c:forEach>
		</div>
		<div class="btn_t"><input type="button" onClick="Print('div_print')" value="开始打印" /></div>
	</body>
	<script type="text/javascript">
		function Print(printpage) {
             var headstr = "<html><head><title></title></head><body>"; 
             var footstr = "</body>"; 
             var newstr = document.all.item(printpage).innerHTML; 
             var oldstr = document.body.innerHTML; 
             document.body.innerHTML = headstr+newstr+footstr; 
             window.print(); 
             document.body.innerHTML = oldstr; 
             return false; 
        } 
        function myPrint(obj){
          var id = document.getElementById('id').value;
          var newWindow=window.open("<%=basePath%>/changestorage/print.do?CHANGESTORAGE_ID="+id,"_blank");
          newWindow.print();
        }
    </script>
</html>