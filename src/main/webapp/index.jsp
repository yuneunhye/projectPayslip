<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index(LoginPage)</title>
 <link href="css_design/index_design.css" rel="stylesheet">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div class="index_container">
<form action="login.do" method="post" name="loginF" >
<h1>PAYSLIP</h1>
	<ul>
		<li>ID&nbsp;&nbsp;<input type="text" id="id" name="worker_id" class="inputBox" value="${id }"></li>
		<div >${msg }</div>
		<li>PW <input type="password" id="pw" name="pwd" class="inputBox" > </li>
		<div >${msg1 }</div>
		<li><input type="submit" value="로그인" class="inputBtn" >
		<input type="button" value="회원가입" onclick="location.href='wokerSignUp.jsp'" class="inputBtn"></li>
	</ul>	
</form>
</div>
<div class="bottom_container">
<a onclick="findid()" > 아이디 찾기</a>
<a onclick="findpassword()" > 비밀번호 찾기</a>
</div>
<script type="text/javascript">

//   function login(){
// 	  document.getElementById("msg").innerHTML="";
// 	  var worker_id=document.getElementById("id").value;
// 	  var pwd=document.getElementById("pw").value;
// 	  console.log("id:"+worker_id+"pw"+pwd)
// 	  if(worker_id==""){
// 		  document.getElementById("msg").innerHTML="아이디를 입력하세요";
// 		  document.getElementById("id").focus();
// 		  return false;
// 	  }
// 	  if(pwd==""){
// 		  document.getElementById("msg1").innerHTML="비밀번호를 입력하세요";
// 		  document.getElementById("pw").focus();
// 		  return false;
// 	  }
// 	  var date={"worker_id":worker_id, "pwd":pwd};
// 	  console.log(date);
	  
// 	  $.ajax({
// 	        url:'http://localhost:8090/biz/login.do',
// 	        type:"post",
// 	        data:JSON.stringify(date),
// 	        dataType: "json",
// 	        contentType: "application/json",
// 	        success(result){
	        	
	        	
// 	        	document.getElementById("msg").innerHTML = "아이디 또는 비밀번호가 일치하지 않습니다";
// 	        },
// 	        error:function(){
// 	           alert('전송 실패');
// 	        }
// 	     });
	  
//   }	

  function findid(){
		var url="workerGetId.jsp";
		
		window.open(url, "_blank_1",  "width = 400px, height = 300px, top = 100, left = 585, location = no");
	}
  
  function findpassword(){
	  var url="workerGetPwd.jsp";
	  
	  window.open(url, "_blank_1",  "width = 400px, height = 350px, top = 100, left = 585, location = no");
  }
  </script>
</body>
</html>
