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
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<!--查看图片插件 -->
		<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="static/js/ace-elements.min.js"></script>
		<script type="text/javascript" src="static/js/ace.min.js"></script>
		<!-- 确认窗口 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script>
		
		<!-- 引入 -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='static/assets/js/jquery.js'>"+"<"+"/script>");
		</script>
		<script src="static/js/bootstrap.min.js"></script>
		<!-- ace scripts -->
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
	</head>
<body>
	<form action="api/expertLibrary/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="expert_library_id" value="${pd.expert_library_id}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td>专家名称:</td>
				<td>
					<input type="text" name="userName" id="userName" value="${pd.userName }" placeholder="请输入。。。"/>
				</td>
			</tr>
			<tr>
				<td>性别:</td>
				<td>
					<select name="sex">
						<option value="男" <c:if test="${pd.sex=='男' }">selected="selected"</c:if>>男</option>
						<option value="女" <c:if test="${pd.sex=='女' }">selected="selected"</c:if>>女</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>专家职称:</td>
				<td>
					<select name="position">
						<c:forEach items="${list }" var="va">
							<option value="${va.position }" <c:if test="${pd.position==va.position }">selected="selected"</c:if>>${va.position }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>聘书编号:</td>
				<td>
					<input type="text" name="contract_number" id="contract_number" value="${pd.contract_number }" placeholder="请输入。。。"/>
				</td>
			</tr>
			<tr>
				<td>就职公司:</td>
				<td>
					<input type="text" name="Inauguration_company" id="Inauguration_company" value="${pd.Inauguration_company }" placeholder="请输入。。。"/>
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
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
	</form>
	
	<!-- 温馨提示部分 -->
	<!--<div style="padding-left: 10px;color: red;font-size: 1px;">
		<p>温馨提示:</p>
		<p style="margin-bottom: 5px;">1.上传图标格式:gif、png、jpg、jpeg</p>
		<p>2.尺寸：50*50px</p>
	</div>-->
<script type="text/javascript">
	$(top.hangge());
	$(function() {
		//上传
		$('#tp').ace_file_input({
			no_file:'请选择图片 ...',
			btn_choose:'选择',
			btn_change:'更改',
			droppable:false,
			onchange:null,
			thumbnail:false, //| true | large
			whitelist:'gif|png|jpg|jpeg',
			//blacklist:'gif|png|jpg|jpeg'
			//onchange:''
			//
		});
		
	});
</script>
<script type="text/javascript">
	//保存
	function save(){
		if($("#userName").val()==''){
			$("#userName").tips({
				side:3,
	            msg:'请输入内容',
	            bg:'#AE81FF',
	            time:3
	        });
			return;
		}
		if($("#contract_number").val()==''){
			$("#contract_number").tips({
				side:3,
	            msg:'请输入内容',
	            bg:'#AE81FF',
	            time:3
	        });
			return;
		}
		if($("#Inauguration_company").val()==''){
			$("#Inauguration_company").tips({
				side:3,
	            msg:'请输入内容',
	            bg:'#AE81FF',
	            time:3
	        });
			return;
		}
		if($("#userName").val()!="${pd.userName}" || ""=="${pd.userName}"){
			$.post('api/expertLibrary/getDateByName.do',{userName:$("#userName").val()},function(data){
				if(data.respCode=='01'){
					$("#Form").submit();
				}else{
					$("#userName").tips({
						side:3,
			            msg:'该专家已存在',
			            bg:'#AE81FF',
			            time:3
			        });
				}
			});
		}else{
			$("#Form").submit();
		}
		
		/*if(typeof($("#tpz").val()) == "undefined"){
			if($("#tp").val()=="" || document.getElementById("tp").files[0] =='请选择图片'){
				$("#tp").tips({
					side:3,
		            msg:'请选图片',
		            bg:'#AE81FF',
		            time:3
		        });
				return false;
			}
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();*/
	}
	
	//过滤类型
	function fileType(obj){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
	    	$("#tp").tips({
				side:3,
	            msg:'请上传图片格式的文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#tp").val('');
	    	document.getElementById("tp").files[0] = '请选择图片';
	    }
	}
	
	//删除图片
	function delP(icon_path,train_category_id){
		 if(confirm("确定要删除图片？")){
			var url = "<%=basePath%>api/trainCategory/deleteImgPath.do?icon_path="+icon_path+"&train_category_id="+train_category_id;
			$.get(url,function(data){
				if(data=="success"){
					alert("删除成功!");
					document.location.reload();
				}
			});
		} 
	}
</script>
</body>
</html>