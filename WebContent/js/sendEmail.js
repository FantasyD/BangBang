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

function SendEmail(sign, path)
{	
	var reg3=/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
	var mail=document.getElementById("mail").value;
	if (mail != "") 
	{
		if (reg3.test(mail)) 
		{
			DynamicSend(mail, sign, path);
		}
		else 
		{
			alert("请输入正确邮箱地址！");
		}
	}
	else 
	{
		alert("邮箱不能为空！");
	}
}

function DynamicSend(mail, sign, path)
{
	var http_request = getHttp_request();
    
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4 )
        {
        	alert("邮件已发送");
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