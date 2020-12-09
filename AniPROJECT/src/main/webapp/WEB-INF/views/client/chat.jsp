<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  	<title>Chat</title>
	
	<style>
		#chat{
			margin-top: 15%;
		}
	</style>
</head>
<body>
<div class="container" id="chat">
	<table>
		<tr>
			<td colspan="2"><input type="text" id="username"
				placeholder="Username" />
				<button type="button" onclick="connect();">Connect</button></td>
		</tr>
		<tr>
			<td><textarea readonly="true" rows="10" cols="80" id="log"></textarea>
			</td>
		</tr>
		<tr>
			<td><input type="text" size="51" id="msg" placeholder="Message" />
				<button type="button" onclick="send();">Send</button></td>
		</tr>
	</table>
</div>
</body>
</layoutTag:layout>
<script >
var ws;
function connect() {
    var username = document.getElementById("username").value;
    
    var host = document.location.host;
    var pathname = document.location.pathname;
    
    ws = new WebSocket("ws://" +"localhost:8077"+"/websocket" + "/"+username);
    ws.onmessage = function(event) {
    var log = document.getElementById("log");
        console.log(event.data);
        log.innerHTML += event.data + "\n";
    };
}
function send() {
    var content = document.getElementById("msg").value;
    
    ws.send(content);
}
</script>



</html>