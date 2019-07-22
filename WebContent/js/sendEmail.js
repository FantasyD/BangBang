//��ȡXMLHttpRequest()
function getHttp_request()
{
	try{
        // Opera 8.0+, Firefox, Chrome, Safari
        var http_request = new XMLHttpRequest();
    }catch (e){
        try{
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        }catch (e) {
            try{
                http_request = new ActiveXObject("Microsoft.XMLHTTP");
            }catch (e){
                alert("Your browser broke!");
                return false;
            }
        }
    }
    return http_request;
}

//���ߺ���

function SendEmail(id, sign, path)
{	
	var reg3=/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
	var mail= $("#" + id).val();
	if (mail != "") 
	{
		if (reg3.test(mail)) 
		{
			DynamicSend(mail, sign, path);
		}
		else 
		{
			alert("��������ȷ�����ַ��");
		}
	}
	else 
	{
		alert("���䲻��Ϊ�գ�");
	}
}

function DynamicSend(mail, sign, path)
{
	var http_request = getHttp_request();
    
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4 )
        {
        	var result = http_request.responseText;
        	if(result == "true")
        	{
        		alert("�ʼ��ѷ���,�����Ե�");
        	}
        	else
        	{
        		alert("�ʼ�����ʧ�ܣ�");
        	}
        }
    }
    var action = null;
    if(sign == 1)
    {
    	action = "/user_sendEmail.html";
    }
    else
    {
    	action = "/user_sendResetEmail.html";
    }
    http_request.open("POST", path + action, true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send("aab108=" + mail);
}

function checkPwd(input_pwd, button_id, alert_id)
{
	var pwd = input_pwd.value;
	var reg=/^\w{6,18}$/;
	if (reg.test(pwd) && typeof(pwd) != "undefined") 
	{
		$("#" + alert_id).empty();
		$("#" + alert_id).append("��������");
		$("#" + alert_id).css("color", "green");
		$("#" + button_id).attr('disabled',false);
	}
	else 
	{
		$("#" + alert_id).empty();
		$("#" + alert_id).append("���벻�Ϸ���������6-18λ�����֡���ĸ���»������!");
		$("#" + alert_id).css("color", "red");
		$("#" + button_id).attr('disabled',true);
	}
}

function checkComfirmPwd(Comfirm_pwd, pwd_id, button_id, alert_id)
{
	var C_pwd = Comfirm_pwd.value;
	var pwd = $("#" + pwd_id).val();
	if (C_pwd == pwd) 
	{
		$("#" + alert_id).empty();
		$("#" + alert_id).append("��������");
		$("#" + alert_id).css("color", "green");
		$("#" + button_id).attr('disabled',false);
	}
	else 
	{
		$("#" + alert_id).empty();
		$("#" + alert_id).append("������������벻һ��!");
		$("#" + alert_id).css("color", "red");
		$("#" + button_id).attr('disabled',true);
	}
}

function display(b, id)
{
	if(b.style.color != "blue")
	{
		b.style.color = "blue";
	}
	else
	{
		b.style.color = "red";
	}
	
	var traget=document.getElementById(id);
	if(traget.style.display=="none")
	{
		traget.style.display="";
	}
	else
	{
		traget.style.display="none";
	}  
}

function onMoveIn(x)
{
	x.style.fontSize = "17";
}

function onMoveOut(x)
{
	x.style.fontSize = "15";
}

//Ajax��̬���ú���

function register_()
{
	var http_request = getHttp_request();
    
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4 )
        {
        	var result = http_request.responseText;
        	if(result == "true")
        	{
        		alert("ע��ɹ���");
        	}
        	else
        	{
        		alert("ע��ʧ�ܣ�");
        	}
        }
    }
    
    var form = "aab102=" + encodeURI(encodeURI($("#userName").val())) + 
			   "&aab104=" + encodeURI(encodeURI($("#Name").val())) + 
			   "&aab110=" + encodeURI(encodeURI($("#school").val())) + 
			   "&aab107=" + encodeURI(encodeURI($("#student_id").val())) + 
			   "&aab108=" + encodeURI(encodeURI($("#mail").val())) + 
			   "&aab103=" + encodeURI(encodeURI($("#password_").val())) + 
			   "&ver=" + $("#num").val();
    http_request.open("POST", path + "/user_register.html", true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send(form);
}

