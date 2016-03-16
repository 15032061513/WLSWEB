<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-1.9.1.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/source/js/jquery-easyui-1.4.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/source/js/jquery-easyui-1.4.4/themes/icon.css">
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<title>WLS-首页</title>
<script type="text/javascript">
	$(function(){
		startRequest();
		//使菜单默认为关闭状态
		$("#ac").accordion('getSelected').panel('collapse'); 
	});
	
    $(document).ready(function () {
        setInterval("startRequest()", 1000);  
    });
    function startRequest() {  
    	console.log(new Date("yyyy-month-dd hh:mm:ss"));
    	/* 
    	myDate.getYear(); //获取当前年份(2位)
    	myDate.getFullYear(); //获取完整的年份(4位,1970-????)
    	myDate.getMonth(); //获取当前月份(0-11,0代表1月)
    	myDate.getDate(); //获取当前日(1-31)
    	myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
    	myDate.getTime(); //获取当前时间(从1970.1.1开始的毫秒数)
    	myDate.getHours(); //获取当前小时数(0-23)
    	myDate.getMinutes(); //获取当前分钟数(0-59)
    	myDate.getSeconds(); //获取当前秒数(0-59)
    	myDate.getMilliseconds(); //获取当前毫秒数(0-999)
    	myDate.toLocaleDateString(); //获取当前日期
    	var mytime=myDate.toLocaleTimeString(); //获取当前时间 
    	*/
        $('#divNowTime').html(	(new Date().getFullYear())+"年"+
				        		((new Date().getMonth()+1)<10?'0'+(new Date().getMonth()+1):(new Date().getMonth()+1))+"月"+
				        		(new Date().getDate())
        						+'日&nbsp;&nbsp;'+
        						((new Date().getHours())<10?'0'+(new Date().getHours()):(new Date().getHours()))+":"+
        						((new Date().getMinutes())<10?'0'+(new Date().getMinutes()):(new Date().getMinutes()))+":"+
        						((new Date().getSeconds())<10?'0'+(new Date().getSeconds()):(new Date().getSeconds()))
        						+'&nbsp;&nbsp;星期'+
        						(
   									(new Date().getDay())==1?'一':
	        						(new Date().getDay())==2?'二':
	        						(new Date().getDay())==3?'三':
	        						(new Date().getDay())==4?'四':
	        						(new Date().getDay())==5?'五':
	        						(new Date().getDay())==6?'六':'日'
	        					)
        );  
    }
    
	//动态添加tabs
    function addTab(icon,title, url){
		if(url == 1 || url == 2 || url ==3){
	    	url = 'testCon.do?method=table';//+ (url == 1?'table':url == 2?'table':'table');
		}
		if ($('#tabs').tabs('exists', title)){
    		$('#tabs').tabs('select', title);
    	} else {
    		$('#tabs').tabs('add',{
    			title:title,
    			iconCls:icon,
    			content:'<iframe scrolling="auto" frameborder="0" src="'+url+'" style="width:100%;height:99.4%;"></iframe>',
    			closable:true
    		});
    	}
    }
	
    function LogOut(){
    	window.location.href='userlogin.do?method=logout';
    }
</script>
<style>
body{
	margin:0px auto;font-family:微软雅黑;font-size:15px;
}
</style>

</head>
<body class="easyui-layout">

	<!-- ----------------- 头部 开始 ------------------->
	<div data-options="region:'north',border:false" style="height:50px;background:#B3DFDA;">
		<a style="float:right;margin-right:20px;margin-top:13px" href="#" onclick="LogOut();" class="easyui-linkbutton" data-options="">LogOut</a>
		<div id="divNowTime" style="float:right;margin-right:20px;margin-top:13px;line-height:25px"></div>
	</div>
	<!-- ----------------- 头部 结束 ------------------->
	
	<!-- ----------------- 菜单 开始 ------------------->
	<div data-options="region:'west',split:true,title:'菜单'," style="width:200px;overflow:auto;">
			<div id="ac" class="easyui-accordion" style="width:100%">
				<div title="About" data-options="iconCls:'icon-ok'">
					<div style="color:#0099FF;padding:10px;cursor:pointer" onclick="addTab('icon-save','table','1')">table</div>
					<div style="color:#0099FF;padding:10px;cursor:pointer" onclick="addTab('icon-wls','jeasyui','2')">easyui</div>
					<div style="color:#0099FF;padding:10px;cursor:pointer" onclick="addTab('icon-save','DataGrid','3')">DataGrid</div>
				</div>
				<div title="Help" data-options="iconCls:'icon-ok'" >
					<div style="color:#0099FF;padding:10px;cursor:pointer" onclick="addTab('icon-save','百度','http://www.baidu.com')">百度</div>
					<div style="color:#0099FF;padding:10px;cursor:pointer" onclick="addTab('icon-wls','EasyUI','http://www.zi-han.net/case/easyui/')">jQuery EasyUI</div>
					<div style="color:#0099FF;padding:10px;cursor:pointer" onclick="addTab('icon-save','w3school','http://www.w3school.com.cn/index.html')">w3school</div>
				</div>
			</div>
	</div>
	<!-- ----------------- 菜单 结束 ------------------->
	
	<!-- ----------------- tabs 开始 ------------------->
	<div data-options="region:'center'">
		<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,">
			<div title="Home" data-options="iconCls:'icon-save'" style="text-align:center;line-height:200px;font-size:45px">
				<em>这里是首页</em>
			</div>
		</div>
	</div>
	<!--  ----------------- tabs 结束 ------------------->
	
	<div data-options="region:'south',border:false" style="height:40px;background:#B3DFDA;text-align:center;line-height:40px">
		<strong>&copy; 2016-2018 &nbsp;&nbsp;如有不满，不吝斧正！<!-- 本网站最终解释权归帅哥所有 --></strong>
	</div>
</body>
</html>
