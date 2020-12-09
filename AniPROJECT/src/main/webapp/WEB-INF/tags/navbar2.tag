<%@ tag language="java" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-targer="#MyMenu">
				<span class="sr-only">Toggle Menu</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/board/list">HOME</a>
		</div>
		<!-- 실질적인 메뉴를 나열한다. -->
		<div class="collapse navbar-collapse" id="MyMenu">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시글 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/board/list">게시글 목록</a></li>
						<li><a href="/board/listDate">게시글 목록(Date Picker)</a></li>
						<li class="divider"></li>
						<li><a href="/board/insert">게시글 등록</a></li>
						<li><a href="#">Exit</a></li>
					</ul>
				</li>
				
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					 회원 관리 <span class="caret"></span></a>
					 <ul class="dropdown-menu">
					 	<li><a href="${path}/member/login.do">로그인 (Session)</a></li>
					 	<li><a href="${path}/member/logout.do">로그아웃 (Session)</a></li>

						<li class="dropdown-submenu">
							<a class="dropdown-toggle" data-toggle="dropdown" href="4">
					 				서브메뉴 <span class="caret"></span></a>
					 			<ul class="dropdown-menu">
									<li>SubMenu 1</li>
									<li>SubMenu 2</li>
									<li>SubMenu 3</li>
									<li>SubMenu 4</li>
							 	</ul>
					 	</li>
					 
					 </ul>
				</li>
			</ul>
			
			
			<ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
              <li><a href="#">DropDown</a></li>
              <li><a href="#">DropDown Multi Level</a></li>
              <li class="divider"></li>
              <li class="dropdown-submenu">
                <a tabindex="-1" href="#">Hover me for more options</a>
                <ul class="dropdown-menu">
                  <li><a tabindex="-1" href="#">Second level</a></li>
                  <li class="dropdown-submenu">
                    <a href="#">Even More..</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">3rd level</a></li>
                        <li><a href="#">3rd level</a></li>
                    </ul>
                  </li>
                  <li><a href="#">Second level</a></li>
                  <li><a href="#">Second level</a></li>
                </ul>
              </li>
            </ul>
			
		</div>
	</div>

</nav>


















