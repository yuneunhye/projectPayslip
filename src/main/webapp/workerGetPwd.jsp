<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
<style>
 *  {margin :0; padding : 0;} 
 div {width : 300px; margin-left: 5%; margin-top: 5%;}
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="jquery/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div>
	<form method="post" class="form-signin" action="find_password.do" name="findform">
		<div class="form-label-group">
			ID : <input type="text" id="id" name="worker_id" class="form-control"/>

		</div>

		<div class="form-label-group">
			이름 :<input type="text" id="name" name="name" class="form-control"/>

		</div>

		<div class="form-label-group">
			휴대폰 번호 : <input type="text" id="phone" name="phone" class="form-control"/>

		</div>

		<div class="form-label-group">
			<input type="submit" value="check" class="btn btn-lg btn-secondary btn-block text-uppercase">
		</div>
</form>
</div>
		<!-- 정보가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.id.value = "";
				opener.document.findform.name.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치할 때 -->
		<c:if test="${check == 0 }">
			<div>
				<label>찾으시는 비밀번호는' ${pwd}' 입니다.</label>
			</div>
		</c:if>
</body>
</html>