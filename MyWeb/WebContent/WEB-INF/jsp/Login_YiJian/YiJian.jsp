<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/layer/layer.js"></script>
<title>登录页面改进建议</title>
<script type="text/javascript">

$(function(){
});
function aaa(){
	var a = setInterval("Second()", 5000);
	return '';
}
function close(){
	window.close();
}

function submit(){
	
/* 	layer.confirm('您的意见已提交,页面将在5s后关闭，点击‘关闭’即关闭。', {
	    btn: ['关闭']
	}, function(){
		layer.msg('立即关闭');
		window.close();
	}, function(){
		layer.msg('等待');
	}); */
	layer.alert('您的意见已提交,页面将在5s后关闭',{icon:1,title:'提示信息',skin:'layui-layer-lan'});
	//window.close();
}
</script>
<style type="text/css">
body{
	float:left;margin: 0px auto;width:100%;height:100%;font-size:14px
}
.body_div{
	float:left;border:0px;margin:0 15% 0 15%;width:70%;padding-bottom:40px
}
.div_re_title{
	float:left;line-height:35px;width:100%;background-color:#EEF6FF;font-weight:bold;
}
.div_re_text{
	line-height:130px;width:100%;
}
.div_re_text label{
	margin-left:20px
}
</style>
</head>
<body>
	<form action="">
		<div class="body_div">
			<div style="float:left;height:100px;width:100%;border-bottom:2px solid #D2D2D2"></div>
			<div style="float:left;height:200px;width:100%;border:2px solid #D2D2D2;margin-top:40px;">
				<div class="div_re_title">
					1.您对我们现在的登录页面满意度如何？
					<br/><span style="color:red">&nbsp;(记住，我是必选项的哦！)</span>
				</div>
				<div class="div_re_text">
					<label for="now_PingFen5"><input id="now_PingFen5" type="radio" name="now_PingFen" value="5">非常满意</label>
					<label for="now_PingFen4"><input id="now_PingFen4" type="radio" name="now_PingFen" value="4">满意</label>
					<label for="now_PingFen3"><input id="now_PingFen3" type="radio" name="now_PingFen" value="3">一般</label>
					<label for="now_PingFen2"><input id="now_PingFen2" type="radio" name="now_PingFen" value="2">不满意</label>
					<label for="now_PingFen1"><input id="now_PingFen1" type="radio" name="now_PingFen" value="1">非常不满意</label>
				</div>
			</div>
			<div style="float:left;height:200px;width:100%;border:2px solid #D2D2D2;margin-top:40px;">
				<div class="div_re_title">
					2.请在此留下您对我们登录页面的建议！例如：对我们页面的不满、功能的不满、存在的问题等
					<br/><span style="color:red">&nbsp;(记住，我是必选项的哦！)</span>
				</div>
				<div style="width:100%;height:130px;">
					<textarea style="resize:none;width:95%;margin-left:20px;margin-top:10px;height:100px"></textarea>
				</div>
			</div>
			<div style="float:left;height:200px;width:100%;border:2px solid #D2D2D2;margin-top:40px;">
				<div class="div_re_title">
					3.如果您有意参与我们的页面改进计划，请填写如下信息，方便我们与您联系，谢谢！！！（信息仅作为内部资料绝不外泄）
					<br/><span style="font-weight:normal;">&nbsp;如果您对我们的网站体验有任何想法，也欢迎加入我们的QQ交流群（120552275）来帮助我们的进一步改进。</span>
				</div>
				<div style="width:100%;height:130px;">
					<div style="line-height:45px;margin-left:20px;">姓名：<input type="text"></div>
					<div style="line-height:40px;margin-left:20px;">电话：<input type="number"></div>
					<div style="line-height:45px;margin-left:20px;">邮箱：<input type="email"></div>
				</div>
			</div>
			<div style="float:left;height:50px;width:100%;margin-top:20px;border:2px solid #EEF6FF;background-color:#EEF6FF;text-align:center;">
				<div onclick="submit()" style="float:right;margin-top:10px;line-height:30px;width:70px;background-color:#81B2D7;border-radius:10px;text-align:center;font-weight:bold;cursor:pointer;">提 交</div>
			</div>
		</div>
	</form>
</body>
</html>
