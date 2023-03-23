<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/MenuTab.css">

<div class="dropdown">
	<button class="dropbtn">홈 화면 링크 버튼(이미지 삽입?)</button>
</div>

<div class="dropdown">
	<button class="dropbtn">센터소개</button>
	<div class="dropdown-content">
		<a href="#">인사말</a> 
		<a href="#">오시는 길</a>
	</div>
</div>

<div class="dropdown">
	<button class="dropbtn">체험관</button>
	<div class="dropdown-content">
		<a href="#">체험관 이용안내</a> 
		<a href="#">체험관 신청</a>
	</div>
</div>

<div class="dropdown">
	<button class="dropbtn">식단 / 표준 레시피</button>
	<div class="dropdown-content">
		<a href="${pageContext.request.contextPath}/MenuBoard/List.jsp">식단표</a> 
		<a href="${pageContext.request.contextPath}/RecipeBoard/List.jsp">표준 레시피</a>
	</div>
</div>

<div class="dropdown">
	<button class="dropbtn">알림마당</button>
	<div class="dropdown-content">
		<a href="#">공지사항</a> 
		<a href="#">질문 게시판</a>
		<a href="#">포토 갤러리</a>
		
	</div>
</div>


</head>