/**
 * 
 */
 
//카카오로그인
function kakaoLogin(){
		 $.ajax({
		        url: 'http://localhost:8090/getKakaoAuthUrl.do',
		        type: 'get',
		        async: false,
		        dataType: 'text',
		        success: function (res) {
		            location.href = res;
		        }
		    });
	}

//회원가입 + 아이디중복체크
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
            location.href = "index.jsp";
          },
          error:function(){
             alert('전송 실패');
          }
       });
      
   };




	
//아이디찾기
  function findid(){
		var url="workerGetId.jsp";
		
		window.open(url, "_blank_1",  "width = 400px, height = 300px, top = 100, left = 585, location = no");
	}
  
	
//비밀번호찾기	
  function findpassword(){
	  var url="workerGetPwd.jsp";
	  
	  window.open(url, "_blank_1",  "width = 400px, height = 350px, top = 100, left = 585, location = no");
  }
  
  //스케줄등록
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
	   
	   var seq= $("#seq").val();
	   var worker_no = $("#worker_no").val();
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
		        		  alert("스케줄 등록이 완료되었습니다.");
				          window.close();
		        	  }
		             
		          },
		          error:function(){
		             alert('전송 실패');
		          }
		       });
	   }
   }
   
   //스케줄수정

   function scheduleUpdate(){
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
	   
	   var seq=$("#seq").val();
	   var name = $("#name").val();
	   var work_start_date = $("#start_date").val() + "T" + $("#start_time").val();
	   var work_end_date = $("#end_date").val() + "T" + $("#end_time").val();
	   
	   var data = {"seq":seq,"name" : name, "work_start_date" : work_start_date, "work_end_date" : work_end_date};
	   
	   
	  
	   
		   $.ajax({
		          url:"http://localhost:8090/scheduleUpdateAjax.do",
		          type:"post",
		          data: JSON.stringify(data),
		          dataType: "json",
		          contentType: "application/json",
		          async: false,//동기식으로 한다.
		          success(data){
		        		  alert("스케줄 수정이 완료되었습니다.");
		        		  opener.window.location.reload();
				          window.close();
		          },
		          error:function(){
		             alert('전송 실패');
		          }
		       });
	   
   }
   
   //월 별 총 근무시간 +급여계산 + 급여 저장
   	var hour;
	var monthlyPay;
	var min;
	function clicked_Mon(){
		var select=document.getElementById("clickMon");
		var selectMon = select.options[select.selectedIndex].value;
		var worker_no=$('#worker_no').val();
		var worker_id=$('#worker_id').val();
		console.log(worker_no+"넘버,,아이디"+worker_id+"선택된달"+selectMon);
			   
		var date={'worker_no':worker_no, 'worker_id':worker_id, 'selectMon':selectMon} ;
		console.log(date);
		
		if(selectMon=="" || selectMon=="0")
			return;
		
		$.ajax({
			          url:"http://localhost:8090/totalHourScheduleAjax.do",
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
		var worker_no=$('#worker_no').val();
		var name=$('#name').val();
		var hourlyPay= $('#hourlyPay').val();
		var tax= $('#tax').val();
		console.log(worker_no+"넘버,,이름"+name+"선택된달"+selectMon);
			   
		var date={'worker_no':worker_no, 'name':name, 'selectMon':selectMon,
				'hourlyPay' :hourlyPay, 'totalMin':min, 'tax':tax,'money':monthlyPay} ;
		console.log(date);
		
		if(money=='')
			return;
		$.ajax({
			          url:"http://localhost:8090/payInfoAjax.do",
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
   
   
   
  
  
  