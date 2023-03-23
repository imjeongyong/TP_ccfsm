<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Resources/Header1.css">
 </head>
	<div class="head">
		<td align="right">
			<a href="${pageContext.request.contextPath}/Index.jsp">HOME |</a>
			<%
			if (session.getAttribute("UserId") == null) {
			%>
			<a href="${pageContext.request.contextPath}/Login/LoginForm.jsp">LOGIN |</a>
			<%
			} else {
			%>
			<a href="../Login/Logout.jsp">LOGOUT |</a>
			<%
			}
			%>
			<a href="${pageContext.request.contextPath}/Login/Join.jsp">JOIN |</a>
			<a href="../">SITEMAP</a>
		</td>
	</div>