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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	var hour;
	var monthlyPay;
	var min;
	function clicked_Mon(){
		var select=document.getElementById("clickMon");
		var selectMon = select.options[select.selectedIndex].value;
		var worker_no="<%=request.getParameter("worker_no")%>";
		var worker_id="<%=request.getParameter("worker_id")%>";
		console.log(worker_no+"넘버,,아이디"+worker_id+"선택된달"+selectMon);
			   
		var date={'worker_no':worker_no, 'worker_id':worker_id, 'selectMon':selectMon} ;
		console.log(date);
		
		if(selectMon=="" || selectMon=="0")
			return;
		
		$.ajax({
			          url:"http://localhost:8090/biz/totalHourScheduleAjax.do",
			          type:"post",
			          data: JSON.stringify(date),
			          dataType: "json",
			          contentType: "application/json",
			          async: false,//동기식으로 한다.
			          success(data){
			        	  console.log(data);
			        	  hour=data.totalHour;
			        	  min=data.totalMin;
			        	  var hh=parseInt(min/60);
			        	  var mm=min%60;
			        	  
			        	  console.log(hh+"시"+mm+"분");
			        	  var total =$("#totalTime").val(hh+"시"+mm+"분");
			        	  
			     		
			             
			          },
			          error:function(){
			             alert('전송 실패');
			          }
			       });
		   
		
		
 	}
	
	function calculate(){
		

				 var wage= $('#hourlyPay').val();
				 var tax=$('#tax').val();
				 var selectMon = $('#clickMon').val();
				 console.log(selectMon+"selectMon");
				 if(wage==''){
					 alert('시급을 입력해주세요');
				     $('#hourlyPay').focus();
				     return false;
				 }
				 if(selectMon==null || selectMon=="0"){
					 alert('월을 선택해 주세요');
					 return false;
				 }
				 
				 
				 
				  monthlyPay=wage * hour;
				 var value=$("#tax").val();
				
					 monthlyPay = Math.round(monthlyPay - (monthlyPay*value));
					 money=monthlyPay.toLocaleString();
				var tmonthPay=$('#price').text("해당 월 급여 금액은 "+money+"원 입니다.");
				 
 	}
	function save(){
		var select=document.getElementById("clickMon");
		var selectMon = select.options[select.selectedIndex].value;
		var worker_no="<%=request.getParameter("worker_no")%>";
		var name="<%=request.getParameter("name")%>";
		var hourlyPay= $('#hourlyPay').val();
		var tax= $('#tax').val();
		console.log(worker_no+"넘버,,이름"+name+"선택된달"+selectMon);
			   
		var date={'worker_no':worker_no, 'name':name, 'selectMon':selectMon,
				'hourlyPay' :hourlyPay, 'totalMin':min, 'tax':tax,'money':monthlyPay} ;
		console.log(date);
		
		if(money=='')
			return;
		$.ajax({
			          url:"http://localhost:8090/biz/payInfoAjax.do",
			          type:"post",
			          data: JSON.stringify(date),
			          dataType: "json",
			          contentType: "application/json",
			          async: false,//동기식으로 한다.
			          success(data){
			        	 alert('저장완료');
			        	 self.close();
			             
			          },
			          error:function(){
			             alert('전송 실패');
			          }
			       });
		   
		
		
 	}


</script>
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
					<td colspan="2"><button onclick="calculate()"  class="btn btn-success">계산하기</button>
					<button onclick="save()"  class="btn btn-success">저장하기</button></td>
				</tr>
				
			</table>
		</form>
				<p style="color: blue" id="price"></p>
	</div>
</body>
</html>