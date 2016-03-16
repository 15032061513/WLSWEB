(function(){
	
	function User(){}
	
	User.prototype = {
		getname:function(){
			console.log('qqqqqqqqq');
		},
		getage:function(){
			console.log('11111111');
		},
		alert:function(title,text,icon){
			console.log(title+"++++++++"+text+"------"+icon);
			var body = document.getElementById('login_bottom');
			console.log(body);
			body.innerHTML = '<div style="position:absolute;z-index:100;background-color:red;">12312312</div>';
			console.log(body);
		},
	};
	window.User = User;
}());
var wls = new User(); 
console.log(wls); 	
