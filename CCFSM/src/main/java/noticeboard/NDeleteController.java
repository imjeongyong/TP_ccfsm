package noticeboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;
import menuboard.MenuBoardDAO;
import menuboard.MenuBoardDTO;
import utils.JSFunction;

/**
 * Servlet implementation class NDeleteController
 */
@WebServlet("/noticeboard/delete.do")
public class NDeleteController extends HttpServlet {
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
		NoticeBoardDAO dao = new NoticeBoardDAO();
		NoticeBoardDTO dto = dao.selectView(idx);
		int result = dao.deletePost(idx);
		dao.close();

		if (result == 1) { // 게시물 삭제 성공 시 첨부파일도 삭제
			String saveFileName = dto.getSfile();
			FileUtil.deleteFile(request, "/Uploads", saveFileName);
		}
		JSFunction.alertLocation(response, "삭제되었습니다.", "../noticeboard/list.do");
	}
}