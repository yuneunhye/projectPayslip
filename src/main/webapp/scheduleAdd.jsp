<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
 *  {margin :0; padding : 0; } 
div {width : 500px; margin-left: 5%; margin-top: 5%; }
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>스케줄 등록</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="/js/script.js"></script>
<script type="text/javascript">
	//input박스 오늘날짜 설정
	window.onload = function() {
		today = new Date();
		console.log("today.toISOString() >>>" + today.toISOString());
		today = today.toISOString().slice(0, 10);
		console.log("today >>>> " + today);
		st = document.getElementById("start_date");
		ed = document.getElementById("end_date");
		st.value =today;
		ed.value =today;
	}
</script>
</head>
<body>
<div>
   <table class="table table-sm">
      <tr>
         <td>이름</td>
         <td><input type="text" id="name" value="<%=request.getParameter("name")%>" disabled></td>
      </tr>
      <tr>
         <td>근무시작일</td>
         <td><input type="date" id="start_date" ><input type="time" id="start_time" ></td>
      </tr>
      <tr>
         <td>근무종료일</td>
         <td><input type="date" id="end_date" ><input type="time" id="end_time" ></td>
      </tr>
      <tr>
         <td>반복</td>
         <td>
         	<input type="checkbox" id="sun">일요일마다
         	<input type="checkbox" id="mon">월요일마다
         	<input type="checkbox" id="tue">화요일마다
         	<input type="checkbox" id="wed">수요일마다</br>
         	<input type="checkbox" id="thu">목요일마다
         	<input type="checkbox" id="fri">금요일마다
         	<input type="checkbox" id="sat">토요일마다
         </td>
      </tr>
      <tr><td>
      <input type="hidden" id="seq" value="<%=request.getParameter("seq")%>">
      <input type="hidden" id="worker_no" value="<%=request.getParameter("worker_no")%>">
      <tr>
         <td colspan="2"><input class="btn btn-success"  type="submit" value="등록" onclick="addSchedule()"></td>
      </tr>
   </table>
   </div>
</body>
</html>