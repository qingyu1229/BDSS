
function company_change(){
	var company=$('#company').val();
    $.ajax({
        url:'LinkageAction!reg_changCompany',
        type:'post',
        dataType:'json',
        data:{company:company},
        success:company_change2
     });
 }

function company_change2(json){
	var dataobj=eval("("+json.dept+")");
	var e_dept=document.getElementById("dept");
	e_dept.options.length=0;
	$("#dept").append("<option value='0'>==请选择==</option>");
	$.each(dataobj,function(i){
		$("#dept").append("<option value='"+dataobj[i]['dept']+"'>"+dataobj[i]['dept']+"部</option>");
	    });
}

function dept_change(){
	var dept=$('#dept').val();
	var company=$('#company').val();
	 $.ajax({
	        url:'LinkageAction!reg_changeDept',
	        type:'post',
	        dataType:'json',
	        data:{'dept':dept,'company':company},
	        success:dept_change2
	     });
}
function dept_change2(info){
	var dataobj=eval("("+info.group+")");
	var e_group=document.getElementById("group");
	e_group.options.length=0;
	$("#group").append("<option value='0'>==请选择==</option>");
	$.each(dataobj,function(i){
		$("#group").append("<option value='"+dataobj[i]['group']+"'>"+dataobj[i]['group']+"部</option>");
	    });
}