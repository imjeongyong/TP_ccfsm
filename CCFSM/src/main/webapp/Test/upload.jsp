<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,
                 com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                 java.util.*"%>
<%
MultipartRequest up = null;
try {
	String path = "C:/WORK"; // 저장할 디렉토리 (절대경로)
	int size = 5 * 1024 * 1024; // 5메가까지 제한 넘어서면 예외발생
	up = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
	Enumeration e = up.getFileNames(); // 폼의 이름 반환
	if (e == null) // 파일이 업로드 되지 않았을때
		response.sendRedirect("UploadFail.jsp");
} catch (Exception e) {
	response.sendRedirect("UploadFail.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<TITLE>파일업로드 결과</TITLE>
</head>
<body>
	<div align="center">
		<H1>다중파일 업로드 결과</H1>
		<br>

		<TABLE align=center border=1>
			<TR>
				<td>작성자</td>
				<td><%=new String(up.getParameter("name").getBytes("8859_1"), "euc-kr")%></td>
			</TR>
			<TR>
				<td>파일명</td>
				<td>
					<%
					for (Enumeration e = up.getFileNames(); e.hasMoreElements();) {
						String strName = (String) e.nextElement();
						String fileName = up.getFilesystemName(strName);
						if (fileName != null) {
							out.print(new String(fileName.getBytes("8859_1"), "euc-kr"));
							out.println("<br>");
						}
					}
					%>
				</td>
			</TR>
		</TABLE>
	</div>
</body>
</html>





