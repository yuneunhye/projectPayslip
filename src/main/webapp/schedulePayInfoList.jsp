<%@page import="com.company.biz.worker.WorkerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
 WorkerVO wvo=(WorkerVO)session.getAttribute("vo");
int wno=wvo.getWorker_no();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무자관리</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="css_design/header_design.css" rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>
<body>
   <header>
      <jsp:include page="include/menu.jsp" />
   </header>
   <form action="/getPayInfoList.do">
   <div style="margin-left: 70%; margin-bottom: 2%" >
   <input id="keyword" name="keyword" value="${paging.keyword}">  <input type="submit" class="btn btn_check2" value="검색">
   </div>
   </form>
   <div  align="center">
   <table class="table text-center" style="width: 85%;">
		<tr style="vertical-align:middle;">
			<th class="text-center">이름</th>
			<th class="text-center">근무한 월</th>
			<th class="text-center">시급</th>
			<th class="text-center">총 근무한 시간</th>
			<th class="text-center">세금</th>
			<th class="text-center">월급</th>
			<th class="text-center"></th>
		</tr>
		
		<c:choose>
			<c:when test="${empty payInfoList}">
			<tr>
				<td align="center" colspan="9">정산된 급여가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${payInfoList }" var="payInfo" varStatus="status">
				
				<tr>
					<td>${payInfo.name }</td>
					<td>${payInfo.selectMon } 월</td>
					<td>${payInfo.hourlyPay } 원</td>
					<td>${payInfo.HH } 시간 ${payInfo.MM } 분 </td>
					<fmt:parseNumber value = "${payInfo.tax}" pattern = "0,000.0000" var = "tax"/>
					<td>
						<c:if test="${tax == 0}">미포함</c:if>
						<c:if test="${tax == 0.0932}">9.32%</c:if>
						<c:if test="${tax == 0.033}">3.3%</c:if>
					</td>
					
					<td>${payInfo.salary }원</td>
					<% if (wno==1){%>
					<td><a href="/deletePayInfo.do?seq=${payInfo.seq }">삭제</a></td>
					<%} %>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		
	</div>
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/getPayInfoList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/getPayInfoList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/getPayInfoList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>	
	
</body>
</html>