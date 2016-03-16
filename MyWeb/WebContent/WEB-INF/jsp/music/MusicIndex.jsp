<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet"href="${pageContext.servletContext.contextPath }/source/js/layer/skin/layer.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/layer/layer.js"></script>

<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/source/css/jquery-smartMenu/jquery.contextmenu.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-smartMenu/jquery.contextmenu.js"></script>

<%-- <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/source/css/jquery-smartMenu/smartMenu.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-smartMenu/jquery-smartMenu.js"></script>
 --%>
<title>MusicOnline</title>

<style type="text/css">
body{
	float:left;margin: 0px auto;width:100%;height:100%;font-size:14px;
}
img{
	height:100%;width:100%;
}
.body_div{
	float:left;border:0px;margin:0 15% 0 15%;width:70%;padding-bottom:30px;
}
#music_body{
	float:left;height:706px;width:100%;margin-top:40px;
}
#music_body_top{
	border:1px solid #1887AB;height:60px;line-height:60px;width:100%;
}
#music_body_center{
	height:560px;width:100%;border:1px solid #D2D2D2;
}
#music_body_bottom{
	height:80px;width:100%;background-color:#393939;border:1px solid #393939;float:left;
}

.music_list div:nth-child(2n){
	background-color:#F1F1F1;line-height:35px;
}
.music_list div:nth-child(2n-1){
	background-color:#FFFFFF;line-height:35px;
}
.music_list div:hover{
	background-color:#B8E1FF;  
}
.caidan_list div:hover{
	background-color:#D0D0D0;  
}
</style>


<script>
	layer.config({
	    extend: "/extend/layer.ext.js"
	});
	
	//添加歌单
	function new_gedan(){
		layer.prompt({
		    title: '请输入歌单名称',
		    formType: 0,	//0:普通文本   1:密码文本   2:文件上传   3:多行文本
		},function(value,index){
			if(value != null && value != '' && value.indexOf(' ') < 0 && value.length <= 6){
				$('.caidan_list').append('<div onmousedown="my_dj(this)" style="float:left;width:100%;line-height:30px;cursor:pointer" >'
											+'<span style="float:left;width:60%;margin-left:10%" >'+value+'</span>'
											+'<span style="float:left;margin-left:5%" >0首</span>'
										+'</div>');
				layer.close(index);
			}else{
				return false;
			}
			/* $.ajax({
			    url: "/JWZWORK/jwz_wdxxcon/logjwzjygl",    //请求的url地址
			    dataType: "json",   //返回格式为json
			    async: true, //请求是否异步，默认为异步，这也是ajax重要特性
			    data: { "pasd": value },    //参数值
			    type: "POST",   //请求方式
			    success: function(date) { //请求成功时处理
			    },
			});  */
		});
	}
	
	//重命名，删除    歌单操作
	function my_dj(obj){
        $(obj).contextPopup({
          //title: 'My Popup Menu',
          items: [{	
        	  		label:'重命名',
	            	icon:'${pageContext.servletContext.contextPath }/source/images/music/rn_one_wls.png',
	            	action:function(){
	            		//layer.msg('重命名='+$(obj).children().first().text());
	            		layer.prompt({
	            		    title: '请输入歌单名称',
	            		    formType: 0,
	            		    value:$(obj).children().first().text(),
	            		},function(value,index){
	            			if(value != null && value != '' && value.indexOf(' ') < 0 && value.length <= 6){
		            			$(obj).children().first().text(value);
		            			layer.close(index);
	            			}else{
	            				return false;
	            			}
	            		});
            		} 
            	},
           		null,
            	{	
            		label:'删除', 
            		icon:'${pageContext.servletContext.contextPath }/source/images/music/delete_one_wls.png',
            		action:function(){
            			//layer.msg('删除');
            			console.log($(obj).remove());
           			} 
            	},
          ]
        });
	}
	
	//文件上传
	function upload_file(){
		$('#up_music').click();
	}
	
	
/* 	function my_dj(obj){
		var MenuData = [
	                     [{
	                         text: "重命名",
	                         func: function() {
	                             $(this).css("padding", "10px");
	                         }
	                     },{
	                         text: "删除",
	                         func: function() {
	                             $(this).remove();
	                         }
	                     }]
	                 ];
		$(obj).smartMenu(MenuData, {
		    name: "image"
		});
	} */
	
