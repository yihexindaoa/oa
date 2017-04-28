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

function as_sendFromFile(layaIndex){
	if(isNull){
			var layaText;layui.use("layedit", function(){
				var layedit = layui.layedit;layaText = layedit.getText(layaIndexH);
				$('#'+nullKey).val(layaText);console.log("sendfile",layaIndexH,layaText);
				isNull = false;
				$("#userForm2").submit();
				
			});
		}else{
			$("#userForm2").submit();
		}
		
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

function as_initFullEdit(){

	var 	layaIndex;layui.use('layedit', function(){	var layedit = layui.layedit;	layaIndexH = layaIndex = layedit.build('demo');
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