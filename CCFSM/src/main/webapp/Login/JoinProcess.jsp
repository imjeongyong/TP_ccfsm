<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 회원가입 폼으로부터 회원가입 요소 저장
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");
String userEmail = request.getParameter("user_email");
String userName = request.getParameter("user_name");

System.out.println(userId + " 잘 받음");
System.out.println(userPwd + " 잘 받음");
System.out.println(userEmail + " 잘 받음");
System.out.println(userName + " 잘 받음");

// 회원 테이블 DAO를 아이디 중복 여부 확인
MemberDAO dao = new MemberDAO();
boolean duplicated = false;
duplicated = dao.chkId(userId);

System.out.println("ID 중복입니까????????" + duplicated);
// true->생성 불가(id 중복), false->생성가능
if (duplicated == false) {
	// id 생성가능
	dao.addMember(userId, userPwd, userEmail, userName); // 회원가입
	request.setAttribute("JoinSuccess", "ok");
	request.getRequestDispatcher("JoinForm.jsp").forward(request, response);
} else {
	// id 중복
	request.setAttribute("JoinErrMsg", "중복된 아이디 입니다.");
	request.getRequestDispatcher("JoinForm.jsp").forward(request, response);
}
%>