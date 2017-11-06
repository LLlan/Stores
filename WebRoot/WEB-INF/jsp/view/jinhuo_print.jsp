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
		<title>粮油管理系统</title>
		<link rel="stylesheet" href="resource/css/common.css" />
		<link rel="stylesheet" href="resource/css/manage.css" />
		<script type="text/javascript" src="resource/js/jquery-1.9.1.min.js"></script>
  </head>

	<body>
		<!--入库-->
		<div id="div_print" class="iframe_in">
			<!--入库验收单-->
			<form class="in_voucher">
			    <input type="hidden" id="id" name="id" value="${pd.CHANGESTORAGE_ID}">
				<h2>海口市粮食局甲子粮食储备库</h2>
				<div class="ml10 mt10">调入货品验收单</div>
				<div>
					<span>${pd.DKSJ}</span>
					<input type="text" style="width: 150px;" value="${pd.ODDNO}" />
				</div>
				<table class="tb_in">
					<tr>
						<td>来货单位</td>
						<td colspan="2">
							<input type="text" style="width: 150px;" value="${pd.LHDW}" />
						</td>
						<td colspan="2">来货凭证</td>
						<td colspan="3"><input type="text" value="${pd.ODDNO}" style="width: 97%;" /></td>
					</tr>
					<tr>
						<td>地址</td>
						<td colspan="2"><input type="text" value="${pd.ADDRESS}" style="width: 200px;" /></td>
						<td colspan="2">承运单位</td>
						<td><input type="text" value="${pd.CYDW}"/></td>
						<td>车船号</td>
						<td><input type="text" value="${pd.CCH}"/></td>
					</tr>
					<tr>
						<td>达到仓库时间</td>
						<td colspan="7"><input type="date" value="${pd.DKSJ}" style="position: relative;left: -35.7%;width: 200px;"></td>
					</tr>
					<tr>
						<td>货物名称</td>
						<td>包数</td>
						<td>来货数量</td>
						<td>包数</td>
						<td>实收数量</td>
						<td>单价</td>
						<td>金额</td>
						<td>备考</td>
					</tr>
					<tr>
						<td><input type="text" value="${pd.HWMC}"/></td>
						<td><input type="text" value="${pd.NUMBER}"/></td>
						<td><input type="text" value="${pd.NUMBER1}"/></td>
						<td><input type="text" value="${pd.NUMBER2}"/></td>
						<td><input type="text" value="${pd.SSNUMBER}"/></td>
						<td><input type="text" value="${pd.PRICE}"/></td>
						<td><input type="text" value="${pd.MONEY}"/></td>
						<td><input type="text" value="${pd.REMARKS}"/></td>
					</tr>
					<tr>
						<td>实收数合计(大写)</td>
						<td colspan="7"><input type="text" value="${pd.MONEYDX}" style="width: 99%;" /></td>
					</tr>
				</table>
			</form>
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