<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 정보</title>
<style>
#list1 {
	float: left;
	margin: 20px;
}
#Comment{
	margin-top: 20px;
}
</style>
</head>
<body>

	<div class="container">
		<h2>게시글 상세 정보</h2>

		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>첨부파일</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tr>
				<td>${detail.subject}</td>
				<td>${detail.writer}</td>
				<td><a href="/board/fileDown/${files.bno}">${files.fileOriName}</a></td>
				<td>"${detail.reg_date}</td>
			</tr>
		</table>
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>내용</th>
					<th width="65">조회수</th>
				</tr>
			</thead>

			<tr>
				<td>${detail.content}<td>
			</tr>
		</table>
		
		<c:if test = "${member != null}">
		<button type="submit" class="btn btn-primary"
			onclick="location.href='/board/detailComment/${detail.bno}'">댓글</button>
		<button class="btn btn-warning"
			onclick="location.href='/board/update/${detail.bno}'">수정</button>
		<button class="btn btn-danger"
			onclick="location.href='/board/delete/${detail.bno}'">삭제</button>
		</c:if>
		<c:if test = "${member == null}">
		<button type="submit" class="btn btn-primary"
			onclick="button1_click()">댓글</button>
		<button class="btn btn-warning"
			onclick="button1_click()">수정</button>
		<button class="btn btn-danger"
			onclick="button1_click()">삭제</button>
		</c:if>
		
	</div>
	<!-- 저장된 댓글을 보여주는 영역 -->
	<div class="container" id="Comment">
		<div class="commentList"></div>
	</div>

<!-- 댓글 목록 -->
<%@ include file="commentAction.jsp" %>

<script>
function button1_click() {
	alert("로그인 해주세요");
}
</script>

</body>
</html>
</layoutTag:layout>
<!-- layoutTag를 적용하므로 bootstrap.jsp 파일이 필요 업어졌다. -->


