</script>
<script type="text/javascript">

$(function(){
	
	$('img').mouseover(function(){
		$(this).attr('src',$(this).attr('src').split('wls.png')[0]+'on_wls.png');
	});
	$('img').mouseout(function(){
		$(this).attr('src',$(this).attr('src').split('on_wls.png')[0]+'wls.png');
	});
	
	//设置音乐列表点击事件
	$('.music_list div').click(function(){
		initAudio ($(this).children('span').eq(1).attr('class'));
		audio.play();	//'播放'
		$('#open_off').attr('src','${pageContext.servletContext.contextPath }/source/images/music/stop_one_wls.png');
		setSecond();
	});
	
	//设置音量点击事件
	$('#vol_all_div').mousedown(function(e){
		var nowWidth = e.offsetX==1?0:e.offsetX==$(this).width()-1?$(this).width():e.offsetX;
		$('#vol_now_div').css('width',nowWidth);
		setVol(Math.round((nowWidth>2?nowWidth-2:nowWidth)/(($(this).width()-2)/100))/100);
	});
	
	//设置进度条点击事件
	$('#secone_all_div').mousedown(function(e){
		var nowWidth = e.offsetX;
		var allS = allSecond();
		var thisWidth = $(this).width()-1;
		setNowTime(Math.round((allS/thisWidth)*nowWidth));
	});
});


var audio = null ;
window.onload = function(){
	//初始化音乐播放器
	initAudio('/music/lhx.mp3');
}; 


function initAudio (src){
	$('#audio_div').children().remove();
	$('#audio_div').html('<audio id="audio" loop="loop">'
						+'	<source src="'+src+'" type="audio/mpeg">'
						+'</audio>');
	audio = document.getElementById('audio');
	
	//初始化音量
	setVol(Math.round(30/(($('#vol_all_div').width()-2)/100))/100);
	//初始化歌曲总时间
	$('#time_all_div').text(SecondToMS(allSecond()));
	//初始已播放时间
	$('#time_now_div').text(SecondToMS(nowSecond()));
};

// 播放 或 暂停
function playOrPaused(){
	if(audio.paused){
		audio.play();	//'播放'
		$('#open_off').attr('src','${pageContext.servletContext.contextPath }/source/images/music/stop_one_on_wls.png');
		setSecond();
	}else{
		audio.pause();	//'暂停'
		$('#open_off').attr('src','${pageContext.servletContext.contextPath }/source/images/music/play_one_on_wls.png');
	}
};

//设置进度条
var over;
function setSecond(){
	over = setTimeout("setSecond()",1000);
	var allWidth = $('#secone_all_div').width();
	var nowWidth = 0;
	var allS = allSecond();
	var nowS = nowSecond();
	if(nowWidth == allWidth){
		clearTimeout(over);
	}
	nowWidth = (allWidth/allS)*nowS;
	$('#time_all_div').text(SecondToMS(allSecond()-nowSecond()));
	$('#time_now_div').html(SecondToMS(nowSecond()));
	$('#secone_now_div').css('width',nowWidth);
}


//音量+ 或 音量-
function setVol(val){
	if(val == 0){
		audio.muted = true;
		$('#val_img').attr('src','${pageContext.servletContext.contextPath }/source/images/music/vol_0_wls.png');
	}else{
		audio.muted = false;
		$('#val_img').attr('src','${pageContext.servletContext.contextPath }/source/images/music/vol_2_wls.png');
	}
	audio.volume =  val;
};


//开启静音 或 关闭静音
var VW = 0;
function muted(obj){
	if(audio.muted){
		audio.muted = false;	//'关闭静音';
		$('#vol_now_div').css('width',VW);
		$(obj).attr('src','${pageContext.servletContext.contextPath }/source/images/music/vol_2_on_wls.png');
	}else{
		VW = $('#vol_now_div').width();
		$('#vol_now_div').css('width',0);
		audio.muted = true; 	//'开启静音';
		$(obj).attr('src','${pageContext.servletContext.contextPath }/source/images/music/vol_0_on_wls.png');
	}
};


//获得音频总时长
function allSecond() { 
	var seco = parseInt(audio.duration);
	return seco;
}


//获得已播放的时长
function nowSecond(){
	var seco = parseInt(audio.currentTime);
	return seco;
};

