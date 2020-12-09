<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout2>

	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	border-style: solid;
	margin-top: 5%;
}
</style>
</head>
<body>

	<div class="container">
		<form class="form-horizontal" method="post" action="/member/register">
			<div class="form-group">
				<div class="col-sm-2"></div>
				<div class="col-sm-6">
					<h2 align="left">회원가입</h2>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">아이디</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="userid" name="userid"
						maxlength=16 placeholder="아이디를 입력하세요." />
				</div>
				<div class="col-sm-2">
					<button class="btn btn-warning idCheck" type="button" id="idCheck"
						onclick="dupCheck();" value="N">중복검사</button>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="passwd"
						name="passwd" maxlength="16" placeholder="비밀번호를 입력하세요." />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">이 름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="name" name="name"
						maxlength="16" placeholder="이름을 입력하세요" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Email</label>
				<div class="col-sm-8">
					<input type="email" class="form-control" id="Email" name="Email"
						maxlength="16" placeholder="Email" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">전화번호</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="pnum" name="pnum"
						placeholder="ex) 01077779999">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">주 소</label>
					<input type="text" id="sample6_postcode" name="address" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" name="address" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" name="address" placeholder="주소">
					<input type="text" id="sample6_detailAddress" name="address" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" name="address" placeholder="참고항목">
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">성 별</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="gender" name="gender"
						placeholder="성별">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="btn btn-danger cancel" type="reset">취소</button>
					<button class="btn btn-danger" type="button"
						onclick="HelloScript();">스크립트 테스트</button>
				</div>
			</div>
		</form>
	</div>
	<script src="/js/commonFunciton.js" type=text/javascript></script>

	<script>
		$(document).ready(function() {
			// 취소 버튼이 눌렸을 경우
			$(".cancel").on("click", function() {
				location.href = "/member/login";
			});

			// 회원가입 버튼을 눌렀을 경우 => 입력필드가 비어있는지 검사한다.
			$("#submit").on("click", function() {
				if ($("#userid").val() == "") {
					alert("아이디를 입력하십시오.");
					$("#userid").focus();
					return false;
				}
				if ($("#passwd").val() == "") {
					alert("비밀번호를 입력하십시오.");
					$("#passwd").focus();
					return false;
				}
				if ($("#name").val() == "") {
					alert("이름을 입력하십시오.");
					$("#name").focus();
					return false;
				}
				if ($("#Email").val() == "") {
					alert("Email을 입력하십시오.");
					$("#Email").focus();
					return false;
				}
				if ($("#pnum").val() == "") {
					alert("전화번호을 입력하십시오.");
					$("#pnum").focus();
					return false;
				}
				if ($("#gender").val() == "") {
					alert("성별을 선택하십시오.");
					$("#gender").focus();
					return false;
				}

			});
		})
		// 아이디 중복 검사
		// 입력한 아이디에 해당하는 정보가 있는지 검사하고, 결과값(정수)을 리턴받는다.
		function dupCheck() {
			//alert("중복확인");
			if ($("#userid").val() == "") {
				alert("아이디를 입력하십시오.");
				$("#userid").focus();
				return false;
			}
			$.ajax({
				url : "/member/idCheck",
				type : "post",
				dataType : "json",
				data : {
					"userid" : $("#userid").val()
				},
				success : function(data) {
					//alert("Return Value : " + data);
					if (data == 1) {
						alert("중복된 아이디입니다.");
					} else if (data == 0) {
						$("#idCheck").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	<script src="/js/commonFunciton.js" type=text/javascript></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
	</html>

</layoutTag:layout2>








