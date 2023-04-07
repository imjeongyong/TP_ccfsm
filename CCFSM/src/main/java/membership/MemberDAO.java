package membership;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {

	public MemberDAO() {
		super();
	}

	// 로그인 처리 메서드
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
		String query = "SELECT * FROM member WHERE id=? AND pass=?"; // 쿼리문 템플릿

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, uid); // 쿼리문의 첫 번째 인파라미터에 값 설정
			psmt.setString(2, upass); // 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행

			// 결과 처리
			if (rs.next()) {
				// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto; // DTO 객체 반환
	}

	// ID 중복검사
	public boolean chkId(String uid) {
		boolean duplicated = false;
		String query = "SELECT * FROM member WHERE id=?";

		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			psmt.setString(1, uid); // 쿼리문의 첫 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행, 중복->true, 생성가능->false

			// 결과 처리
			if (rs.next()) {
				duplicated = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return duplicated; // 체크 결과 반환
	}

	// 회원 가입 메서드
	public void addMember(String uid, String upass, String uemail, String uname) {
		String query = " INSERT INTO MEMBER (id, email, pass, name) VALUES (?, ?, ?, ?) ";
		
		try {
			// 쿼리 실행
			psmt = con.prepareStatement(query); // 동적 쿼리문 준비
			System.out.println("동적 쿼리문 준비 완료");
			psmt.setString(1, uid); // 쿼리문의 첫 번째 인파라미터에 값 설정
			psmt.setString(2, uemail); // 쿼리문의 두 번째 인파라미터에 값 설정
			psmt.setString(3, upass); // 쿼리문의 두 번째 인파라미터에 값 설정
			psmt.setString(4, uname); // 쿼리문의 두 번째 인파라미터에 값 설정
			rs = psmt.executeQuery(); // 쿼리문 실행
			rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// id로 DB테이블 정보 검색 및 dto로 반환
	public MemberDTO searchId(String userid) {
		MemberDTO dto = new MemberDTO();
		
		String query = "select * from member where id=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, userid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setApply_event(rs.getString("apply_event"));
				dto.setApply_state(rs.getString("apply_state"));
			} 
			
			} catch(Exception e) {
				System.out.println("id 검색중 예외 발생");
				e.printStackTrace();
		}
		return dto;
	}
	
	// member table update(apply_event->행사명, apply_state->대기)
	public void applyEvent(String event_name, String userid) {
		String query = "update member set apply_event=?, apply_state='대기' where id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, event_name);
			psmt.setString(2, userid);
			rs = psmt.executeQuery();
			rs.next();
		} catch (Exception e) {
			System.out.println("체험관 신청 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	// member table update(apply_state: 대기->승인)
	public void apply_update(String applicant_id) {
		String query = "update member set apply_state='완료' where id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, applicant_id);
			rs = psmt.executeQuery();
			rs.next();
		} catch(Exception e) {
			System.out.println("member table에서 apply_state 업데이트중 예외 발생");
			e.printStackTrace();
		}
	}
}