//获得已播放的时长
function setNowTime(val){
	audio.currentTime = val;
};


//改变播放顺序图片
function foreach(obj){
	if($(obj).attr('src').indexOf('foreach_for_on_wls.png')>=0){
		$(obj).attr('src',$(obj).attr('src').replace('foreach_for','foreach_all'));
	}else if($(obj).attr('src').indexOf('foreach_all_on_wls.png')>=0){
		$(obj).attr('src',$(obj).attr('src').replace('foreach_all','foreach_one'));
	}else if($(obj).attr('src').indexOf('foreach_one_on_wls.png')>=0){
		$(obj).attr('src',$(obj).attr('src').replace('foreach_one','foreach_for'));
	}
};


//格式化时间
function SecondToMS(se){
	var m = 0;
	var s = se;
	while(se > 59){
		s = 0;
		if(se >= 60){
			se -= 60;
			m += 1;
		}
		if(se < 60){
			s = se;
			break;
		}
	}
	return (m<10?('0'+m):m)+':'+(s<10?('0'+s):s);
};

</script>
</head>
<body>
	<div id="audio_div" style="display:none">
		<audio id="audio" loop="loop">
			<source src="/music/lhx.mp3" type="audio/mpeg">
		</audio>
	</div>
	<div style="display:none">
		<input id="up_music" type="file" name="music_names" multiple="multiple">
	</div>
	<div class="body_div">
		<div id="music_body">
			<div id="music_body_top" style="background-image:url('${pageContext.servletContext.contextPath }/source/images/music/music_bgtop_wls.png');background-size:cover;">
 				<span style="font-size:25px;font-weight:bold;font-family:微软雅黑">WLS-MusicOnline</span>
 			</div>
			<div id="music_body_center">
				<div style="float:left;width:20%;height:560px;">
					<div style="float:left;width:100%;height:50px;line-height:50px;background-color:#B8E1FF;font-weight:bold;">
						<span style="float:left;margin-left:5%" >我的歌单</span>
						<img onclick="new_gedan()" title="添加歌单" style="cursor:pointer;width:25px;height:25px;margin-top:13px;float:right;margin-right:5%" src="${pageContext.servletContext.contextPath }/source/images/music/new_default_wls.png">
					</div>
					<div class="caidan_list" style="float:left;width:100%;height:510px;background-color:#F7F7F7;font-size:13px">
						<div style="float:left;width:100%;line-height:30px;cursor:pointer" >
							<span style="float:left;width:60%;margin-left:10%" >默认歌单</span>
							<span style="float:left;margin-left:5%" >3首</span>
						</div>
						<div onmousedown="my_dj(this);" style="float:left;width:100%;line-height:30px;cursor:pointer" >
							<span style="float:left;width:60%;margin-left:10%" >我的最爱</span>
							<span style="float:left;margin-left:5%" >0首</span>
						</div>
						<div onmousedown ="my_dj(this);" style="float:left;width:100%;line-height:30px;cursor:pointer" >
							<span style="float:left;width:60%;margin-left:10%" >我的DJ歌曲</span>
							<span style="float:left;margin-left:5%" >0首</span>
						</div>
					</div>
				</div>			
				<div style="float:left;;width:80%;height:560px;">
					<div style="float:left;width:100%;height:49px;">
						<div onclick="upload_file();" style="float:right;margin-right:2%;width:10%;height:30px;line-height:30px;margin-top:9px;text-align:center;background-color:#23A7FA;cursor:pointer;">
							添加歌曲
						</div>
						<div style="float:right;width:25%;height:25px;margin-right:5%;margin-top:11px;border-bottom:1px solid #000000;">
							<input style="float:left;width:100%;height:25px;border:0px;" name="user_name" placeholder="搜索歌名、歌手" />
						</div>
					</div>
					<div style="float:left;width:100%;height:510px;overflow:auto;">
						<div id="title" style="float:left;width:99%;margin-left:1%;text-align:center;background-color:#6DA5A5;height:35px;line-height:35px;font-size:14px;">
							<div style="float:left;width:10%">序号</div>
							<div style="float:left;width:50%">歌名</div>
							<div style="float:left;width:20%">歌手</div>
							<div style="float:left;width:10%">时长</div>
							<div style="float:left;width:10%">大小</div>
						</div>
						<div class="music_list" style="float:left;width:99%;margin-left:1%;text-align:center;height:475px;font-size:13px;">
