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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">


// 아이디 중복 확인
$(function(){
	$("#worker_id").blur(function(){
	var worker_id=$('#worker_id').val();
	
	if(worker_id==null ||worker_id=="")
		return;
	console.log(worker_id);
	$.ajax({
        url:'http://localhost:8090/IdCheckService.do?worker_id='+worker_id,
        type:"get",
        dataType: "json",
        contentType: "application/json",
        success(result){
        	
        	var msg;
        	var color;
        	if(result>0){
        		msg = "사용 불가능한 아이디입니다.";
               	color = 'red';
        	}else{
        		msg = "사용 가능한 아이디입니다.";
            	color = 'blue';
        	}
        	document.getElementById("id_div").innerHTML = msg;
            document.getElementById("id_div").style.color=color; 
        },
        error:function(){
           alert('전송 실패');
        }
     });
	});
	
});

$.fn.serializeObject = function(){
   var o = {};
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};

   function addWorker(){
      if($("#worker_id").val()==""){
         alert('아이디를 입력하세요.');
         $("#worker_id").focus();
         return;
      }else if($("#pwd").val()==""){
         alert('비밀번호를 입력하세요.');
         $("#pwd").focus();
         return;
      }else if($("#name").val()==""){
          alert('이름을 입력하세요.');
          $("#name").focus();
          return;
       }else if($("#phone").val()==""){
           alert('휴대폰번호를 입력하세요.');
           $("#phone").focus();
           return;
        }else if($("input[name=gender]:checked").val()==undefined){
            alert('성별을 선택하세요.');
            $("#gender").focus();
            return;
         }else if($("#age").val()==""){
             alert('나이를 입력하세요.');
             $("#age").focus();
             return;
          }
      
      var formData = $("#form1").serializeObject();
      $.ajax({
          url:"http://localhost:8090/addWorkerAjax.do",
          type:"post",
          data: JSON.stringify(formData),
          dataType: "json",
          contentType: "application/json",
          success(data){
             alert("회원가입이 완료되었습니다.");
            // location.href = "index.jsp";
             location.href = "redirect:index.jsp";
          },
          error:function(){
             alert('전송 실패');
          }
       });
      
   };

</script>
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