<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" 	tagdir="/WEB-INF/tags" %>

<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

<div class="container">
	<form class="form-horizontal" method="post" action="/member/register">
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-6">
				<h2 align="left">회원가입(실시간 아이디 검사)</h2>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">아이디</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="userid" name="userid"
					maxlength=16 placeholder="아이디를 입력하세요."/>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-warning idCheck" type="button" id="idCheck" 
					onclick="dupCheck();" value="N">중복검사</button>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">비밀번호</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="passwd" name="passwd"
					maxlength="16" placeholder="비밀번호를 입력하세요."/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">이  름</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="name" name="name"
					maxlength="16" placeholder="이름을 입력하세요"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-4">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="btn btn-primary signUpBtn" type="submit" disabled="disabled">회원가입(실시간검사)</button>
				<button class="btn btn-danger cancel" type="reset">취소</button>
			</div>
		</div>
				<div class="form-group">
			<label class="control-label col-sm-2">Email</label>
			<div class="col-sm-2">
				<input type="email" class="form-control" id="Email" name="Email"
					maxlength="16" placeholder="Email"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">전화번호</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="pnum" name="pnum" 
				placeholder="ex) 01077779999">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">성 별</label>
			<div class="col-sm-2">
				<label><input type="checkbox" class="form-control" id="gender" name="성별" maxlength="16" />남</label>
				<label><input type="checkbox" class="form-control" id="gender" name="성별" maxlength="16" />여</label>
			</div>
		</div>
		<!-- 메시지 영역 -->
		<div class="from-group">
			<div class="col-sm-offset-2 col-sm-10">
				<label><input type="radio" class="form-control msg" name="msg" id="msg" disabled="disabled" placeholder="Message"/>남자</label>
				<label><input type="radio" class="form-control msg" name="msg" id="msg" disabled="disabled" placeholder="Message"/>여자</label>
			</div>
			<div id="msg2"></div>
		</div>
	</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	// 취소 버튼
	$(".cancel").on("click", function() {
		location.href = "/member/login";
	});

	// 아이디 입력란에 글자를 입력하는 순간 실시간으로 사용 가능한 아이디 인지 검사한다.
	$("#userid").on("input", function() {
		// 입력받은 아이디 값을 변수에 저장한다.
		var inputID = $("#userid").val();

		$.ajax({
			url:		"/member/idCheck",
			type:		"post",
			dataType:	"json",
			data:		{"userid" : $("#userid").val()},
			success:	function(data) {
				if(inputID == "" && data == '0') {
					$(".singUpBtn").prop("disabled", true);
					$(".signUpBtn").css("background-color", "#AAAAAA");
					$("#idCheck").css("background-color", "#FFCECE");
					document.getElementById("msg2").innerHTML = "아이디를 입력하십시요";
					document.getElementById("msg").value = "아이디를 입력하십시요";
				} else if(inputID != "" && inputID.length < 4) {
					$(".singUpBtn").prop("disabled", true);
					$(".signUpBtn").css("background-color", "#AAAAAA");
					$("#idCheck").css("background-color", "#FF22FF");
					document.getElementById("msg2").innerHTML = "아이디는 최소 4자리 이상이어야 합니다.";
					document.getElementById("msg").value = "아이디는 최소 4자리 이상이어야 합니다.";
				} else if(inputID != "" && inputID.length >= 4 && data == '0') {
					$(".singUpBtn").prop("disabled", false);
					$(".signUpBtn").css("background-color", "#4CAF50");
					$("#idCheck").css("background-color", "#B0F6AC");
					$("#msg").css("background-color", "#B0F6AC");
					document.getElementById("msg2").innerHTML = "사용 가능한 아이디입니다.";
					document.getElementById("msg").value = "사용 가능한 아이디입니다.";
				} else if(data = '1') {
					$(".singUpBtn").prop("disabled", true);
					$(".signUpBtn").css("background-color", "#AAAAAA");
					$("#idCheck").css("background-color", "#FFCECE");
					$("#msg").css("background-color", "#FFCECE");
					document.getElementById("msg2").innerHTML = "이미 사용 중인 아이디입니다.";
					document.getElementById("msg").value = "이미 사용 중인 아이디입니다.";
				}
			}
		});
	});


	
})
</script>

</body>
</html>

</layoutTag:layout>