function findPwd_()
{
	var http_request = getHttp_request();
    
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4 )
        {
        	var result = http_request.responseText;
        	if(result == "true")
        	{
        		alert("�������óɹ���");
        	}
        	else
        	{
        		alert("��������ʧ�ܣ�");
        	}
        }
    }
    var form = "&aab108=" + encodeURI(encodeURI($("#mail_findPwd").val())) + 
			   "&aab103=" + encodeURI(encodeURI($("#password_findPwd").val())) + 
			   "&ver=" + $("#num_findPwd").val();
    http_request.open("POST", path + "/user_confirmModify.html", true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send(form);
}

function modifyPwd(aab101)
{
	if($("#Pwd").val() == "" || $("#newPwd").val() == "" || $("#comfirmPwd").val() == "")
	{
		alert("���벻��Ϊ�գ�");
		return null;
	}
	var http_request = getHttp_request();
    
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4 )
        {
        	var result = http_request.responseText;
        	if(result == "true")
        	{
        		alert("�޸ĳɹ���");
        	}
        	else
        	{
        		alert("�޸�ʧ�ܣ�");
        	}
        }
    }
    var form = "aab103=" + $("#Pwd").val() + 
			   "&Naab103=" + $("#newPwd").val() + 
			   "&aab101=" + aab101;
    http_request.open("POST", path + "/user_modifyPwd.html", true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send(form);
}

function modifyEmail(aab101)
{
	if($("#New_mail").val() == "" || $("#sec_code").val() == "")
	{
		alert("���䲻��Ϊ�գ�");
		return null;
	}
	var http_request = getHttp_request();
    
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4 )
        {
        	var result = http_request.responseText;
        	if(result == "true")
        	{
        		alert("�󶨳ɹ���");
        	}
        	else
        	{
        		alert("��ʧ�ܣ�");
        	}
        }
    }
    var form = "aab108=" + $("#New_mail").val() + 
			   "&ver=" + $("#sec_code").val() + 
			   "&aab101=" + aab101;
    http_request.open("POST", path + "/user_modifyEmail.html", true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send(form);
}

function modifyUser(aab101)
{
	var is_all_null = true;
    var form = "aab101=" + aab101;
    if($("#aab102_").val() != "")
    {
    	is_all_null = false;
    	form = form + "&aab102=" + encodeURI(encodeURI($("#aab102_").val()));
    }
    if($("#aab104_").val() != "")
    {
    	is_all_null = false;
    	form = form + "&aab104=" + encodeURI(encodeURI($("#aab104_").val()));
    }
    if($("#aab105_").val() != "")
    {
    	is_all_null = false;
    	form = form + "&aab105=" + encodeURI(encodeURI($("#aab105_ option:selected").val()));
    }
    if($("#aab107_").val() != "")
    {
    	is_all_null = false;
    	form = form + "&aab107=" + encodeURI(encodeURI($("#aab107_").val()));
    }
    if($("#aab109_").val() != "")
    {
    	is_all_null = false;
    	form = form + "&aab109=" + encodeURI(encodeURI($("#aab109_").val()));
    }
    if($("#aab110_").val() != "")
    {
    	is_all_null = false;
    	form = form + "&aab110=" + encodeURI(encodeURI($("#aab110_").val()));
    }
    if($("#aab111_").val() != "")
    {
    	is_all_null = false;
    	form = form + "&aab111=" + encodeURI(encodeURI($("#aab111_").val()));
    }
    if($("#aab112_").val() != "")
    {
    	is_all_null = false;
    	form = form + "&aab112=" + encodeURI(encodeURI($("#aab112_").val()));
    }
    if($("#aab114_").val() != "")
    {
    	is_all_null = false;
    	form = form + "&aab114=" + encodeURI(encodeURI($("#aab114_").val()));
    }
    if(is_all_null)
    {
    	alert("�������и������Ϊ��!");
    	return null;
    }
    
	var http_request = getHttp_request();
    
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4 )
        {
        	var result = http_request.responseText;
        	if(result == "true")
        	{
        		alert("���³ɹ���");
        		location.reload();
        	}
        	else
        	{
        		alert("����ʧ�ܣ�");
        	}
        }
    }
    http_request.open("POST", path + "/user_modifyUser.html", true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send(form);
}