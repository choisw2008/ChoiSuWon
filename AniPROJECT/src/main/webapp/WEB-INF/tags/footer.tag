<%@ tag language="java" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.cal_top {
	text-align: center;
	font-size: 30px;
}

.cal {
	text-align: center;
}

table.calendar {
	border: 1px solid black;
	display: inline-table;
	text-align: left;
}

table.calendar td {
	vertical-align: top;
	border: 1px solid skyblue;
	width: 100px;
}

a {
	color: #000000;
	text-decoration: none;
}

.scriptCalendar {
	text-align: center;
}

.scriptCalendar>thead>tr>td {
	width: 500px;
	height: 100px;
}

.scriptCalendar>thead>tr:first-child>td {
	font-weight: bold;
}

.scriptCalendar>thead>tr:last-child>td {
	background-color: #000000;
}

.scriptCalendar>tbody>tr>td {
	width: 50px;
	height: 50px;
}
</style>
<!-- Container (Contact Section) -->
<div id="contact" class="container">
	<br>
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home">Mike</a></li>
		<li><a data-toggle="tab" href="#menu1">Chandler</a></li>
		<li><a data-toggle="tab" href="#menu2">Peter</a></li>
	</ul>
	<!-- 하단 탭창 메뉴창 -->
	<div class="tab-content">
		<div id="home" class="tab-pane fade in active">
			<h2>Ask a question to, Manager</h2>
			<p>사장에게 궁금한걸 물어보세요.</p>
			<p>
				<span class="glyphicon glyphicon-map-marker"></span>사장 Korea, 서울
			</p>
			<p>
				<span class="glyphicon glyphicon-phone"></span>Phone: +00 1515151515
			</p>
			<p>
				<span class="glyphicon glyphicon-envelope"></span>Email:
				choisw2008@naver.com
			</p>
		</div>
		<!-- Chandler -->
		<div id="menu1" class="tab-pane fade">
			<h2>Chandler Bing, Guitarist</h2>
			<p>Check the current date and confirm what to buy</p>
			
		<!-- 캘린더  jsp-->

			<table class="scriptCalendar">
				<thead>
					<tr>
						<td onClick="prevCalendar();" style="cursor: pointer;">&#60;&#60;</td>
						<td colspan="5"><span id="calYear">YYYY</span>년 <span
							id="calMonth">MM</span>월</td>
						<td onClick="nextCalendar();" style="cursor: pointer;">&#62;&#62;</td>
					</tr>
					<tr>
						<td>일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<script type="text/javascript">
				document.addEventListener("DOMContentLoaded", function() {
					buildCalendar();
				});

				var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
				var date = new Date(); // @param 전역 변수, today의 Date를 세어주는 역할

				/**
				 * @brief   이전달 버튼 클릭
				 */
				function prevCalendar() {
					this.today = new Date(today.getFullYear(),
							today.getMonth() - 1, today.getDate());
					buildCalendar(); // @param 전월 캘린더 출력 요청
				}

				/**
				 * @brief   다음달 버튼 클릭
				 */
				function nextCalendar() {
					this.today = new Date(today.getFullYear(),
							today.getMonth() + 1, today.getDate());
					buildCalendar(); // @param 명월 캘린더 출력 요청
				}

				/**
				 * @brief   캘린더 오픈
				 * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
				 */
				function buildCalendar() {

					let doMonth = new Date(today.getFullYear(), today
							.getMonth(), 1);
					let lastDate = new Date(today.getFullYear(), today
							.getMonth() + 1, 0);

					let tbCalendar = document
							.querySelector(".scriptCalendar > tbody");

					document.getElementById("calYear").innerText = today
							.getFullYear(); // @param YYYY월
					document.getElementById("calMonth").innerText = autoLeftPad(
							(today.getMonth() + 1), 2); // @param MM월

					// @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
					while (tbCalendar.rows.length > 0) {
						tbCalendar.deleteRow(tbCalendar.rows.length - 1);
					}

					// @param 첫번째 개행
					let row = tbCalendar.insertRow();

					// @param 날짜가 표기될 열의 증가값
					let dom = 1;

					// @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
					//               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
					let daysLength = (Math.ceil((doMonth.getDay() + lastDate
							.getDate()) / 7) * 7)
							- doMonth.getDay();

					// @param 달력 출력

					// @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
					for (let day = 1 - doMonth.getDay(); daysLength >= day; day++) {

						let column = row.insertCell();

						// @param 평일( 전월일과 익월일의 데이터 제외 )
						if (Math.sign(day) == 1 && lastDate.getDate() >= day) {

							// @param 평일 날짜 데이터 삽입

							column.innerText = autoLeftPad(day, 2);

							// @param 일요일인 경우
							if (dom % 7 == 1) {
								column.style.color = "#FF4D4D";
							}

							// @param 토요일인 경우
							if (dom % 7 == 0) {
								column.style.color = "#4D4DFF";
								row = tbCalendar.insertRow(); // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
							}

						}

						// @param 평일 전월일과 익월일의 데이터 날짜변경
						else {
							let exceptDay = new Date(doMonth.getFullYear(),
									doMonth.getMonth(), day);
							column.innerText = autoLeftPad(exceptDay.getDate(),
									2);
							column.style.color = "#A9A9A9";
						}

						// @brief   전월, 명월 음영처리
						// @details 현재년과 선택 년도가 같은경우
						if (today.getFullYear() == date.getFullYear()) {

							// @details 현재월과 선택월이 같은경우
							if (today.getMonth() == date.getMonth()) {

								// @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
								if (date.getDate() > day && Math.sign(day) == 1) {
									column.style.backgroundColor = "#E5E5E5";
								}

								// @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
								else if (date.getDate() < day
										&& lastDate.getDate() >= day) {
									column.style.backgroundColor = "#FFFFFF";
									column.style.cursor = "pointer";
									column.onclick = function() {
										calendarChoiceDay(this);
									}
								}

								// @details 현재일인 경우
								else if (date.getDate() == day) {
									column.style.backgroundColor = "#FFFFE6";
									column.style.cursor = "pointer";
									column.onclick = function() {
										calendarChoiceDay(this);
									}
								}

								// @details 현재월보다 이전인경우
							} else if (today.getMonth() < date.getMonth()) {
								if (Math.sign(day) == 1
										&& day <= lastDate.getDate()) {
									column.style.backgroundColor = "#E5E5E5";
								}
							}

							// @details 현재월보다 이후인경우
							else {
								if (Math.sign(day) == 1
										&& day <= lastDate.getDate()) {
									column.style.backgroundColor = "#FFFFFF";
									column.style.cursor = "pointer";
									column.onclick = function() {
										calendarChoiceDay(this);
									}
								}
							}
						}

						// @details 선택한년도가 현재년도보다 작은경우
						else if (today.getFullYear() < date.getFullYear()) {
							if (Math.sign(day) == 1
									&& day <= lastDate.getDate()) {
								column.style.backgroundColor = "#E5E5E5";
							}
						}

						// @details 선택한년도가 현재년도보다 큰경우
						else {
							if (Math.sign(day) == 1
									&& day <= lastDate.getDate()) {
								column.style.backgroundColor = "#FFFFFF";
								column.style.cursor = "pointer";
								column.onclick = function() {
									calendarChoiceDay(this);
								}
							}
						}

						dom++;

					}
				}

				/**
				 * @brief   날짜 선택
				 * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
				 */
				function calendarChoiceDay(column) {

					// @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
					if (document.getElementsByClassName("choiceDay")[0]) {
						document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#FFFFFF";
						document.getElementsByClassName("choiceDay")[0].classList
								.remove("choiceDay");
					}

					// @param 선택일 체크 표시
					column.style.backgroundColor = "#FF9999";

					// @param 선택일 클래스명 변경

					column.classList.add("choiceDay");
				}

				/**
				 * @brief   숫자 두자릿수( 00 ) 변경
				 * @details 자릿수가 한지라인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
				 * @param   num     앞에 0을 붙일 숫자 값
				 * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
				 */
				function autoLeftPad(num, digit) {
					if (String(num).length < digit) {
						num = new Array(digit - String(num).length + 1)
								.join("0")
								+ num;
					}
					return num;

				}
			</script>
		</div>
		<!-- 캘린더  jsp end-->

		<div id="menu2" class="tab-pane fade">
			<h2>Peter Griffin, Bass player</h2>
			<p>I mean, sometimes I enjoy the show, but other times I enjoy
				other things.</p>
		</div>
	</div>
