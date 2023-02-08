<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
 *  {margin :0; padding : 0;} 
 .cover {width : 500px; margin-left: 35%; margin-top: 10%;}
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="/js/script.js"></script>
</head>
<body>
	<div class="cover">
		<form id="form1" onSubmit="return false;">
			<table class="table table-sm">
				<tr>
				<td><input type="hidden" id="kakaoId" name="kakaoId" value="${kakaoId }"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="worker_id" name="worker_id">
						<div id="id_div"></div></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="pwd" name="pwd"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text" id="phone" name="phone"
						placeholder="-하이푼 없이 입력"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" id="gender" name="gender" value="0">남
						<input type="radio" id="gender" name="gender" value="1">여
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" id="age" name="age"></td>
				</tr>
				<tr>
					<td colspan="2"><button class="btn btn-lg btn-secondary btn-block text-uppercase" onclick="addWorker()">등록</button></td>
				</tr>
			</table>
		</form>

	</div>

	<br>

</body>
</html>