<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 		uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" 	tagdir="/WEB-INF/tags" %>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">suwon-studio</a>
		</div>
		<!-- dropdown 1 -->
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">	
				<!-- dropdown 1 -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						 <c:if test="${member == null}">
					      <li><a href="/member/login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
					     </c:if>
					     <c:if test="${member != null}">
					      <li><a href="/member/logout" role="button"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
					     <li><a href="/member/memberUpdate" role="button"><span class="glyphicon glyphicon-log-out"></span>회원정보수정</a></li>
					     <li><a href="/product/productinsert" role="button"><span class="glyphicon glyphicon-log-out"></span>제품등록</a></li>
					     </c:if>
					</ul>
				</li>
				
				<!-- dropdown 2 -->
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" 
										href="#">MORE <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a class="glyphicon glyphicon-queen" href="./../wonsu/more01.html">중고용품</a></li>
						<li><a class="glyphicon glyphicon-grain" href="/product/productlist">수제작</a></li>
						<li><a class="glyphicon glyphicon-list" href="/board/list">게시판</a></li>
						<li><a class="glyphicon glyphicon-phone" href="/chat">소통방</a></li>
					</ul>
				</li>
			</ul>
		</div><!-- dropdown end -->		
	</div>
</nav>



















