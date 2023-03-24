<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Resources/MenuTab.css">


<div class="dropdown">
	<button class="dropbtn" onclick="location.href='${pageContext.request.contextPath}/Index.jsp'">홈</button>
</div>

<div class="dropdown">
	<button class="dropbtn">센터소개</button>
	<div class="dropdown-content">
		<a href="${pageContext.request.contextPath}/Greeting/Greeting.jsp">인사말</a> 
		<a href="${pageContext.request.contextPath}/Greeting/Map.jsp">오시는 길</a>
	</div>
</div>

<div class="dropdown">
	<button class="dropbtn">체험관</button>
	<div class="dropdown-content">
		<a href="${pageContext.request.contextPath}/Experience/Introduce.jsp">체험관 이용안내</a> 
		<a href="${pageContext.request.contextPath}/Experience/Reservation.jsp">체험관 신청</a>
	</div>
</div>

<div class="dropdown">
	<button class="dropbtn">식단 / 표준 레시피</button>
	<div class="dropdown-content">
		<a href="${pageContext.request.contextPath}/menuboard/list.do">식단표</a>
		<a href="${pageContext.request.contextPath}/recipeboard/list.do">표준 레시피</a>
	</div>
</div>

<div class="dropdown">
	<button class="dropbtn">알림마당</button>
	<div class="dropdown-content">
		<a href="${pageContext.request.contextPath}/noticeboard/list.do">공지사항</a> 
		<a href="${pageContext.request.contextPath}/QnA/QnA.jsp">질문 게시판</a> 
		<a href="${pageContext.request.contextPath}/PhotoBoard/PhotoBoard.jsp">포토 갤러리</a>
	</div>
</div>


</head>