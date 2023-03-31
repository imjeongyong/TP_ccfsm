package qnaboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class QWriteController
 */
@WebServlet("/qnaboard/write.do")
public class QWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/QnABoard/Write.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 폼값을 DTO에 저장
		QnABoardDTO dto = new QnABoardDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setUserid(request.getParameter("userid"));
		dto.setPass(request.getParameter("pass"));
		dto.setContent(request.getParameter("content"));


		// DAO를 통해 DB에 게시 내용 저장
		QnABoardDAO dao = new QnABoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();

		// 성공 or 실패?
		if (result == 1) { // 글쓰기 성공
			response.sendRedirect("../qnaboard/list.do");
		} else { // 글쓰기 실패
			response.sendRedirect("../qnaboard/write.do");
		}
	}
}