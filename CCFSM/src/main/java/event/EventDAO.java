package event;

import java.util.List;
import java.util.Vector;

import common.DBConnPool;

public class EventDAO extends DBConnPool {
	public EventDAO() {
		super();
	}

	// event 테이블에 데이터 insert
	public void insertEvent(EventDTO dto) {

		String query = " insert into event(idx, title, content, start_date, end_date, capa, event_state) "
				+ " values(seq_board_num.nextval, ?, ?, to_date(?, 'YYYY-MM-DD HH24:MI'), to_date(?, 'YYYY-MM-DD HH24:MI'), ?, ?)";
		
		System.out.println("dto.getTitle()" + dto.getTitle());
		System.out.println("dto.getContent()" + dto.getContent());
		System.out.println("dto.getStart_date()" + dto.getStart_date());
		System.out.println("dto.getEnd_date())" + dto.getEnd_date());
		System.out.println("dto.getCapa()" + dto.getCapa());

		try {
			psmt = con.prepareStatement(query); // 동적 쿼리문 생성
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getStart_date());
			psmt.setString(4, dto.getEnd_date());
			psmt.setString(5, dto.getCapa());
			psmt.setString(6, "모집중");
			
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
			while(rs.next()) {

				EventDTO dto = new EventDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setCapa(rs.getString("capa"));
				dto.setEvent_state(rs.getString("event_state"));

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
				dto.setEvent_state(rs.getString("event_state"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto; // 결과 반환
	}
	
	// apply_manager table에 데이터 insert
	public void insertApply(ApplyManageDTO adto) {
		String query = "insert into apply_manage(idx, event_title, applicant_id, applicant_center, applicant_num, contect_info, apply_state) "
					 + " values(seq_board_num.nextval, ?, ?, ?, ?, ?, ?) ";
				
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, adto.getEvent_title());
			psmt.setString(2, adto.getApplicant_id());
			psmt.setString(3, adto.getApplicant_center());
			psmt.setString(4, adto.getApplicant_num());
			psmt.setString(5, adto.getContect_info());
			psmt.setString(6, adto.getApply_state());
			rs = psmt.executeQuery();
			rs.next();
		} catch(Exception e) {
			System.out.println("apply_manage table에 데이터 insert시 예외 발생");
			e.printStackTrace();
		}
	}
	
	// 테이블 데이터 반환
	public List<ApplyManageDTO> applyList() {
		List<ApplyManageDTO> apply_list = new Vector<ApplyManageDTO>();

		// 쿼리문 준비
		String query = "select * from apply_manage order by regidate desc";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery(); // 쿼리문 실행

			// 반환된 게시물 목록을 List 컬렉션에 추가

			while (rs.next()) {

				ApplyManageDTO dto = new ApplyManageDTO();

				dto.setIdx(rs.getString("idx"));
				dto.setEvent_title(rs.getString("event_title"));
				dto.setApplicant_id(rs.getString("applicant_id"));
				dto.setApplicant_center(rs.getString("applicant_center"));
				dto.setApplicant_num(rs.getString("applicant_num"));
				dto.setContect_info(rs.getString("contect_info"));
				dto.setApply_state(rs.getString("apply_state"));
				dto.setRegidate(rs.getString("regidate"));

				apply_list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("승인할 신청 조회중 예외 발생");
			e.printStackTrace();
		}
		return apply_list; // 목록 반환
	}
	
	// event table update(event_state: 모집중->모집완료)
	public void state_update(String event_title) {
		String query = "update event set event_state='모집완료' where title=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, event_title);
			rs = psmt.executeQuery();
			rs.next();
		} catch(Exception e) {
			System.out.println("event table에서 event_state 업데이트중 예외 발생");
			e.printStackTrace();
		}
	}
	
	// apply_manage table update(apply_state: 대기->완료)
	public void apply_manage_update(String apply_idx) {
		String query = "update apply_manage set apply_state='완료' where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, apply_idx);
			rs = psmt.executeQuery();
			rs.next();
		} catch(Exception e) {
			System.out.println("apply_manage table에서 apply_state 업데이트중 예외 발생");
			e.printStackTrace();
		}
	}
}