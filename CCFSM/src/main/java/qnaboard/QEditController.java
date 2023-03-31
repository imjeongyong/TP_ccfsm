package qnaboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;

/**
 * Servlet implementation class QEditController
 */
@WebServlet("/qnaboard/edit.do")
public class QEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idx = request.getParameter("idx");
		QnABoardDAO dao = new QnABoardDAO();
		QnABoardDTO dto = dao.selectView(idx);
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/QnABoard/Edit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 수정 내용을 매개변수에서 얻어옴
		String idx = request.getParameter("idx");
		String userid = request.getParameter("userid");
		String pass = request.getParameter("pass");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String reply = request.getParameter("reply");

		// DTO에 저장
		QnABoardDTO dto = new QnABoardDTO();
		dto.setIdx(idx);
		dto.setUserid(userid);
		dto.setPass(pass);
		dto.setTitle(title);
		dto.setContent(content);

		// DB에 수정 내용 반영
		QnABoardDAO dao = new QnABoardDAO();
		int result = dao.updatePost(dto);
		dao.close();

		// 성공 or 실패 ?
		if (result == 1) {
			// 수정 성공
			response.sendRedirect("../qnaboard/view.do?idx=" + idx);
		} else {
			// 수정 실패
			JSFunction.alertLocation(response, "게시물 수정 실패", "../qnaboard/view.do?idx=" + idx);
		}
	}
}