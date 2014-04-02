
var username_flag=false;
var realname_flag=false;
var password_flag=false;
var password1_flag=false;
var company_flag=false;
var dept_flag=false;
var group_flag=false;

function checkOK(){
	if(username_flag&&realname_flag&&password_flag&&password1_flag&&company_flag&&dept_flag&&group_flag){
		document.getElementById("register").disabled=false;
		document.getElementById("register").style.cursor="pointer";
	}
}

function validate_username(){
	var username = $("#username").val();
	if(username==""){
		setErrorInfo("error_username","�û�������Ϊ��");
	}else if(username.length<6||username.length>20){
		setErrorInfo("error_username","�û�������6-20");
	}else if(!username.match("^[a-z0-9A-Z_]+$")){//�û���ֻ����Ӣ�������»������
		setErrorInfo("error_username","�û���ֻ����Ӣ�����ֺ��»������");
	}else{
		setErrorInfo("error_username","");
	    $.ajax({
	        url:'UserAction!checkUsername',
	        type:'post',
	        dataType:'json',
	        data:{username:username},
	        success:function suc(){
	        	setImg("error_username");
	        	username_flag=true;
	        },
	        error: function error() {
	        	setErrorInfo("error_username","�û����Ѵ���");
            }
	     });
	}
	checkOK();
}

function validate_realname(){
	var realname = $("#realname").val();
	if(realname==""){
		setErrorInfo("error_realname","����д��ʵ����");
	}else if(!realname.match("^[\u4e00-\u9fa5]+$")){
		setErrorInfo("error_realname","����д��������");
	}else{
		setImg("error_realname");
		realname_flag=true;
	}
	checkOK();
}

function validate_password(){
	var password=$("#password").val();
	if(password==""){
		setErrorInfo("error_password","����д����");
	}else if(password.length<6||password.length>20){
		setErrorInfo("error_password","���볤��6-20");
	}else if(!password.match("^[a-z0-9A-Z_]+$")){//�û���ֻ����Ӣ�������»������
		setErrorInfo("error_password","����ֻ����Ӣ�����ֺ��»������");
	}else{
		setImg("error_password");
		password_flag=true;
	}
	checkOK();
}

function validate_password1(){
	var password1=$("#password1").val();
	var password=$("#password").val();
	if(password1==""){
		setErrorInfo("error_password1","����дȷ������");

	}else if(password!=password1){
		setErrorInfo("error_password1","���벻һ��");
	}else{
		setImg("error_password1");
		password1_flag=true;
	}
	checkOK();
}
function validate_company(){
	var company=$("#company").val();
	if(company==0){
		setErrorInfo("error_company","����д�����ֹ�˾");
	}else{
		setImg("error_company");
		company_flag=true;
	}
	checkOK();
}
function validate_dept(){
	var dept=$("#dept").val();
	if(dept==0){
		setErrorInfo("error_dept","����д��������");
	}else{
		setImg("error_dept");
		dept_flag=true;
	}
	checkOK();
}
function validate_group(){
	var group=$("#group").val();
	if(group==0){
		setErrorInfo("error_group","����д����С��");
	}else{
		setImg("error_group");
		group_flag=true;
	}
	checkOK();
}

function change_group(){
	//alert("-");
	validate_group();
	//checkOK();
}

function setErrorInfo(e_id,info){
	var show = "<font color='red' size=\"1\">"+info+"</font>";
	var d=document.getElementById(e_id);
	d.innerHTML=show;
	return false;
}

function setImg(e_id){
	var show = "<img src=\"images/checkOk.png\">";
	var d=document.getElementById(e_id);
	d.innerHTML=show;
}