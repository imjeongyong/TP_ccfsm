package menuboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewController
 */
@WebServlet("/menuboard/view.do")
public class MViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시물 불러오기
		MenuBoardDAO dao = new MenuBoardDAO();
		String idx = request.getParameter("idx");
		dao.updateVisitCount(idx); // 조회수 1 증가
		MenuBoardDTO dto = dao.selectView(idx);
		dao.close();
		
		// 줄바꿈 처리
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br />"));
		
		// 게시물(dto) 저장 후 뷰로 포워드
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/MenuBoard/View.jsp").forward(request, response);
	}

}
