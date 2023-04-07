package event;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeboard.NoticeBoardDAO;
import noticeboard.NoticeBoardDTO;

/**
 * Servlet implementation class EViewController
 */
@WebServlet("/event/eview.do")
public class EViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 게시물 불러오기
		EventDAO dao = new EventDAO();
		String idx = request.getParameter("idx");
		EventDTO dto = dao.eventView(idx); // idx로 조회

		dao.close();

		// 줄바꿈 처리
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br />"));

		// 게시물(dto) 저장 후 뷰로 포워드
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("/Event/EventView.jsp").forward(request, response);
	}
}