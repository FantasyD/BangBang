<%@ page language = "java" contentType = "text/html; charset = GBK"
    pageEncoding = "GBK"%>
<!DOCTYPE>
<html>
	<head>
		<title>chat_insertere</title>
		<script type="text/javascript" src="https://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">
			var webSocket = null;
			var id = "${chat_ins.aab101 }";
			var id_1 = "${chat_ins.maab101 }";
			var tie_id = "${chat_ins.aac101 }";
			var chat_id = "${chat_ins.aad101 }";
        	$("#accept_img").attr("src", accept_path);
			if(id == id_1)
			{
				var sender = "${chat_ins.maab102 }" + "." + tie_id;
				var accept = "${chat_ins.naab102 }" + "." + tie_id;
				$("#accept").text("${chat_ins.naab102 }");
			}
			else
			{
				var accept = "${chat_ins.maab102 }" + "." + tie_id;
				var sender = "${chat_ins.naab102 }" + "." + tie_id;
				$("#accept").text("${chat_ins.maab102 }");
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

					var index1 = str.lastIndexOf("_");
					var name = str.substring(0, index);
					var msg = str.substring(index + 1, index1);
					var time = str.substring(index1 + 1);
					if(name == sender)
					{
						$("#allMsg").append("<div class='date-split'>" + time + "</div>" + 
											"<div class='message fromme'><div class='user-head'><img src='" + sender_path + "'></div>" +
											"<div class='content'>" + msg + "</div></div>");
					}
					else
					{
						$("#allMsg").append("<div class='date-split'>" + time + "</div>" + 
											"<div class='message'><div class='user-head'><img src='" + accept_path + "'></div>" +
											"<div class='content'>" + msg + "</div></div>");
					}
					var div = document.getElementById('allMsg');
					div.scrollTop = div.scrollHeight;
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
					webSocket.send(sender + ":" + $("#msg").val() + "_" + formatDate());
					$("#msg").val("");
				}
			}
			
			function formatDate(){
				var date = new Date();

				var year = date.getFullYear(),
					month = date.getMonth() + 1,//月份是从0开始的
					day = date.getDate(),
					hour = date.getHours(),
					min = date.getMinutes(),
					sec = date.getSeconds();
				var newTime = year + '-' +
							month + '-' +
							day + ' ' +
							hour + ':' +
							min + ':' +
							sec;
				return newTime;			
			}
		</script>
	</head>
<body>
    
    <div class="top-bar">
        <div class="user-info">
          <div class="user-head">
          	<img id="accept_img" src="">
          </div>
          <span class="name" id = "accept"></span>
        </div>
      </div>
      
      <div class="messages" id="allMsg"></div>
      
      <div class="bottom-bar">
        <textarea class="msg-input" id="msg" placeholder="输入您的信息"></textarea>
        <div class="send-button" onclick="sendMessage()">
          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
               viewBox="0 0 512.076 512.076" style="enable-background:new 0 0 512.076 512.076;" xml:space="preserve">
            <g>
              <path d="M509.532,34.999c-2.292-2.233-5.678-2.924-8.658-1.764L5.213,225.734c-2.946,1.144-4.967,3.883-5.192,7.034
                       c-0.225,3.151,1.386,6.149,4.138,7.7l102.719,57.875l35.651,174.259c0.222,1.232,0.723,2.379,1.442,3.364
                       c0.072,0.099,0.131,0.175,0.191,0.251c1.256,1.571,3.037,2.668,5.113,3c0.265,0.042,0.531,0.072,0.795,0.088
                       c0.171,0.011,0.341,0.016,0.511,0.016c1.559,0,3.036-0.445,4.295-1.228c0.426-0.264,0.831-0.569,1.207-0.915
                       c0.117-0.108,0.219-0.205,0.318-0.306l77.323-77.52c3.186-3.195,3.18-8.369-0.015-11.555c-3.198-3.188-8.368-3.18-11.555,0.015
                       l-60.739,60.894l13.124-112.394l185.495,101.814c1.868,1.02,3.944,1.239,5.846,0.78c0.209-0.051,0.4-0.105,0.589-0.166
                       c1.878-0.609,3.526-1.877,4.574-3.697c0.053-0.094,0.1-0.179,0.146-0.264c0.212-0.404,0.382-0.8,0.517-1.202L511.521,43.608
                       C512.6,40.596,511.824,37.23,509.532,34.999z M27.232,234.712L432.364,77.371l-318.521,206.14L27.232,234.712z M162.72,316.936
                       c-0.764,0.613-1.429,1.374-1.949,2.267c-0.068,0.117-0.132,0.235-0.194,0.354c-0.496,0.959-0.784,1.972-0.879,2.986L148.365,419.6
                       l-25.107-122.718l275.105-178.042L162.72,316.936z M359.507,419.195l-177.284-97.307L485.928,66.574L359.507,419.195z"/>
            </g>
          </svg>
        </div>
      </div>
</body>
</html>