<%-- 							<c:forEach items="{1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,}" varStatus="index">
 --%>							<div style="float:left;width:100%;cursor:pointer;">
									<span style="float:left;width:10%">1</span>
									<span style="float:left;width:50%" class="/music/lhx.mp3">李宇春 - 梨花香</span>
									<span style="float:left;width:20%">王路帅</span>
									<span style="float:left;width:10%">03:57</span>
									<span style="float:left;width:10%">5.2M</span>
								</div>
								<div style="float:left;width:100%;cursor:pointer;">
									<span style="float:left;width:10%">2</span>
									<span style="float:left;width:50%" class="/music/sx.mp3">李宇春 - 蜀绣</span>
									<span style="float:left;width:20%">王路帅</span>
									<span style="float:left;width:10%">03:57</span>
									<span style="float:left;width:10%">5.2M</span>
								</div>
								<div style="float:left;width:100%;cursor:pointer;">
									<span style="float:left;width:10%">3</span>
									<span style="float:left;width:50%" class="/music/ao.mp3">林俊杰 - Always Online</span>
									<span style="float:left;width:20%">王路帅</span>
									<span style="float:left;width:10%">03:57</span>
									<span style="float:left;width:10%">5.2M</span>
								</div>
<%-- 							</c:forEach>
 --%>						</div>
					</div>
				</div>
			</div>
			<div id="music_body_bottom">
				<!-- --------------------上一首-------------------- 播放/暂停--------------------下一首-------------------- -->
				<div style="width:25%;height:80px;float:left;">
					<div style="float:left;width:14%;height:35px;margin-top:23px;margin-left:10%;">
						<img onclick="playOrPaused1(this)" style="cursor:pointer;" src="${pageContext.servletContext.contextPath }/source/images/music/up_one_wls.png">
					</div>
					<div style="float:left;width:20%;height:50px;margin-top:15px;margin-left:15%">
						<img id="open_off" onclick="playOrPaused()" style="cursor:pointer;" src="${pageContext.servletContext.contextPath }/source/images/music/play_one_wls.png">
					</div>
					<div style="float:left;width:14%;height:35px;margin-top:23px;margin-left:15%">
						<img onclick="playOrPaused1(this)"style="cursor:pointer;" src="${pageContext.servletContext.contextPath }/source/images/music/down_one_wls.png">
					</div>
				</div>
				
				<!-- --------------------已播放时长--------------------进度条--------------------总时长-------------------- -->
				<div style="width:50%;height:80px;float:left;text-align:center;">
					<div id="time_now_div" style="float:left;width:10%;line-height:80px;color:#FFFFFF">00:00</div>
					<div style="float:left;width:80%;height:80px;">
						<div id="secone_all_div" style="cursor:pointer;width:100%;float:left;height:15px;background-color:#888888;border-radius:9px;margin-top:32px">
							<div id="secone_now_div"style="float:left;width:0px;height:15px;border-radius:9px;background-color:#43B1E0;">&nbsp;</div>
						</div>
					</div>
					<div id="time_all_div" style="float:left;width:10%;line-height:80px;color:#FFFFFF">03:50</div>
				</div>
				
				<!-- ----------------------------------------音量--------------------循环方式---------------------------------------- -->
				<div style="width:25%;height:80px;float:left;">
					<div style="float:left;width:10%;height:25px;margin-top:27px;margin-left:20%">
						<img id="val_img" onclick="muted(this)" style="cursor:pointer;" src="${pageContext.servletContext.contextPath }/source/images/music/vol_2_wls.png">
					</div>
					<div style="float:left;width:30%;height:80px;margin-left:2%">
						<div id="vol_all_div" style="cursor:pointer;width:100%;float:left;height:8px;background-color:#888888;border-radius:4px;margin-top:36px">
							<div id="vol_now_div"style="float:left;width:30px;height:8px;border-radius:4px;background-color:#43B1E0;">&nbsp;</div>
						</div>
					</div>
					<div style="float:left;width:10%;height:22px;margin-top:29px;margin-left:15%">
						<img id="foreach_img" onclick="foreach(this)"  style="cursor:pointer;" src="${pageContext.servletContext.contextPath }/source/images/music/foreach_for_wls.png">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
