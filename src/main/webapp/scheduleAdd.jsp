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
<title>스케쥴 등록</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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



   function addSchedule(){
	   if ($("#start_date").val() == '') {
		   alert("시작일을 선택하세요.");
		   return;
	   } else if ($("#start_time").val() == '') {
		   alert("시작시간을 선택하세요.");
		   return;
	   } else if ($("#end_date").val() == '') {
		   alert("종료일을 선택하세요.");
		   return;
	   } else if ($("#end_time").val() == '') {
		   alert("종료시간을 선택하세요.");
		   return;
	   }
	   
	   var seq="<%=request.getParameter("seq")%>";
	   var worker_no = "<%=request.getParameter("worker_no")%>";
	   var work_start_date = $("#start_date").val() + "T" + $("#start_time").val();
	   var work_end_date = $("#end_date").val() + "T" + $("#end_time").val();
	   
	   var data = {"worker_no" : worker_no, "work_start_date" : work_start_date, "work_end_date" : work_end_date};
	   var list = [];
	   list[0] = data;
	   
	   var start_date = new Date($("#start_date").val());
	   var end_date = new Date($("#end_date").val());
	   var s_time = $("#start_time").val();
	   var e_time = $("#end_time").val();
	   
	   start_date.setHours(s_time.substring(0,2), s_time.substring(3,5));
	   end_date.setHours(e_time.substring(0,2), e_time.substring(3,5));
	   
	   var month = start_date.getMonth()+1;
	   var date1 = start_date.getDate();
	   	   
	   var n_month = month;
	   var n_date1 = date1+1;

	   
	   while (true) {
		   var n_s_date = new Date(start_date.setDate(n_date1));
		   var n_e_date = new Date(end_date.setDate(n_date1));
		   n_month = n_s_date.getMonth()+1;
		   n_date1 = n_s_date.getDate();
		   console.log("+1>>>>>>>>>"+n_month);
		   console.log("<<<<<<"+n_date1);
		   console.log("===================");
		   day = n_s_date.getDay();
		   if (month < n_month)
			   break;
		   
		   n_s_date.setHours(n_s_date.getHours()+9);
		   n_e_date.setHours(n_e_date.getHours()+9);
		   
		   switch (day) {
		   case 0:
			   if ($("#sun").is(':checked')) {
				   var s = n_s_date.toISOString().substring(0,16);
				   var e = n_e_date.toISOString().substring(0,16);
				   var d = {"seq":seq,"worker_no" : worker_no, "work_start_date" : s, "work_end_date" : e};
				   list[list.length] = d;
			   }
			   break;
		   case 1:
			   if ($("#mon").is(':checked')) {
				   var s = n_s_date.toISOString().substring(0,16);
				   var e = n_e_date.toISOString().substring(0,16);
				   var d = {"seq":seq,"worker_no" : worker_no, "work_start_date" : s, "work_end_date" : e};
				   list[list.length] = d;
			   }
			   break;
		   case 2:
			   if ($("#tue").is(':checked')) {
				   var s = n_s_date.toISOString().substring(0,16);
				   var e = n_e_date.toISOString().substring(0,16);
				   var d = {"seq":seq,"worker_no" : worker_no, "work_start_date" : s, "work_end_date" : e};
				   list[list.length] = d;
			   }
			   break;
		   case 3:
			   if ($("#wed").is(':checked')) {
				   var s = n_s_date.toISOString().substring(0,16);
				   var e = n_e_date.toISOString().substring(0,16);
				   var d = {"seq":seq,"worker_no" : worker_no, "work_start_date" : s, "work_end_date" : e};
				   list[list.length] = d;
			   }
			   break;
		   case 4:
			   if ($("#thu").is(':checked')) {
				   var s = n_s_date.toISOString().substring(0,16);
				   var e = n_e_date.toISOString().substring(0,16);
				   var d = {"seq":seq,"worker_no" : worker_no, "work_start_date" : s, "work_end_date" : e};
				   list[list.length] = d;
			   }
			   break;
		   case 5:
			   if ($("#fri").is(':checked')) {
				   var s = n_s_date.toISOString().substring(0,16);
				   var e = n_e_date.toISOString().substring(0,16);
				   var d = {"seq":seq,"worker_no" : worker_no, "work_start_date" : s, "work_end_date" : e};
				   list[list.length] = d;
			   }
			   break;
		   case 6:
			   if ($("#sat").is(':checked')) {
				   var s = n_s_date.toISOString().substring(0,16);
				   var e = n_e_date.toISOString().substring(0,16);
				   var d = {"seq":seq,"worker_no" : worker_no, "work_start_date" : s, "work_end_date" : e};
				   list[list.length] = d;
			   }
			   break;
		   }
		   n_date1 += 1;
	   }
	   
	   console.log(list);
	   
	   var count = 0;
	   for (var i = 0; i < list.length; i++) {
		   $.ajax({
		          url:"http://localhost:8090/addScheduleAjax.do",
		          type:"post",
		          data: JSON.stringify(list[i]),
		          dataType: "json",
		          contentType: "application/json",
		          async: false,//동기식으로 한다.
		          success(data){
		        	  count++;
		        	  
		        	  if (count == list.length) {
		        		  alert("스케쥴 등록이 완료되었습니다.");
				          window.close();
		        	  }
		             
		          },
		          error:function(){
		             alert('전송 실패');
		          }
		       });
	   }
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
      
      <tr>
         <td colspan="2"><input class="btn btn-success"  type="submit" value="등록" onclick="addSchedule()"></td>
      </tr>
   </table>
   </div>
</body>
</html>