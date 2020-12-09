<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>

<layoutTag:layout>

	<!DOCTYPE html>
	<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록 보기</title>
<style>
.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus,
	.navbar-inverse .navbar-nav>.active>a:hover {
	color: rgb(255, 255, 255);
	background-color: red
}

div#paginationBox {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.search {
	margin-left: 60%
}
</style>
</head>
<body>

	<div class="container">

		<h2>판매 제품 목록</h2>

		<button class="btn btn-primary" id="inserting"
			onclick="location.href='/board/insert'">글쓰기</button>

		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th>No</th>
					<th>Subject</th>
					<th>Content</th>
					<th>Writer</th>
					<th>Date</th>
				</tr>
			</thead>
			<c:forEach var="board" items="${list}">
				<tr>
					<td class="info"
						onclick="location.href='/board/detail/${board.bno}'">${board.bno}</td>
					<td>${board.subject}</td>
					<td>${board.content}</td>
					<td>${board.writer}</td>
					<td><fmt:formatDate value="${board.reg_date}"
							pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" /></td>
				</tr>
			</c:forEach>
		</table>
		


		<!-- pagination{s} -->
		<div id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination.prev}">

					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>

				</c:if>
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">

					<li
						class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
						class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
							${idx} </a></li>

				</c:forEach>

				<c:if test="${pagination.next}">

					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.range}','${pagination.range}', '${pagination.rangeSize}')">Next</a></li>

				</c:if>

			</ul>

		</div>
	</div>
	<script>
		//이전 버튼 이벤트

		function fn_prev(page, range, rangeSize) {

			var page = ((range - 2) * rangeSize) + 1;

			var range = range - 1;

			var url = "${pageContext.request.contextPath}/board/list";

			url = url + "?page=" + page;

			url = url + "&range=" + range;

			location.href = url;

		}

		//페이지 번호 클릭

		function fn_pagination(page, range, rangeSize, searchType, keyword) {

			var url = "${pageContext.request.contextPath}/board/list";

			url = url + "?page=" + page;

			url = url + "&range=" + range;

			location.href = url;

		}

		//다음 버튼 이벤트

		function fn_next(page, range, rangeSize) {

			var page = parseInt((range * rangeSize)) + 1;

			var range = parseInt(range) + 1;

			var url = "${pageContext.request.contextPath}/board/list";

			url = url + "?page=" + page;

			url = url + "&range=" + range;

			location.href = url;

		}
	</script>

</body>
	</html>
</layoutTag:layout>

<!-- layoutTag를 적용하므로 bootstrap.jsp 파일이 필요 없어졌다. -->
<%--== : eq
!= : ne
< : lt
> : gt
<= : le
>= : ge --%>


















