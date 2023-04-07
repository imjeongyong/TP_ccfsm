package event;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InPutController
 */
@WebServlet("/event/input.do")
public class InPutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// date 데이터 파싱작업
		String inpTime1 = request.getParameter("start_date");
		String inpTime2 = request.getParameter("end_date");

	    // LocalDateTime 객체 생성
	    LocalDateTime ldt1 = LocalDateTime.parse(inpTime1, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
	    LocalDateTime ldt2 = LocalDateTime.parse(inpTime2, DateTimeFormatter.ISO_LOCAL_DATE_TIME);

	    // LocalDateTime 객체를 yyyy-MM-dd HH:mm 형식의 문자열로 변환
	    String start_date = ldt1.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	    String end_date = ldt2.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));

		// 전송받은 데이터를 dto 객체에 저장
		EventDTO dto = new EventDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setStart_date(start_date);
		dto.setEnd_date(end_date);
		dto.setCapa(request.getParameter("capa"));
		dto.setRest(request.getParameter("rest"));		
		
		// 저장한 데이터를 DB에 insert
		EventDAO dao = new EventDAO();
		dao.insetEvent(dto);

		request.getRequestDispatcher("../event/view.do").forward(request, response);
	}
}