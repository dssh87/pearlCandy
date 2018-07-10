<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Hielo by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="/resources/css/main.css" />

<style>
.wrapper style3{
padding: 6rem 0 15rem 0;
}
.subpage {
	
	background: #F5F4F5;
}

.container{
	width: 50%;
}

.outer {
	padding-top: 5%;
 	background-color: #ffffff; 
	background-color: rgba(255, 255, 255, 0.6);
	width: 100%;
}

.mytable {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
}

.actions{
	float: right;
}

.row > * {
	display: inline-block;
	text-align: left;
}


.upwinput{
	width: 100%;
}

.upwConfirm{
	width: 100%;
}

.emailinput{
	width: 100%;
}

.phoneinput{
	width: 100%;
}

#header .logo .loginbtn{
float: right;
display: inline-block;
text-align: right;
}

#header .logo .loginbtn .logOutbtn .btnlogOut1{

float: left;
margin-right: 10px;

}

#header .logo .loginbtn .logOutbtn .btnlogOut2{
display: inline-block;
text-align: left;
margin-top: 10px;
}

.consumerInput{
float: right;
}


</style>

<body class="subpage">

	<!-- Header -->
	<header id="header">
		<div class="logo">
		
		<div class="loginbtn">

<sec:authorize access="isAnonymous()">
	<form action="/myLogin">
	<button>login</button>
	
	</form>	
</sec:authorize>

<div class="logOutbtn">
<sec:authorize access="isAuthenticated()">
	<form action="/logout" method="post" >
	<sec:authentication property="principal" var="user"/>
	<div class="btnlogOut1">
	<strong>${user.username}</strong>님 <strong>(Consumer)</strong>
	</div>
	<div class="btnlogOut2">
	<button class="lOutbtn">logout</button>
	</div>
	<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
	</form>
</sec:authorize>
</div>

		 </div>
		</div>

		<a href="#menu">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="/home">Home</a></li>
			<li><a href="/up/ajax">Image gallery</a></li>
			<li><a href="/board/list">Free Board</a></li>
			<li><a href="/mypage">My page</a></li>
		</ul>
	</nav>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>WHAT DO YOU WANT TO EAT?</p>
				<h2>FOOD TRUCK</h2>
			</header>
		</div>
	</section>

</head>

	<!-- Main -->
	<div id="main" class="container">
	<div class="outer">
			<div class="mytable">
			<i class="fa fa-edit" ></i> Edit Information			
			
						<div class="consumerInput">
							<input type="checkbox" id="consumer" name="role" value="0" checked="checked">
						<label for="consumer">고객</label>
						</div>						    
				
			<hr>	
			<br>
			
			<form action="/join" method="post">
					<div class="row uniform">
												
						<div class="upwinput">
						PASSWORD<input type="text" name = "upw1">					
						</div>
						
						<div class="upwConfirm">
						PASSWORD confirm<input type="text" name = "upw2">					
						</div>				
									
						<div class="emailinput">
						E-mail<input type="text" name= "email" value="lemoncandy@gmail.com"/>		
						</div>	
						
						<div class="phoneinput">
						Phone<input type="text" name = "phone_number" value="010-8797-4562"/>		
						</div>
						
						
						

						<div class="12u$">
							<ul class="actions">
								<button class="rbtn">Keyword register</button>
								<button class="jbtn">Modify</button>								
								<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
							</ul>
						</div>					
					</div>
				</form>					
			</div>
			<br>
		
	</div>
</div>

<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-envelope-o"><span
						class="label">Email</span></a></li>
			</ul>
		</div>
		<div class="copyright">&copy; Untitled. All rights reserved.</div>
	</footer>

	<!-- Scripts -->
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery.scrollex.min.js"></script>
	<script src="/resources/js/skel.min.js"></script>
	<script src="/resources/js/util.js"></script>
	<script src="/resources/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script>
	
	$(document).ready(function(e) {
		
		   var windowW = 900;  // 창의 가로 길이
	       var windowH = 700;  // 창의 세로 길이
	       var left = Math.ceil((window.screen.width - windowW)/2);
	       var top = Math.ceil((window.screen.height - windowH)/2);
		
		$(".rbtn").on("click", function(e){
			
			e.preventDefault();
			
			window.open("http://10.10.10.21:8080/keyword", "keywordInput", 
					"toolbar=no, menubar=no, scrollbars=no, resizable=yes, l top="+
					top+", left="+left+", height="+windowH+", width="+windowW);			
			
		});				
	});
	
	
				
	</script>
		
	
</body>
</html>