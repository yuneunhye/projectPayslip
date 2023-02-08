<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
 *  {margin :0; padding : 0;} 
 div {width : 400px; margin-left: 9%; margin-top: 9%;}
</style>
<meta charset="UTF-8">
<title>스케쥴 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="/js/script.js"></script>
<script type="text/javascript">
<%
	String start_date = request.getParameter("work_start_date");
	String[] sd_split = start_date.split("T");
	String end_date = request.getParameter("work_end_date");
	String[] ed_split = end_date.split("T");
 %>
 
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
         <td><input type="date" id="start_date" value="<%=sd_split[0]%>"><input type="time" id="start_time" value="<%=sd_split[1]%>"></td>
      </tr>
      <tr>
         <td>근무종료일</td>
         <td><input type="date" id="end_date" value="<%=ed_split[0]%>"><input type="time" id="end_time" value="<%=ed_split[1]%>"></td>
      </tr>
      <tr>
      <td><input type="hidden" id="seq" value="<%=request.getParameter("seq")%>"> </td>
      </tr>
      
      <tr>
         <td colspan="2"><input type="submit" value="수정" onclick="scheduleUpdate()" class="btn btn-success"></td>
      </tr>
   </table>
   </div>
</body>
</html>