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
    <title>查询结果</title>
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
            background-color:#f2ebeb;
        }
        .contentDiv {
		    width: 100%;
		    padding: 0 5%;
		    padding-top: 15px;
		    background-color: #fff;
		    margin-bottom: 10px;
		}
    </style>
</head>
<body ontouchstart>
	<c:if test="${list.size()>0 }">
		<c:forEach items="${list }" var="va">
			<div class="contentDiv">
			    <div class="line">
			        <div class="left">姓名：</div>
			        <div class="right">${va.userName }</div>
			    </div>
			    <div class="line">
			        <div class="left">性别：</div>
			        <div class="right">${va.sex }</div>
			    </div>
			    <div class="line">
			        <div class="left">培训工种：</div>
			        <div class="right">${va.train_category_name }</div>
			    </div>
			    <c:choose>
			    	<c:when test="${pd.type=='cj' }">
			    		<c:if test="${va.cjList.size()>0 }">
					    	<c:forEach items="${va.cjList }" var="vac">
						    	<div class="line">
							        <div class="left">${vac.subject }：</div>
							        <div class="right">${vac.score }分</div>
							    </div>
						    </c:forEach>
					    </c:if>
					    <c:if test="${va.cjList.size()==0 }">
					    	<div class="line">
						        <div class="left"></div>
						        <div class="right">暂无成绩信息</div>
						    </div>
					    </c:if>
			    	</c:when>
			    	<c:otherwise>
			    		<div class="line">
					        <div class="left">证书编号：</div>
					        <div class="right">${va.diploma_number==""?"暂无信息":va.diploma_number }</div>
					    </div>
			    	</c:otherwise>
			    </c:choose>
			    
			    <div class="line">
			        <div class="left">公司名称：</div>
			        <div class="right">${va.compayName }</div>
			    </div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${list.size()==0 }">
	    <div style="text-align: center;">
	    	<img style="width: 100px;margin-top: 50%;" src="static/images/rq/yihan.png">
	    	<p style="width: 250px;font-size: 15px;margin-top: 10px;margin-left: 15%;">
	    		很遗憾,没有找到身份证号为<font style="color: #0284fe;">${pd.ID_number }</font>的信息
	    	</p>
	    </div>
	</c:if>
	<!--  
		<div class="contentDiv">
		    <div class="line">
		        <div class="left">姓名：</div>
		        <div class="right">李雄</div>
		    </div>
		    <div class="line">
		        <div class="left">性别：</div>
		        <div class="right">男</div>
		    </div>
		    <div class="line">
		        <div class="left">培训工种：</div>
		        <div class="right">燃气石油化工</div>
		    </div>
		    <div class="line">
		        <div class="left">理论成绩：</div>
		        <div class="right">85分</div>
		    </div>
		    <div class="line">
		        <div class="left">实操成绩：</div>
		        <div class="right">92分</div>
		    </div>
		    <div class="line">
		        <div class="left">公司名称：</div>
		        <div class="right">海南燃气有限公司</div>
		    </div>
		</div>
	-->
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>