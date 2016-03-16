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
		//加载数据
		var dg = $('#tt');
		dg.datagrid({   
		    url:'testCon.do?method=test',
		    frozenColumns: [[
		                     { field: 'ck', checkbox: true }
		                 ]],
		    columns:[[
				{field:'itemid',title:'itemid',width:100,sortable:true},
				{field:'productid',title:'productid',width:100,sortable:true},
				{field:'productname',title:'productname',width:100,sortable:true},
				{field:'status',title:'status',width:100,sortable:true},
				{field:'listprice',title:'listprice',width:100,sortable:true},
				{field:'attr1',title:'attr1',width:100,sortable:true},
				{field:'unitcost',title:'unitcost',width:100,sortable:true}
				]],
		    pagination:true,	//True 就会在 datagrid 的底部显示分页栏。
		    checkbox: true,
		    pageSize:20,
		    pageList:[20,40,60,80,100],
		    pageNumber:1,   
		    rownumbers:true,	//True 就会显示行号的列。
		    singleSelect:false,	//True 就会只允许选中一行。
		    fit:true,
		    striped:true,		//True 就把行条纹化。（即奇偶行使用不同背景色）
		    fitColumns:true,	//True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
		    loadMsg:'数据加载中，请稍等',
			//queryParams:{productid:'FI-SW-04'},		//当请求远程数据时，发送的额外参数。
		});
	});
	
	//搜索
	function doSearch() {  
	    $('#tt').datagrid('load', {  
	        productid: $('#productid').val()
	    });  
	} 
	
	function Add() {
		alert('添加');
		$('#tt').datagrid('reload');//
	} 
	function Edit() {  
		var row = $('#tt').datagrid('getSelections');
		if(row != null){
			var array_element = '';
			for (var i = 0; i < row.length; i++) {
				array_element += row[i].productid+',';
			}
			alert('修改==='+array_element);
		}
		$('#tt').datagrid('reload');//
	}
	function Delete() {  
		var row = $('#tt').datagrid('getSelections');
		if(row != null){
			var array_element = '';
			for (var i = 0; i < row.length; i++) {
				array_element += row[i].productid+',';
			}
			alert('删除==='+array_element);
		}
		$('#tt').datagrid('reload');//
	} 
</script>
<style>
body{
	margin:0px auto;font-family:微软雅黑;font-size:15px;
}
</style>

</head>
<body >
	<!-- ----------------- tabs 开始 ------------------->
		<table id="tt" data-options="toolbar:'#tb',border:false"></table>
		<div id="tb" style="padding:3px">  
		    <span>
			    Product ID:<input id="productid" style="height:20px;border:1px solid #ccc">  
				<a href="#" onclick="doSearch();" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">Search</a>
			</span>
			<span style="float: right;">
				<a href="#" onclick="Add();" class="easyui-linkbutton" data-options="iconCls:'icon-add'">Add</a>
				<a href="#" onclick="Edit();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">Edit</a>
				<a href="#" onclick="Delete();" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">Delete</a>
				<a href="#" onclick="Print();" class="easyui-linkbutton" data-options="iconCls:'icon-print',disabled:true">Print</a>
			</span>
		</div> 
	<!--  ----------------- tabs 结束 ------------------->
</body>
</html>
