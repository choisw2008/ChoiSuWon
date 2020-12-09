<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>

	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>

	<div class="container">
		<h2>게시글 작성</h2>
		<form class="form-horizontal" action="/board/insertProc" method="post"
			enctype="multipart/form-data">

			<div class="form-group">
				<label for="subject">제 목</label> <input type="text"
					class="form-control" id="subject" name="subject"
					placeholder="제목을 입력하십시오." />
			</div>
			<div class="form-group">
				<label for="subject">작성자</label> <input type="text"
					class="form-control" id="writer" name="writer"
					placeholder="작성자를 입력하십시오." />
			</div>
			<div class="form-group">
				<label for="content">내 용</label>
				<textarea rows="4" cols="100" class="form-control" id="content"
					name="content" placeholder="게시글을 작성하십시오."></textarea>
			</div>
			
			<!-- 비로그인 접속 제한 설정 -->
			<input type="file" name="files">
			<c:if test="${member != null}">
				<button id="inserting" type="submit" class="btn btn-primary">작성</button>
			</c:if>
		</form>
		<c:if test="${member == null}">
			<button id="insert" class="btn btn-primary" onclick="button1_click()">작성</button>
		</c:if>

	</div>

	<script>
		function button1_click() {
			alert("로그인 해주세요");
		}
	</script>

</body>


</body>
	</html>
</layoutTag:layout>
<!-- layoutTag를 적용하므로 bootstrap.jsp 파일이 필요 업어졌다. -->


















