package event;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

/**
 * Servlet implementation class EventApply
 */
@WebServlet("/event/apply.do")
public class EventApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EventApplyController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 데이터 전달받기
		String idx = request.getParameter("idx");
		String userid = request.getParameter("userid");
		
		// 전달받은 데이터를 이용해 DB테이블 정보 가져오기(member, event)
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.searchId(userid);
		mdao.close();
		
		EventDAO edao = new EventDAO();
		EventDTO edto = edao.eventView(idx);
		
		// (dto) 저장 후 뷰로 포워드
		request.setAttribute("mdto", mdto);
		request.setAttribute("edto", edto);
		request.getRequestDispatcher("/Event/EventApply.jsp").forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 데이터 전달받기
		String idx = request.getParameter("idx");
		String event_title = request.getParameter("event_title");
		String userid = request.getParameter("userid");
		String center_name = request.getParameter("center_name");
		String applicant_num = request.getParameter("applicant_num");
		String contect_info = request.getParameter("contect_info");
		String apply_state = request.getParameter("apply_state");

		// member table apply(행사 이름), apply_state update(대기)
		MemberDAO mdao = new MemberDAO();
		mdao.applyEvent(event_title, userid);
		mdao.close();
		
		// event table rest = rest - 신청인원
		EventDAO edao = new EventDAO();
		edao.updateRest(applicant_num, idx);
		
		// event_manage table에 데이터 insert
		EventManageDTO emdto = new EventManageDTO(idx, userid, event_title, center_name, applicant_num, contect_info, apply_state);
		edao.insertApply(emdto);

		response.sendRedirect("../event/view.do");
	}
}