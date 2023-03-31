package qnaboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeboard.NoticeBoardDAO;
import noticeboard.NoticeBoardDTO;
import utils.JSFunction;

/**
 * Servlet implementation class QReplyController
 */
@WebServlet("/qnaboard/reply.do")
public class QReplyController extends HttpServlet {
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
		request.getRequestDispatcher("/QnABoard/Reply.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 수정 내용을 매개변수에서 얻어옴
		String idx = request.getParameter("idx");
		String reply = request.getParameter("reply");

		// DB에 수정 내용 반영
		QnABoardDAO dao = new QnABoardDAO();
		QnABoardDTO dto = new QnABoardDTO();
		dto.setIdx(idx);
		dto.setReply(reply);
		int result = dao.replyPost(dto);
		dao.close();
		
		// 성공 or 실패 ?
		if (result == 1) {
			// 수정 성공
			response.sendRedirect("../qnaboard/view.do?idx=" + idx);
		} else {
			// 수정 실패
			JSFunction.alertLocation(response, "답변 등록 실패", "../qnaboard/view.do?idx=" + idx);
		}
	}
}