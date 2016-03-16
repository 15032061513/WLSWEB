<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/source/css/jquery-smartMenu/jquery.contextmenu.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-smartMenu/jquery.contextmenu.js"></script>

<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/source/css/jquery-smartMenu/smartMenu.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/source/js/jquery-smartMenu/jquery-smartMenu.js"></script>
<title>jQuery 右键菜单插件</title>
<script>
//  jquery.contextmenu
$(function() {
	$('#mythingy1').contextPopup({
		title: 'My Popup Menu',
		items: [
			{label:'Some Item',     icon:'icons/shopping-basket.png',             action:function() { alert('clicked 1') } },
			{label:'Another Thing', icon:'icons/receipt-text.png',                action:function() { alert('clicked 2') } },
			{label:'Blah Blah',     icon:'icons/book-open-list.png',              action:function() { alert('clicked 3') } },
			null, // divider
			{label:'Sheep',         icon:'icons/application-monitor.png',         action:function() { alert('clicked 4') } },
			{label:'Cheese',        icon:'icons/bin-metal.png',                   action:function() { alert('clicked 5') } },
			{label:'Bacon',         icon:'icons/magnifier-zoom-actual-equal.png', action:function() { alert('clicked 6') } },
			null, // divider
			{label:'Onwards',       icon:'icons/application-table.png',           action:function() { alert('clicked 7') } },
			{label:'Flutters',      icon:'icons/cassette.png',                    action:function() { alert('clicked 8') } }
		]
	});
});
</script>

<script>
//          jquery-smartMenu
var imageMenuData = [
    [{
        text: "图片描边",
        data: [[{
            text: "5像素深蓝",
            func: function() {
                $(this).css("border", "5px solid #34538b");
            }
        }, {
            text: "5像素浅蓝",
            func: function() {
                $(this).css("border", "5px solid #a0b3d6");
            }
        }, {
            text: "5像素淡蓝",
            func: function() {
                $(this).css("border", "5px solid #cad5eb");
            }
        }]]
    }, {
        text: "图片内间距",
        func: function() {
            $(this).css("padding", "10px");
        }
    }]
];
var bodyMenuData = [[{ text: "页面空白处点击是否冲突测试" }]];
$(function() {
	$("#testImage").smartMenu(imageMenuData, {
	    name: "image"
	});
	$("body").smartMenu(bodyMenuData, {
	    name: "body"    
	});
});
</script>
</head>
<body>
	<div id="mythingy1" style="width:500px; height: 500px; margin: 10px; border:2px dashed #666666; padding:6px">
      mythingy1mythingy1mythingy1mythingy1mythingy1mythingy1mythingy1mythingy1
    </div>
    
    <div id="testImage" style="width:500px; height: 500px; margin: 10px; border:2px dashed #666666; padding:6px">
      testImagetestImagetestImagetestImagetestImagetestImagetestImagetestImage
    </div>
</body>
</html>
