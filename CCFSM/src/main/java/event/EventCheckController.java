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
 * Servlet implementation class EventCheckController
 */
@WebServlet("/event/check.do")
public class EventCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 로그인한 아이디를 변수에 저장
		String userid = request.getParameter("userid");
				
		if(userid.isEmpty()) { // 로그인 X
			request.setAttribute("currentState", "로그인을 해주세요..");
			request.getRequestDispatcher("/Event/View.jsp").forward(request, response);
		} else {  // 로그인 O			
		// 세션에 저장된 아이디로 member테이블 조회, dto에 반환
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.searchId(userid);
		dao.close();
		
		// 반환 멘트 작성
		if(dto.getApply_event() == null) {
			request.setAttribute("currentState", "현재 신청중인 체험관 활동이 없습니다.");
		} else {
			request.setAttribute("currentState", dto.getApply_event() + " 신청했으며, 현재 상태는 승인 " + dto.getApply_state() + "입니다.");
		}
		
		// 저장한 데이터 전송
		request.getRequestDispatcher("/event/view.do").forward(request, response);
		}
	}
}