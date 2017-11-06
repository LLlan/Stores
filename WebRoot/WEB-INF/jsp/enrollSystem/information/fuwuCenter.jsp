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
    <link rel="stylesheet" href="static/css/rq/xinwenZixun.css"/>
    <script type="text/javascript" src="static/js/rq/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/rq/fastclick.js"></script>
    <script type="text/javascript" src="static/js/rq/jquery-weui.js"></script>
    <title>服务中心</title>
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
            background-color:#f7f7f7;
        }
    </style>
</head>
<body ontouchstart>
    <div class="contentDiv">
        <div class="bannerDiv">
            <c:choose>
            	<c:when test="${not empty mainImgList && mainImgList.size() > 0 }">
            		<img src="<%=basePath%>${mainImgList[0].img_path }"/>
            	</c:when>
            	<c:otherwise>
            		<img src="static/images/rq/nm.jpeg"/>
            	</c:otherwise>
            </c:choose>
        </div>
        <div class="middleDiv">
            <span></span><span>服务功能</span><span></span>
        </div>
        <div class="bottomDiv">
            <div>
                <a href="api/customerOperation/toSearch.do?type=cj" style="background-color:#53c788;"><i class="iconfont icon-chaxun"></i></a>
                <p>成绩查询</p>
            </div>
            <div style="width:34%;">
                <a href="api/customerOperation/toSearch.do?type=zs" style="background-color:#fe8937;"><i class="iconfont icon-certificate"></i></a>
                <p>证书查询</p>
            </div>
            <div>
                <a href="api/customerOperation/toEnrollOfSelectTrainCategory.do" style="background-color:#238bfe;"><i class="iconfont icon-baoming"></i></a>
                <p>我要报名</p>
            </div>
            <div style="margin-top: 10%;">
                <a href="api/customerOperation/toConsultService.do" style="background-color:#FED324;"><i class="iconfont icon-zixun1"></i></a>
                <p>咨询服务</p>
            </div>
            <div style="margin-top: 10%;">
                <a href="api/customerOperation/toSearchExpertLibrary.do" style="background-color:#44CBBA;"><i class="iconfont icon-zhuanjiaguwen"></i></a>
                <p>专家库</p>
            </div>
            <div style="margin-top: 10%;">
                <a href="api/customerOperation/contact.do" style="background-color:#B26AD6;"><i class="iconfont icon-lianxi"></i></a>
                <p>联系方式</p>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            FastClick.attach(document.body);
            $(".bottomDiv").height($(window).height()-273);

        });
    </script>
</body>
</html>