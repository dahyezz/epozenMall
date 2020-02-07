<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EPOZEN mall chatting</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- WebSocket -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	//enter 입력 시 send
	$('#chatSend').keydown(function(key) {
		if (key.keyCode == 13) {
			sendChat();
		}
	});
	connect();
});
var stompClient = null;

function setConnected(connected) {
	$("#connect").prop("disabled", connected);
	$("#disconnect").prop("disabled", !connected);
	if (connected) {
		$("#conversation").show();
	} else {
		$("#conversation").hide();
	}
	$("#greetings").html("");
}

function connect() {
	var socket = new SockJS('/websocket');
	stompClient = Stomp.over(socket); //1. SockJS를 내부에 들고 있는 client를 내어준다.

	// SockJS와 stomp client를 통해 연결을 시도.
	stompClient.connect({}, function(frame) {
		setConnected(true);
		console.log('Connected: ' + frame);
		stompClient.subscribe('/topic/chat', function(chat) {
			showChat(JSON.parse(chat.body));
		});
	});
}

// function disconnect() {
// 	if (stompClient !== null) {
// 		stompClient.disconnect();
// 	}
// 	setConnected(false);
// 	console.log("Disconnected");
// }

// function showGreeting(message) {
// 	$("#greetings").append("<tr><td>" + message + "</td></tr>");
// }

$(function() {
	$("form").on('submit', function(e) {
		e.preventDefault();
	});
// 	$("#connect").click(function() {
// 		connect();
// 	});
// 	$("#disconnect").click(function() {
// 		disconnect();
// 	});

	$("#chatSend").click(function() {
		sendChat();
	}); 
});

/* Chat과 관련된 메서드 추가 */
function sendChat() {
	stompClient.send("/app/chat", {}, JSON.stringify({
		'name' : $("#name").val(),
		'message' : $("#chatMessage").val()
	}));
	$('#chatMessage').val('');
}
function showChat(chat) {
	$("#greetings").append(
			"<tr><td>" + chat.name + " : " + chat.message + "</td></tr>");
}
</script>

</head>
<body>
	<div id="main-content" class="container">
		<div class="row">
<!-- 			<div class="col-md-6"> -->
<!-- 				<form class="form-inline"> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label for="connect">WebSocket connection:</label> -->
<!-- 						<button id="connect" class="btn btn-default" type="submit">Connect</button> -->
<!-- 						<button id="disconnect" class="btn btn-default" type="submit" -->
<!-- 							disabled="disabled">Disconnect</button> -->
<!-- 					</div> -->
<!-- 				</form> -->
<!-- 			</div> -->
			<div class="col-md-12">
				<table id="conversation" class="table table-striped">
					<thead>
						<tr>
							<th>채팅창</th>
						</tr>
					</thead>
					<tbody id="greetings">
					</tbody>
				</table>
			</div>
			<div class="col-md-6">
				<form class="form-inline">
					<div class="form-group">
						<label for="name"></label>
						<!-- 	          <input type="text" id="name" class="form-control"  /> -->
						<p>
						<c:if test="${login }">${userId }<input type="hidden" id="name" value="${userId }"/></c:if>
						<c:if test="${empty login }">비회원<input type="hidden" id="name" value="비회원"/></c:if>
						</p>
						<label for="message"></label> 
						<input type="text" id="chatMessage" class="form-control" />
					</div>
					<button id="chatSend" class="btn btn-default" type="submit">전송</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>