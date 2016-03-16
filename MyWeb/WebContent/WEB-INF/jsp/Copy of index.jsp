<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-1.9.1.min.js"></script>
<title>WLS-首页</title>
<script type="text/javascript">
    $(document).ready(function () {
        setInterval("startRequest()", 1000);  
    });
    $(document).ready(function () {
        setInterval("startRequest()");
    });
    function startRequest() {  
        $('#divNowTime').html((new Date()).toLocaleDateString()+"&nbsp;&nbsp;&nbsp;"+(new Date()).toLocaleTimeString());  
    }
    
    function logout(){
    	alert("您登录的用户将要被注销");
    	window.top.location.replace("/JWZWORK/userlogin.do?method=logout");
    }
</script>
<style>
body{
	margin:0px auto;font-family:微软雅黑;
}
.body_div{
	float:left;width:100%;
}
.body_top{
	float:left;width:100%;background-color:#2299EE;height:50px;line-height:50px;
	background-image:url("${pageContext.servletContext.contextPath }/source/images/index/bg_top_wls.png");
	background-size:100% 100%;border-bottom:2px solid #468DCD;
}
.body_center{
	float:left;width:80%;margin-left:10%;height:690px;background-color:#FFFFFF;
}
.body_foot{
	float:left;width:100%;height:40px;line-height:40px;
	text-align:center;font-size:13px;
	background-color:#F6F6F6;border-top:2px solid #468DCD;
}
</style>

</head>
<body >
<div class="body_div">
	<div class="body_top">
		<span id="divNowTime" style="float:right;" ></span> 
	</div>
	<div class="body_center">
	
	
	</div>
	<div class="body_foot">
		<strong>&copy; 2016-2018 &nbsp;&nbsp;本网站最终解释权归帅哥所有</strong>
		<!-- <a href="javascript:scroll(0,0)">返回顶部11111</a>|||
		<a href="#top" target="_self">返回顶部222</a> ||| -->
	</div>
</div>
</body>
</html>
