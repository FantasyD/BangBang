<%@ page language = "java" contentType = "text/html; charset = GBK"
    pageEncoding = "GBK"%>
<!DOCTYPE>
<html>
${chat_ins }
	<head>
		<title>chat_insertere</title>
		<style type="text/css">
	        .talk_con{
	            width:600px;
	            height:500px;
	            border:1px solid #666;
	            margin:50px auto 0;
	            background:#f9f9f9;
	        }
	        .talk_show{
	            width:580px;
	            height:420px;
	            border:1px solid #666;
	            background:#fff;
	            margin:10px auto 0;
	            overflow:auto;
	        }
	        .talk_input{
	            width:580px;
	            margin:10px auto 0;
	        }
	        .atalk{
	           margin:10px; 
	        }
	        .atalk span{
	            display:inline-block;
	            background:#0181cc;
	            border-radius:10px;
	            color:#fff;
	            padding:5px 10px;
	        }
	        .btalk{
	            margin:10px;
	            text-align:right;
	        }
	        .btalk span{
	            display:inline-block;
	            background:#ef8201;
	            border-radius:10px;
	            color:#fff;
	            padding:5px 10px;
	        }
	    </style>
		<script type="text/javascript" src="https://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">
			var webSocket = null;
			var id = "${chat_ins.aab101 }";
			var id_1 = "${chat_ins.maab101 }";
			var tie_id = "${chat_ins.aac101 }";
			var chat_id = "${chat_ins.aad101 }";
			if(id == id_1)
			{
				var sender = "${chat_ins.maab102 }" + "." + tie_id;
				var accept = "${chat_ins.naab102 }" + "." + tie_id;
			}
			else
			{
				var accept = "${chat_ins.maab102 }" + "." + tie_id;
				var sender = "${chat_ins.naab102 }" + "." + tie_id;
			}
			
			$(function(){
				if(!window.WebSocket){
					alert('你的浏览器不支持WebSocket');
				}else if(id==""||id_1==""||tie_id==""||chat_id==""){
					alert("信息不足！");
				}else{
					startConnect();
				}
			});
			function getAccept(){
				return accept.substring(0, accept.indexOf("."));
			}
			function startConnect(){
				//记住 是ws开关
				var url = "ws://localhost:8080/BangBang/chat/"+sender + "-" + accept + "*" + chat_id;
				webSocket = new WebSocket(url);
				webSocket.onerror = function(event) {
					onError(event)
				};
				webSocket.onopen = function(event) {
					onOpen(event)
				};
				webSocket.onmessage = function(event) {
					onMessage(event)
				};
			}
			function colseChatConnect(){
				$("#allMsg").empty();
				webSocket.close();
			}
			function onMessage(event) {
				var str = event.data;
				var index = str.indexOf(":");
				if(index != -1)
				{
					var msg = str.substring(index + 1);
					str = str.substring(0, index);
					if(str == sender)
					{
						$("#allMsg").append("<div class=\"btalk\"><span>" + msg + " " + sender.substring(0, sender.indexOf(".")) + "</span></div>");
					}
					else
					{
						$("#allMsg").append("<div class=\"atalk\"><span>" + accept.substring(0, accept.indexOf(".")) + " " + msg + "</span></div>");
					}
				}
				else
				{
					loadJSON(event.data, sender);
				}
			}
			function onOpen(event) {
				$("#allMsg").append("<p>已连接至服务器</p>");
			}
			function onError(event) {
				$("#allMsg").append("<p>连接服务器发生错误</p>");
			}
			function sendMessage(){
				if(webSocket.readyState != 1){
					startConnect();
				}
				var msg = $("#msg").val();
				if(msg == null || msg == "")
				{
					alert("请输入聊天信息！");
				}
				else
				{
					webSocket.send(sender + ":" + $("#msg").val());
					$("#msg").val("");
				}
			}
		</script>
	</head>
	<body>
    		<div class="talk_con">
        <div class="talk_show" id="allMsg">
        </div>
        <div class="talk_input">
			<input type="text" id="msg"/>
			<input type="button" value="发送" onclick="sendMessage()"/>
        </div>
    </div>
    
</body>
</html>