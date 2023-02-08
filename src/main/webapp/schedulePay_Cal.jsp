<%@page import="com.company.biz.schedule.ScheduleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
 *  {margin :0; padding : 0;} 
 div {width : 500px; margin-left: 5%; margin-top: 5%;}
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
<title>급여계산</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="/js/script.js"></script>

</head>
<body>
	<div >
	<h2>급여계산</h2>
	<h6>2023년도 최저시급은 9,620원입니다.</h6>
		<form id="form1" onSubmit="return false;">
			<table class="table table-sm">
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" name="name" value="<%=request.getParameter("name")%> "></td>
				</tr>
				<tr>
					<td>시급</td>
					<td><input type="number" id="hourlyPay" name="hourlyPay"></td>
				</tr>
				<tr>
					<td>해당 월 총 근무시간</td>
					<td>
					<select id="clickMon" name="clickMon"onclick="clicked_Mon();">
					<option value="" selected disabled>월을 선택</option>
					<option value="1">1월</option>
					<option value="2">2월</option>
					<option value="3">3월</option>
					<option value="4">4월</option>
					<option value="5">5월</option>
					<option value="6">6월</option>
					<option value="7">7월</option>
					<option value="8">8월</option>
					<option value="9">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
					</select>
					<input type="text" id="totalTime" name="totalTime" value=""></td>
				</tr>
				
				
				<tr>
					<td>세금</td>
					<td><select id="tax" name="tax" checked="false">
					<option value="0">미적용</option>
					<option value="0.0932">9.32%</option>
					<option value="0.033">3.3%</option>
					</select></td>
				</tr>
				<tr>
				<td><input type="hidden" id="worker_no" value="<%=request.getParameter("worker_no")%>"></td>
				<td><input type="hidden" id="worker_id" value="<%=request.getParameter("worker_id")%>"></td>
				</tr>
				<tr>
					<td colspan="2"><button onclick="calculate()"  class="btn btn-success">계산하기</button>
					<button onclick="save()"  class="btn btn-success">저장하기</button></td>
				</tr>
				
			</table>
		</form>
				<p style="color: blue" id="price"></p>
	</div>
</body>
</html>