<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ page isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="/JWZWORK/source/jquery-1.9.1.min.js"></script>
	<title>WLS-WEB</title>
<STYLE type=text/css>BODY {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体
}
P {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体
}
TD {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体
}
TH {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体
}
BODY {
	SCROLLBAR-FACE-COLOR: #eeeeee; BACKGROUND: url(404/bg.gif)  repeat-x; SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; SCROLLBAR-SHADOW-COLOR: #dee3e7; SCROLLBAR-3DLIGHT-COLOR: #d1d7dc; SCROLLBAR-ARROW-COLOR: #000000; SCROLLBAR-TRACK-COLOR: #ededed; SCROLLBAR-DARKSHADOW-COLOR: #808080; BACKGROUND-COLOR: #ffffff
}
INPUT {
	BORDER-TOP-WIDTH: 1px; PADDING-RIGHT: 1px; PADDING-LEFT: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0c0c0; PADDING-BOTTOM: 1px; CURSOR: hand; COLOR: #000000; BORDER-TOP-COLOR: #c0c0c0; PADDING-TOP: 1px; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体; HEIGHT: 18px; BACKGROUND-COLOR: #ffffff; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0c0c0
}
TEXTAREA {
	BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0c0c0; CURSOR: hand; COLOR: #000000; BORDER-TOP-COLOR: #c0c0c0; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体; BACKGROUND-COLOR: #ffffff; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0c0c0
}
SELECT {
	BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; FONT-SIZE: 9pt; BORDER-LEFT-COLOR: #c0c0c0; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: #c0c0c0; CURSOR: hand; COLOR: #000000; BORDER-TOP-COLOR: #c0c0c0; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif, 宋体; BACKGROUND-COLOR: #ffffff; BORDER-RIGHT-WIDTH: 1px; BORDER-RIGHT-COLOR: #c0c0c0
}
.bg {
	BACKGROUND-COLOR: #ffffff
}
.bg_td {
	BACKGROUND-COLOR: #f7f7f7
}
.bg_tds {
	BACKGROUND-COLOR: #eeeeee
}
.bg_table {
	BACKGROUND-COLOR: #ffffff
}
.bg_frame {
	BACKGROUND-COLOR: #00659c
}
.tablew {
	WIDTH: 98%
}
.table {
	BORDER-RIGHT: 1px; BORDER-TOP: 1px; BORDER-LEFT: 1px; WIDTH: 98%; BORDER-BOTTOM: 1px; BACKGROUND-COLOR: #ffffff
}
.tims {
	FONT-SIZE: 7pt; COLOR: #808080; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
.htd {
	LINE-HEIGHT: 150%
}
.btd {
	FONT-WEIGHT: bold
}
.bw {
	WORD-WRAP: break-word
}
.tf {
	TABLE-LAYOUT: fixed
}
.gray {
	COLOR: #808080
}
.red {
	COLOR: #ff0000
}
.red2 {
	COLOR: #cc3300
}
.blue {
	COLOR: #0066cc
}
.ftd {
	COLOR: #ffffff
}
.fbg {
	COLOR: #ffffff
}
.div_alt {
	BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: black 1px solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; MARGIN-LEFT: 18px; BORDER-LEFT: black 1px solid; WIDTH: 240px; COLOR: #000000; PADDING-TOP: 2px; BORDER-BOTTOM: black 1px solid; BACKGROUND-COLOR: #ffffe1
}
A {
	COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #ff0000; TEXT-DECORATION: underline
}
A.h_menu {
	COLOR: #333333; TEXT-DECORATION: none
}
A.h_menu:hover {
	COLOR: #ff0000; TEXT-DECORATION: underline
}
</STYLE>
</head>

<%--
<body leftmargin=0 topmargin=0><a name=top></a>
 <center>
<div id=page style="margin-top: 5%">
<table cellspacing=0 cellpadding=0 width=980 align=center border=0>
  <tbody>
  <tr>
    <td align=middle>&nbsp;</td></tr></tbody></table>
<table cellspacing=0 cellpadding=0 width="80%" border=0>
  <tbody>
  <tr>
    <td><img src="/JWZWORK/source/error/404/1.gif" width="17" height="18"></td>
    <td width="100%"  background="/JWZWORK/source/error/404/3.gif"></td>
    <td><img  src="/JWZWORK/source/error/404/2.gif" width="17" height="18"></td>
  </tr></tbody></table>
<table cellspacing=0 cellpadding=0 width="80%" border=0>
  <tbody>
  <tr>
    <td width=7  background="/JWZWORK/source/error/404/left.gif"></td>
    <td class=bg align=middle width=*>
      <table cellspacing=0 cellpadding=0 width="98%" align=center border=0>
        <tbody>
        <tr>
          <td width="100%" colspan="4" align="center">
            <div id=div_msg style="width:70%;">
            <marquee onmouseover="if (document.all!=null){this.stop()}"onmouseout="if (document.all!=null){this.start()}" scrollamount=3scrolldelay=100><img src="/JWZWORK/source/error/404/gao.gif" width="19" height="17"> 
            	<font class=red style="font-family:微软雅黑;" size="2em">
            		您操作带来的系统问题将成为我们进步的动力，我们会尽快完善，感谢您的谅解。
            	</font>
            </marquee></div></td></tr></tbody></table></td>
    <td width=7 background="/JWZWORK/source/error/404/right.gif"></td></tr></tbody></table>
<table cellspacing=0 cellpadding=0 width="80%" border=0>
  <tbody>
  <tr>
    <td width=7 background="/JWZWORK/source/error/404/left.gif"></td>
    <td class=bg align=middle width=*>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody>
        <tr>
          <td class=bg_1 align=middle height=300>
            <table cellspacing=0 cellpadding=0 width=590 border=0>
              <tbody>
              <tr>
                <td align=right><img src="/JWZWORK/source/error/404/center_error.gif" width="450" height="32" border=0></td>
              </tr>
              <tr>
                <td align=middle height=380>
                  <table cellspacing=0 cellpadding=0 width=534 border=0>
                    <tbody>
                    <tr>
                      <td colspan=3><img height=42 src="/JWZWORK/source/error/404/error_r1_c1.gif"width=534 border=0></td>
                      <td><img height=42  src="/JWZWORK/source/error/404/60du.htm" width=1 border=0></td></tr>
                    <tr>
                      <td rowspan=2><img height=239  src="/JWZWORK/source/error/404/error_r2_c1.gif"  width=43 border=0></td>
                      <td class=htd align=middle width=479 bgcolor=#f7f7f7 height=228>
                        <p>
                        <font class=red>您的访问的页面可能被删除或不存在。</font><br><br>
                                                请勿乱给本站的程序提交非法参数。<br><br><br>
                        <a class=red2 href="javascript:void(0)" onclick="javascript:history.go(-1)">点我返回</a></p>
                        <p>如遇紧急情况请尽快联系我们，我们将竭诚为您服务！</p></td>
                      <td rowspan=2> <img height=239 src="/JWZWORK/source/error/404/error_r2_c3.gif"  width=12 border=0></td>
                      <td><img height=228  src="/JWZWORK/source/error/404/60du.htm" width=1 border=0></td>
                    </tr>
                    <tr>
                      <td><img height=11  src="/JWZWORK/source/error/404/error_r3_c2.gif" width=479 border=0></td>
                      <td><img height=11  src="/JWZWORK/source/error/404/60du.htm" width=1 border=0></td>
                    </tr>
                 </tbody>
    </table><br> </td> </tr> </tbody> </table> </td> </tr></tbody></table></td>
    <td width=7  background="/JWZWORK/source/error/404/right.gif"></td></tr></tbody></table>
<table cellspacing=0 cellpadding=0 width="80%" border=0>
  <tbody>
  <tr>
    <td class=bg align="middle" width=*>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody>
        <tr>
          <td><img src="/JWZWORK/source/error/404/4.gif" width="17" height="18"></td>
          <td width="100%"  background="/JWZWORK/source/error/404/6.gif"></td>
          <td><img  src="/JWZWORK/source/error/404/5.gif" width="17" height="18"></td>
        </tr></tbody></table><br>
      <div></div></td></tr></tbody></table>
<center></center></div></center></body> --%>

<body> <br/><br/><br/><br/>
<h3 style="font-family:微软雅黑;width:100%;text-align: center;">
恭喜你，您操作带来的系统问题将成为我们进步的动力，我们会尽快完善，感谢您的谅解；<br/>
<a href="javascript:void(0)" onclick="javascript:history.go(-1)" style="color:red">点我返回</a>
</h3><br/><br/>
这里是错误信息：<br/>
<%= exception.getMessage() %><br/><br/>
<div style="width:100%;text-align: center;"><h2>界面待美化.....</h2></div> 

</body> 
</html>
