function as_initForm(){
	
	$("#newUpload2").empty();$("#newUpload2").append("<input type='file' name='file'>");
}

var isNull = false,nullKey;
var 	layaIndexH;
function as_createInput(key,value){
		if(value==null){
			isNull = true;
			nullKey = key;
		};
		
		$("#newUpload2").append("<input type=\"hidden\" name=\""+key+"\" value=\""+value+"\" id = \""+key+"\">");

}

function as_sendFromFile(layaIndex ,url){
	$("#userForm2").attr("action", url);
	if(isNull){
			var layaText;layui.use("layedit", function(){
				var layedit = layui.layedit;layaText = layedit.getContent(layaIndexH);
				$('#'+nullKey).val(layaText);console.log("sendfile",layaIndexH,layaText);
				isNull = false;
				//$("#userForm2").submit();
				uptDogProInfo();
			});
		}else{
			uptDogProInfo();
		}
		
}

/**使用ajaxSubmit上传文件返回**/
function uptDogProInfo(){
	var ajax_option={
		url:$("#userForm2").attr("action"),//form 的action
		type:"post",  //form 的method方法
		beforeSubmit:checkUppro,  //在表达提交前执行的验证函数
		contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
		success:function(data){  //表单提交成功后执行的函数
			//alert("执行成功！");
			thisMovie("OfficeAutomation").sendFromFileCallBack(JSON.stringify(data));
		}
	}
	$("#userForm2").ajaxSubmit(ajax_option);
}
function checkUppro(){

}

function as_showForm(lx,ly){
	as_initForm();
	$("#newUpload2").show();$("#newUpload2").css({"left":lx+"px","top":ly+"px"})
}

function as_posForm(lx,ly){
	$("#newUpload2").css({"left":lx+"px","top":ly+"px"})
}

function as_hideForm(){
$("#newUpload2").hide();

}

function as_initFullEdit(path){

	var 	layaIndex;layui.use('layedit', function(){	var layedit = layui.layedit;	
	
	layedit.set({  uploadImage: {
	    url: path+'file/fileImgUpload', //接口url   
	    type: 'post' //默认post 
	     }});
	layaIndexH = layaIndex = layedit.build('demo');
	console.log("layedit",layedit);
	$(".layui-layedit").css({"position":"absolute","left":"0px","top":"0px","z-index":-1,"width":"1px","height":"1px"});
	 });
	
	return layaIndex;
}

function as_showFullEdit(lx,ly){

$(".layui-layedit").show();$(".layui-layedit").css({"position":"absolute","left":lx+"px","top":ly+"px","z-index":999,"width":"447px","height":"235px"})
}

function as_posFullEdit(lx,ly){
	$(".layui-layedit").css({"left":lx+"px","top":ly+"px"});
}

function as_hideFullEdit(){
	$(".layui-layedit").hide();
}

function as_getLayaText(layaIndex){
	var layaText;layui.use("layedit", function(){var layedit = layui.layedit;layaText = layedit.getText(layaIndex)});
	return layaText;
}

function as_setContentText(content,indexcontent){
	$("#LAY_layedit_"+indexcontent).contents().find("body").html(content);
	
}


//----------------

function thisMovie(movieName) {
     if (navigator.appName.indexOf("Microsoft") != -1) {
         return window[movieName];
     } else {
         return document[movieName];
     }
 }