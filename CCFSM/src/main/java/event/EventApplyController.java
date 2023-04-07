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
		String event_idx = request.getParameter("idx");
		String userid = request.getParameter("userid");
		String center_name = request.getParameter("center_name");
		String applicant_num = request.getParameter("applicant_num");
		String contect_info = request.getParameter("contect_info");
		
		// DB에 저장된 정보를 DTO로 받기
		EventDAO edao = new EventDAO();
		EventDTO edto = edao.eventView(event_idx);
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.searchId(userid);

		// member table apply(행사 이름), apply_state update(대기)
		mdao.applyEvent(edto.getTitle(), userid);
		mdto = mdao.searchId(userid);

		ApplyManageDTO adto = new ApplyManageDTO(edto.getTitle(), userid, center_name, applicant_num, contect_info, mdto.getApply_state());
		edao.insertApply(adto);

		response.sendRedirect("../event/view.do");
	}
}