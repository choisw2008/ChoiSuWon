<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" 				   prefix="layoutTag" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<layoutTag:layout>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글을 달 수 있는 상세정보 화면</title>
</head>
<body>

<div class="container">
	<div class="col-xs-12" style="margin:15px auto;">
		<label style="font-size:24px;"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;게시글 상세 정보</label>
	</div>
	<div class="col-xs-12">
		<form action="/board/insertProc" method="post">
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
		</form>
		<div class="btn-group btn-group-sm" role="group" style="float:right;">
			<button type="button" class="btn btn-info"    onclick="location.href='/board/delete/${detail.bno}'">삭제</button>
			<button type="button" class="btn btn-success" onclick="location.href='/board/update/${detail.bno}'">수정</button>
			<button type="button" class="btn btn-danger " onclick="location.href='/board/list'">목록</button>
		</div>
	</div>
	
	<!-- 댓글을 입력하는 영역 -->
	<div class="container">
		<label for="comment">댓글</label>
		<form name="commentInsertForm">
			<div class="input-group">
				<input type="hidden" name="bno" value="${detail.bno}"/>
				<input type="text" class="form-control" id="content" name="content" placeholder="댓글을 입력하십시오"/>
				<span class="input-group-btn">
					<button class="btn btn-warning" type="button" name="commentInsertBtn">등록</button>
				</span>
			</div>
		</form>
	</div>
	
	<!-- 저장된 댓글을 보여주는 영역 -->
	<div class="container">
		<div class="commentList"></div>
	</div>
	

</div>

<!-- 댓글 목록 -->
<%@ include file="commentAction.jsp" %>

</body>

</html>

</layoutTag:layout>





























