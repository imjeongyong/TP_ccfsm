package event;

import java.util.List;
import java.util.Vector;

import common.DBConnPool;

public class EventDAO extends DBConnPool {
	public EventDAO() {
		super();
	}

	// event 테이블에 데이터 insert
	public void insetEvent(EventDTO dto) {
		String query = " insert into event(idx, title, content, start_date, end_date, capa, rest) "
				+ " values(seq_board_num.nextval, ?, ?, to_date(?, 'YYYY-MM-DD HH24:MI'), to_date(?, 'YYYY-MM-DD HH24:MI'), ?, ? )";
		
		System.out.println("dto.getTitle()" + dto.getTitle());
		System.out.println("dto.getContent()" + dto.getContent());
		System.out.println("dto.getStart_date()" + dto.getStart_date());
		System.out.println("dto.getEnd_date())" + dto.getEnd_date());
		System.out.println("dto.getCapa()" + dto.getCapa());
		
		System.out.println(query);


		try {
			psmt = con.prepareStatement(query); // 동적 쿼리문 생성
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getStart_date());
			psmt.setString(4, dto.getEnd_date());
			psmt.setString(5, dto.getCapa());
			psmt.setString(6, dto.getCapa());
			
			System.out.println("query : " + query);
			rs = psmt.executeQuery(); // 쿼리문 실행

			rs.next();

		} catch (Exception e) {
			System.out.println("체험관 행사 입력중 예외 발생");
			e.printStackTrace();
		}
	}
	
	// event에 저장된 데이터 조회 및 dto에 반환
	public List<EventDTO> eventList() {
		List<EventDTO> events = new Vector<EventDTO>();

		// 쿼리문 준비
		String query = "select * from event order by idx desc";

		try {
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery(query);

			// 반환된 게시물 목록을 List 컬렉션에 추가
			while (rs.next()) {

				EventDTO dto = new EventDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setCapa(rs.getString("capa"));
				dto.setRest(rs.getString("rest"));

				events.add(dto);
			}
		} catch (Exception e) {
			System.out.println("체험활동 조회시 예외 발생");
			e.printStackTrace();
		}
		return events; // 목록 반환
	}
	
	// 전달받은 idx로 DB 테이블 조회, 데이터 전송
	public EventDTO eventView(String idx) {
		EventDTO dto = new EventDTO(); // DTO 객체 생성
		String query = "SELECT * FROM event WHERE idx=?"; // 쿼리문 템플릿 준비
		try {
			psmt = con.prepareStatement(query); // 쿼리문 준비
			psmt.setString(1, idx); // 인파라미터 설정
			rs = psmt.executeQuery(); // 쿼리문 실행
			
			if(rs.next()) { // 결과를 DTO 객체에 저장
				dto.setIdx(rs.getString("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setCapa(rs.getString("capa"));
				dto.setRest(rs.getString("rest"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto; // 결과 반환
	}
	
	// event table의 rest(남은인원) = rest - applicant_num(신청인원)
	public void updateRest(String applicant_num, String idx) {
				
		String query = "update event set rest = rest - ? where idx=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, applicant_num);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();
		} catch(Exception e) {
			System.out.println("event table의 rest update중 예외 발생");
			e.printStackTrace();
		}
	}
	
	// event_manager table에 데이터 insert
	public void insertApply(EventManageDTO emdto) {
		//INSERT INTO event_manage(idx, userid, event_title, center_name, applicant_num, contect_info, apply_state)
		//values(seq_board_num.nextval, '테스트유저', '테스트행사', '테스트센터', '3', '010-1234-1234', '대기')
		
		String query = "insert into event_manage(idx, userid, event_title, center_name, applicant_num, contect_info, apply_state) "
					 + " values(seq_board_num.nextval, ?, ?, ?, ?, ?, ?) ";
		
		System.out.println("query : " + query);
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, emdto.getUserid());
			psmt.setString(2, emdto.getEvent_title());
			psmt.setString(3, emdto.getCenter_name());
			psmt.setString(4, emdto.getApplicant_num());
			psmt.setString(5, emdto.getContect_info());
			psmt.setString(6, emdto.getApply_state());
			rs = psmt.executeQuery();
			rs.next();
		} catch(Exception e) {
			System.out.println("event_manage table에 데이터 insert시 예외 발생");
			e.printStackTrace();
		}
	}
}