<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-1.9.1.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/test.js"></script> --%>
<title>WLS-登录</title>
</head>
<style>
body{
	font-family:微软雅黑
}
#login_foot span{
	cursor:pointer;
}
</style>
<script type="text/javascript">

$(function(){
	$('form input').click(function(){
		$('#errormessage').html('&nbsp;');
	});
	
	var error = $('#error').val();
	if(error == "code"){
		$('#errormessage').text("验证码输入错误");
	}else if(error == "1"){
		$('#errormessage').text("帐号和密码不匹配");
	}else if(error == "1"){
		$('#errormessage').text("帐号和密码不能为空");
	}
	$('input[type=reset]').click(function(){
		$('#errormessage').html('&nbsp;');
	});
	
	//记住我
	$('.remb_right').click(function(){
		$(this).css('background-color','#FFFFFF');
		$(this).prev().css('background-color','#FF9966');
		$('#remberme').val('0');
	});
	$('.remb_left').click(function(){
		$(this).css('background-color','#FFFFFF');
		$(this).next().css('background-color','#FF9966');
		$('#remberme').val('1');
	});
});

/* $(document).ready(function() { 
	setInterval("alltext('alltext','text')", 50);  
}); 
var i = 0;
function alltext(alltext,text) {
	var length = $('#'+alltext).val().length;
	var str = $('#'+alltext).val();
	if(i<length){
		$('#'+text).html($('#'+text).text()+str.charAt(i));
		i++;
	}else{
		$('#'+text).html("&nbsp;&nbsp;");
		i=0;
	}
} 
*/

$(function(){
	setbody();
	//setInterval('setbody();',0.1);//1000为1秒钟
	var text =   '<span>关于我们</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;'
				+'<span>网站条款</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;'
				+'<span onclick="login_yijian()">意见反馈</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;'
				+'<span onclick="To_OnlinMusic()">在线音乐</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;'
				+'<span onclick="To_test()">测试</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;'
				+'<span>在线帮助</span>';
	text += '<br/><strong>&copy; 2016-2018 &nbsp;&nbsp;如有不满，不吝斧正！<!-- 本网站最终解释权归帅哥所有 --> </strong>';
	$('#login_foot').html(text);
});

function login_yijian(){
	window.open('PublicCon.do?method=login_YiJian');		//意见反馈
}
function To_OnlinMusic(){
	window.open('MusicIndexCon.do?method=MusicIndex');		//在线音乐
}
function To_test(){
	window.open('MusicIndexCon.do?method=test');			//测试
}


function setbody(){
	var X = document.documentElement.clientWidth;
	var Y = document.documentElement.clientHeight;
	$('body').css('height',Y-10).css('width',X);
	$('#login_top').css('height',Y/6-15).css('width',X).css('background-color','#073364');
	$('#login_bottom').css('height',Y/6-15).css('width',X).css('background-color','#073364');
	$('#login_foot').css('height',50).css('width',X).css('background-color','#D3D3D3');
	$('#login_center').css('height',Y/6*4-20).css('width',X).css('background-color','#053975');
	$('#login_div_form').css('background-color','#4BB7D1').css('margin-left',500);
	var TB_X = document.getElementById('login_table').offsetWidth;
	var TB_Y = document.getElementById('login_table').offsetHeight;
	$('#login_div_form').css('height',TB_Y+25).css('width',TB_X+40).css('background-color','#CFDCEC').css('margin-left',(X-TB_X-40)/2).css('margin-top',(Y/6*4-TB_X-80)/2);
}

function submit(){
	var name = $('input[name=user_name]').val();
	var pass = $('input[name=user_passw]').val();
	var code = $('input[name=code]').val();
	var Err1 = '';
	if(name=="" || name ==null){
		Err1 += '用户名,';
	}
	if(pass=="" || pass ==null){
		Err1 += '密码,';
	} 
	if(code=="" || code ==null){
		Err1 += '验证码';
	}
	var Err2 = '不能为空';
	if(Err1+Err2 == '不能为空'){
		return true;
	}else{
		$('#errormessage').html(Err1+Err2);
		return false;
	}
};
</script>  
<body style="margin-top:0px;margin-left:0px">
	<input type="hidden" id="error" value="${error}">
	<div id="login_top"></div>
	<div id="login_center" >
		<div id="login_div_form" style="float:left;border-radius:35px;">
			<form action="userlogin.do?method=login" method="post" onsubmit="return submit();" >
				<input type="hidden" name="type" value="1">
				<div id="login_table" style="float:left;width:250px;margin:20px">
					<div id="errormessage" style="border:0px;background-color:inherit;color:red;line-height:30px;text-align:center;">&nbsp;</div>
					<div style="background-color:#3F7FA5;height:33px;border-radius:5px;text-align:center;margin-top:20px;border:0px;">
						<img style="float:left;width:12%;height:30px;" src="${pageContext.servletContext.contextPath }/source/images/login/username_wls.png">
						<input style="float:left;width:88%;height:30px;;background-color:inherit;border:0px;border-radius:5px;" type="text" name="user_name" value="${name}" placeholder="用户名" />
					</div>
					<div style="background-color:#3F7FA5;height:33px;border-radius:5px;text-align:center;margin-top:20px;border:0px;">
						<img style="float:left;width:12%;height:30px;" src="${pageContext.servletContext.contextPath }/source/images/login/password_wls.png">
						<input style="float:left;width:88%;height:30px;;background-color:inherit;border:0px;border-radius:5px;" type="password" name="user_passw" value="${pass}" placeholder="密码" />
					</div>
					<div style="height:33px;border-radius:5px;width:100%;text-align:center;margin-top:20px">
						<input style="float:left;width:60%;height:30px;background-color:#3F7FA5;border:0px;border-radius:5px;"  name="code" id="code" placeholder="验证码" />
						<img style="float:right;width:35%;height:30px;cursor:pointer;" id="imgObj" title="点我刷新" alt="验证码" onclick="this.src='userlogin.do?method=VerificationCode&&d='+Math.random();"  src="userlogin.do?method=VerificationCode"/>
					</div>
					<div style="height:33px;border-radius:5px;width:100%;text-align:center;margin-top:20px">
						<div style="border-radius:10px;width:50px;height:18px;background-color:#FF9966;float:left;">
							<div class="remb_left" onclick="remb_left()" style="border-radius:10px;width:20px;height:18px;background-color:#FFFFFF;float:left;"></div>
							<div class="remb_right" onclick="remb_right()" style="border-radius:10px;width:20px;height:18px;background-color:#FF9966;float:right;"></div>
						</div>
						<div style="float:left;font-size:13px">记我一周<input id="remberme" name="remberme" value="0" type="hidden"/></div>
						<div style="float:right;cursor:pointer;font-size:13px">忘记密码?</div>
					</div>
					<div style="height:30px;border-radius:5px;width:100%;text-align:center;margin-top:10px;">
						<input type="reset" value="重置"/>
						<span style="width:130px;">&nbsp;</span>
						<input type="submit" value="登录"/>
						<span style="width:130px;">&nbsp;</span>
						<input type="button" value="注册"/>
					</div>
					<div onclick="login_yijian();" style="font-size:10px;float:right;width:100%;text-align:center;cursor:pointer;margin-top:10px;">登录界面改进建议</div>
				</div>
			</form>
		</div>
	</div>
	<div id="login_bottom" ></div>
	<div id="login_foot" style="text-align:center;line-height:25px;font-size:13px"></div>
</body> 
</html>