</div>


<footer class="text-center">
	<a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
		<span class="glyphicon glyphicon-chevron-up"></span>
	</a><br>
	<br>
	<p>
		SUWON -Blog By <a href="https://blog.naver.com/choisw2008"
			data-toggle="tooltip" title="Visit w3schools">https://blog.naver.com/choisw2008</a>
	</p>
	<p>
		SUWON -GitHub By <a href="https://github.com/choisw2008/AniMultiply"
			data-toggle="tooltip" title="Visit w3schools">https://github.com/choisw2008/AniMultiply</a>
	</p>
</footer>

<script>
	$(document).ready(function() {
		// Initialize Tooltip
		$('[data-toggle="tooltip"]').tooltip();

		// Add smooth scrolling to all links in navbar + footer link
		$(".navbar a, footer a[href='#myPage']").on('click', function(event) {

			// Make sure this.hash has a value before overriding default behavior
			if (this.hash !== "") {

				// Prevent default anchor click behavior
				event.preventDefault();

				// Store hash
				var hash = this.hash;

				// Using jQuery's animate() method to add smooth page scroll
				// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
				$('html, body').animate({
					scrollTop : $(hash).offset().top
				}, 900, function() {

					// Add hash (#) to URL when done scrolling (default click behavior)
					window.location.hash = hash;
				});
			} // End if
		});
	})
</script>


