package event;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;

/**
 * Servlet implementation class EventManageController
 */
@WebServlet("/event/manage.do")
public class EventManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// apply_table 조회 -> view.do에 반환
		EventDAO dao = new EventDAO();
		List<ApplyManageDTO> apply_list = dao.applyList();
		// 게시물 목록 받기
		dao.close();

		// 전달할 데이터를 request 영역에 저장 후 List.jsp로 포워드
		request.setAttribute("apply_list", apply_list);
		request.getRequestDispatcher("/event/view.do").forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 전송받은 데이터 저장
		String applicant_id = request.getParameter("applicant_id");
		String event_title = request.getParameter("event_title");
		String apply_idx = request.getParameter("apply_idx");
		
		// member table에서 apply_state : 대기->완료 변경
		MemberDAO mdao = new MemberDAO();
		mdao.apply_update(applicant_id);
		
		// event table에서 event_state : 모집중 -> 모집 완료
		EventDAO edao = new EventDAO();
		edao.state_update(event_title);
		
		// apply_manage table에서 apply_state : 대기->완료 변경
		edao.apply_manage_update(apply_idx);
		
		request.getRequestDispatcher("/event/view.do").forward(request, response);
	}
}