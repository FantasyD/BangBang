
var chat_id;
var map = new Map();
//用于进行消息提示
var span_color = null;

//向WebSocket服务器的连接
var webSocket_record = null;

//用户的头像
var sender_path = user_img;

//聊天接收者的头像
var accept_path = null;

function getHttp_request()
{
	try{
        // Opera 8.0+, Firefox, Chrome, Safari
        var http_request = new XMLHttpRequest();
    }catch (e){
        // IE浏览器处理
        try{
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        }catch (e) {
            try{
                http_request = new ActiveXObject("Microsoft.XMLHTTP");
            }catch (e){
                //错误处理
                alert("Your browser broke!");
                return false;
            }
        }
    }
    return http_request;
}
function onMoveIn(x)
{
	if(x.style.background != "rgb(102, 153, 51)")
	{
		x.style.background = "#3f4953";
	}
}

function onMoveOut(x)
{
	if(x != span_color && x.style.background != "rgb(102, 153, 51)")
	{
		x.style.background = "#363e47";
	}
}
function loadJSON(data, name)
{
	if(data != null)
	{
		var strs = data.split(", ");
		
		for(var i = 0; i < strs.length; i++)
		{
			map.set(strs[i] + "_s", "test");
		}
	}
    var http_request = getHttp_request();
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4 )
        {
            //使用JSON.parse解析JSON数据
            var jsonObj = http_request.responseText;
            $("#record1").empty();
            $("#record2").empty();
            if(jsonObj[0] == "[")
            {
                var obj = eval('(' + jsonObj + ')');
                for( let i of obj)
                {
                    if(i.sign == "1")
                   	{
                    	$("#record1").append("<div class='thread' id = '" + i.aad101 + "_s' " + 
                    						 "onmousemove='onMoveIn(this)' onmouseout='onMoveOut(this)'>" + 
                    						 "<div class='details' onclick='chat(" + i.aad101 + ")'>" + 
                    						 "<div class='user-head online'><img id='" + i.aad101 + "_img' src='"+ i.aab115 +"'></div>" + 
                    	                     "<div class='user-name'>" + i.aab102 +  "</div>" + 
                    	                     "<div class='last-message'><span><font size='3'>" + 
                    	                     "<b>帖子标题：</b></font>" + i.aac102 + "</span></div></div>" + 
                    	                     "<div class='last'>" + 
                    	                     "<font onclick='onDel(" + i.aad101 + ", 1)' class='deleteButton'>删除</font>" + 
                    	                     //"<div id = '" + i.aad101 + "_time'></div>" +
                    	                     "</div></div>");
                   	}
                    if(i.sign == "2")
                   	{
                    	$("#record2").append("<div class='thread' id = '" + i.aad101 + "_s' " + 
                    						 "onmousemove='onMoveIn(this)' onmouseout='onMoveOut(this)'>" + 
                    						 "<div class='details' onclick='chat(" + i.aad101 + ")'>" + 
				       						 "<div class='user-head online'><img id='" + i.aad101 + "_img' src='"+ i.aab115 +"'></div>" + 
				    	                     "<div class='user-name'>" + i.aab102 +  "</div>" + 
				    	                     "<div class='last-message'><span><font size='3'>" +
				    	                     "<b>帖子标题：</b></font>" + i.aac102 + "</span></div></div>" + 
				    	                     "<div class='last'>" + 
				    	                     "<font onclick='onDel(" + i.aad101 + ", 2)' class='deleteButton'>删除</font>" + 
				    	                     //"<div id = '" + i.aad101 + "_time'></div>" +
				    	                     "</div></div>");
                   	}
                }
                for( let i of obj)
                {
                    if(map.get(i.aad101 + "_s") != null)
                   	{
                    	var div = document.getElementById(i.aad101 + "_s");
                    	div.style.background = "#669933";
                    	
                   	}
                }
            }
        }
    }
    
    http_request.open("POST", path + "ChatAjax.jsp", true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send("aab101=" + this_aab101);
}

function onDel(aad101, kind)
{
	var http_request = getHttp_request();
    
    http_request.onreadystatechange = function(){
        if (http_request.readyState == 4 )
        {
        	loadJSON();
        	if(aad101 == chat_id)
        	{
        		colseChatConnect();
        		$("#mainbody").empty();
        	}
        }
    }
    var action = null;
    if(kind == 1)
    {
    	action = "chat_ChatSenderDel.html";
    }
    else
    {
    	action = "chat_ChatAcceptDel.html";
    }
    http_request.open("POST", path + action, true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send("aab102=" + encodeURI(encodeURI(this_aab102)) + "&aad101=" + aad101);
}

function chat(aad101)
{
	if(span_color != null)
	{
		span_color.style.background = "#363e47";
	}
	span_color = document.getElementById(aad101 + "_s");
	span_color.style.background = "#3f4953";
	
	map.delete(aad101 + "_s");

	if(chat_id != null)
	{
		colseChatConnect();
	}
    
    var http_request = getHttp_request();
    
    http_request.onreadystatechange = function(){
    	
        if (http_request.readyState == 4 )
        {
        	$("#mainbody").empty();
        	$("#mainbody").load(path + "chat.jsp");
        	chat_id = aad101;
        	sendMessage_record(aad101);
        	accept_path = $("#" + aad101 + "_img")[0].src;
        }
    }
    http_request.open("POST", path + "chat_ChatFindById.html", true);
    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    http_request.send("aab101=" + this_aab101 + "&aad101=" + aad101);
}

$(function(){
	if(!window.WebSocket){
		alert('你的浏览器不支持WebSocket');
	}else{
		startConnect_record(this_aab101, this_aab102);
	}
});
function startConnect_record(aab101, aab102){
	var url = "ws://localhost:8080/BangBang/record/"+aab101 + "_" + aab102;
	webSocket_record = new WebSocket(url);
	webSocket_record.onerror = function(event) {
		onError(event)
	};
	webSocket_record.onopen = function(event) {
		onOpen(event)
	};
	webSocket_record.onmessage = function(event) {
		onMessage(event)
	};
	webSocket_record.onclose = function(event) {
		onClose(event)
	};
}

function onMessage(event)
{
	loadJSON(event.data);
}
function onOpen(event) {
	$("#allMsg1").append("<p>已连接至服务器</p>");
}
function onError(event) {
	$("#allMsg1").append("<p>连接服务器发生错误</p>");
}
function onClose(event) {
	$("#allMsg1").append("<p>服务器连接已关闭</p>");
}

function sendMessage_record(message){
	if(webSocket_record.readyState != 1){
		startConnect_record(this_aab101, this_aab102);
	}
	webSocket_record.send(message);
}

function LoadPage()
{
	loadJSON();
}
