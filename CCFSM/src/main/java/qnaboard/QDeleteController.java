package qnaboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;
import noticeboard.NoticeBoardDAO;
import noticeboard.NoticeBoardDTO;
import utils.JSFunction;

/**
 * Servlet implementation class QDeleteController
 */
@WebServlet("/qnaboard/delete.do")
public class QDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 매개변수 저장
		String idx = request.getParameter("idx");

		// 게시물 삭제
		QnABoardDAO dao = new QnABoardDAO();
		dao.deletePost(idx);
		dao.close();

		JSFunction.alertLocation(response, "삭제되었습니다.", "../qnaboard/list.do");
	}
}