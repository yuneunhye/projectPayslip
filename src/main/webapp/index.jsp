<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index(LoginPage)</title>
 <link href="css_design/index_design.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="/js/script.js"></script>
</head>
<body>
<div class="index_container">
<form action="login.do" method="post" name="loginF" >
<h1>PAYSLIP</h1>
	<ul>
		<div>관리자 모드 로그인 id= admin 비밀번호= 1234</div>
		
		<li>ID&nbsp;&nbsp;<input type="text" id="id" name="worker_id" class="inputBox" value="${id }"></li>
		<div >${msg }</div>
		<li>PW <input type="password" id="pw" name="pwd" class="inputBox" > </li>
		<div >${msg1 }</div>
		<li><input type="submit" value="로그인" class="inputBtn" >
		<input type="button" value="회원가입" onclick="location.href='wokerSignUp.jsp'" class="inputBtn"></li>
		<li> <a href="javascript:void(0);" onclick="kakaoLogin(); return false;"><img alt="카카오로그인" src="img/kakao_login_medium_wide.png"/></a> </li>
	</ul>	
</form>
</div>
<div class="bottom_container">

<a onclick="findid()" > 아이디 찾기</a>
<a onclick="findpassword()" > 비밀번호 찾기</a>
</div>

</body>
</html>
