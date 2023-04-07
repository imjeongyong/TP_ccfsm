package event;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewController
 */
@WebServlet("/event/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// DB의 데이터를 저장할 DTO 생성
		EventDTO dto = new EventDTO();
		
		// 전송할 데이터 DB 조회
		EventDAO dao = new EventDAO();
		List<EventDTO> events = dao.eventList();
		
		// 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
		request.setAttribute("events", events);
		request.getRequestDispatcher("/Event/View.jsp").forward(request, response);
	}
}