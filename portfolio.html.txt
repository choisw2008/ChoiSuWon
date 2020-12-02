<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 <script src='https://kit.fontawesome.com/a076d05399.js'></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
@font-face {
    font-family: 'Sucrose Bold Two';
    src: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/sucrose.woff2") format('woff2');
    }
@font-face {
    font-family: 'IM Fell French Canon Pro';
    src: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/im-fell-french-canon-pro.woff2") format('woff2');
   
}
* {
  box-sizing: border-box;
}
body {
  margin: 0;
}
header { 
  background:url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/mountain-range.jpg") no-repeat;
  padding-top: 61.93333333%;
  background-size: cover;
  font-family: 'Sucrose Bold Two';
}
header img {
  position: absolute;
  top: 0;
  right: 0;
  width: 45.8%;
}
header h1 { 
  position: fixed;
  top: 2rem;
  right: 2rem;
  font-size: 8vw;
  line-height: .8;
  margin-top: 0;
  text-align: center;
}
header h1 span {
  display: block;
  font-size: 7.00vw;
}
main { 
  background: #fff;
  position: relative;
  border: 1px solid #fff;
  font-family: 'IM Fell French Canon Pro';
  font-size: 1.2rem;
  padding: 2rem 0%;
  line-height: 1.6;
  text-align: center;
  
}
main h2{
	margin-top: 10%;
	font-size: 50px;
	text-align: center;
}
@media all and (max-width: 400px) {
  main { padding: 2rem; }
}

.prop{
  width:320px;
  background-color: #3091ff;
  position: relative;
  animation-name: example;
  border-radius:110px;
  animation-duration: 4s;
  margin-left: 40%;
}

@keyframes example {
  0%   {top:0px;}
  25%  {top:0px;}
  50%  {top:px;}
  75%  {top:30px;}
  100% {top:0px;}
}
.prop2{
	background-color:  #9966ff;
	margin-top: 5%;
}
footer{ 
	background-color: #9966ff;
	text-align: center;
	font-size: 20px;
}
footer p{
	color: #fff;
}
</style>
</head>
<header>
  
  <h1>웹 개발 <span><br>포 트</span><br> 폴리오</h1>
  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/mountain-range-front.png">
</header>
<body>
<main>
	<h2>웹 개발자</h2>
	<p>저는 코딩을 이용한 웹개발과 디자인을 좋아합니다. 그리고 제가 하는일에 책임감과 애정을 느끼고 있습니다.</p><br><br>
	
	<div class="prop">
		<img class="rounded-circle" src="/static/images/프로필3.jpg" alt="프로필" width="300px;">
	</div><br><br>
	
	<div class="prop2">
		<img alt="간단한 소개" src="/static/images/prop.png">
	</div>
	
</main>
<footer>
	<br><i class="fab fa-500px" style="font-size:56px;color:black;"></i>
	<p>항상 발전하고 성장해가자.</p>
	<a href="https://github.com/choisw2008/AniMultiply"><i class="fab fa-github" style="font-size:48px;color:white;"></i></a>&nbsp&nbsp
	<i class='fa fa-envelope' style="font-size:48px;color:white;"></i>&nbsp&nbsp
	<a href="https://blog.naver.com/choisw2008"><i class='fa fa-blog' style='font-size:48px;color:white'></i></a>&nbsp&nbsp
	<i class='fab fa-java' style="font-size:48px;color:white;"></i>
</footer>
</body>
</html>