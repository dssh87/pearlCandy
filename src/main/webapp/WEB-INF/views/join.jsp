<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

.uidinput{
	width: 75%;
}
.uidCheck{
	width: 25%;
	margin-top: 27px;
}

.upwinput{
	width: 100%;
}

.unameinput{
	width: 100%;
}

.emailinput{
	width: 100%;
}

.phoneinput{
	width: 100%;
}
body div{
font-size: 13pt;
}

button{
height: 3rem;
}


</style>

<body class="subpage">

	<!-- Header -->
	<header id="header">
		<div class="logo">
			<a href="/home"><i class="fa fa-truck" ></i>  Food Truck</a>
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
				<h3>Join</h3>

				<form action="/join" method="post">
					<div class="row uniform">
						<div class="uidinput"> 
						ID<input type="text" name = "uid" size="100%" class="checkid">
						</div>
						
						<div class="uidCheck">
						<button class="idCheck">ID CHECK</button>
						<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
						</div>
						
						<div class="unameinput"> 
					    Name<input type="text" name = "uname">	
						</div>

						<div class="upwinput">
						PASSWORD<input type="text" name = "upw">					
						</div>
						
						<div class="upwConfirm">
						PASSWORD confirm<input type="text" name = "upw1">					
						</div>						
				
						<div class="emailinput">
						E-mail<input type="text" name = "email">		
						</div>	
						
						<div class="phoneinput">
						Phone<input type="text" name = "phone_number">		
						</div>
						
						<div class="6u 12u$(small)">
							<input type="checkbox" id="owner" name="role" value="0" onclick="check_only(this)">
						<label for="owner">사장</label>						
						
						    <input type="checkbox" id="consumer" name="role" value="1" onclick="check_only(this)">
						<label for="consumer">고객</label>
						</div>
						
							
						
						<div class="12u$">
							<ul class="actions">
								<button class="jbtn">join</button>								
								<input type="hidden" name = "${_csrf.parameterName}" value ="${_csrf.token}">
							</ul>
						</div>
					
					</div>
				</form>
	
				<hr/>
			</div>
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
		
		var idCheck =  false; 
		var inputId = "";
		var pattern = /^[가-힣0-9a-zA-Z]*$/;
		
		var csrfToken = "${_csrf.token}";

        function setCsrf(token){
        	
        	$.ajaxSetup({
                headers:
                { 'X-CSRF-TOKEN':token }
            });        	
        }
        
        $(".jbtn").on("click",function(e){
        	
        	var upw = document.getElementById("upw").value; // 입력한 비밀번호
        	var confirmUpw = document.getElementById("upw1").value; // 입력한 비밀번호 확인
        	if(upw != confirmUpw){
        		console.log("비밀번호 불일치")
        		alert("입력한 비밀번호가 서로 다릅니다.")
        		return false;
        	}
        });
        
	
		$(".idCheck").on("click",function(e){
			console.log("click...");
			e.preventDefault();
			var uid = $('.checkid').val();
			console.log("uid1...",uid);
			
			if(pattern.test(uid) == false){
				console.log("uid2..",pattern.test(uid));
				alert("아이디는 한글,영문 및 숫자만 가능합니다");
				return false;
			}
			if(uid == ""){
				alert("아이디를 입력해주세요");
				return false;
			}
			setCsrf(csrfToken);
			
			$.ajax({
				type: 'POST',
				url: "/idCheck",
				dataType: "json",
				contentType	:	"application/x-www-form-urlencoded; charset=UTF-8",
		        headers : {
		            "content-type" : "application/json",
		            "x-http-method-override" : "POST"
		          },
				data : uid,
				success: function(data){
					if(data === 1){
						alert("이미 존재하는 아이디입니다");
					}
					if(data === 0){
						alert("사용 가능한 아이디입니다")
						idCheck = true; //아이디 중복확인 한것 확인됬을 경우 true로 저장
						inputId = uid;
					}
				}
			});
		});	
		
		var msg = '<c:out value="${msg}"/>';		

		if (msg == "joinFail") {
			alert("회원가입에 실패했습니다. 아이디나 비밀번호를 확인하세요.");
			}		
	});		
	
	function check_only(check){
		   
	       var obj = document.getElementsByName("role");
	       
	       for(var i=0; i<obj.length; i++){
	           if(obj[i] != check){
	               obj[i].checked = false;	         
	       }	       
	   }
	}
	
	
				
	</script>
		
	
</body>
</html>