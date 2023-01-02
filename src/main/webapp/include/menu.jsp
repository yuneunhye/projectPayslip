<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <nav>
         <ul>
        	<li><a href="/biz/getScheduleList.do" class="bar">메인</a></li>
         <c:if test="${vo.name eq '사장님'}">
            <li><a href="/biz/getWorkerList.do?nowPage=1" class="bar">근무자관리</a></li>
         </c:if>
            <li><a href="/biz/getPayInfoList.do?worker_no=${vo.worker_no }&nowPage=1" class="bar">월급 내역서</a></li>
            <li><a href="/biz/logout.do" class="bar">로그아웃</a></li>
         
         </ul>
      </nav>
