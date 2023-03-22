package recipeboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import menuboard.MenuBoardDTO;

public class RecipeBoardDAO extends DBConnPool{

	public RecipeBoardDAO() {
		super();
	}

	// 검색 조건에 맞는 게시물의 개수를 반환합니다.
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		// 쿼리문 준비
		String query = "SELECT COUNT(*) FROM recipeboard";
		// 검색 조건이 있다면 WHERE절로 추가
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 쿼리문 실행
			rs.next();
			totalCount = rs.getInt("COUNT(*)");
		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}

		return totalCount; // 게시물 개수를 서플릿으로 반환
	}

	// 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
	public List<RecipeBoardDTO> selectListPage(Map<String, Object> map) {
		List<RecipeBoardDTO> board = new Vector<RecipeBoardDTO>();

		// 쿼리문 준비
		String query = " " + " SELECT * FROM ( " + " SELECT Tb.*, ROWNUM rNum FROM ( " + " SELECT * FROM recipeboard ";
		// 검색 조건이 있다면 WHERE절로 추가
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
		}

		query += " ORDER BY idx DESC" + " ) Tb " + " ) " + " WHERE rNum BETWEEN ? AND ?"; // 게시물 구간은 인파라미터로..

		try {
			psmt = con.prepareStatement(query); // 동적 쿼리문 생성
			psmt.setString(1, map.get("start").toString()); // 인파라미터 설정
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery(); // 쿼리문 실행

			// 반환된 게시물 목록을 List 컬렉션에 추가

			while (rs.next()) {

				RecipeBoardDTO dto = new RecipeBoardDTO();

				dto.setIdx(rs.getString("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setVisitcount(rs.getInt("visitcount"));

				board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board; // 목록 반환
	}
	
	public int insertWrite(RecipeBoardDTO dto) {
		int result = 0;

		try {
			String query = "INSERT INTO recipeboard ( " + " idx, title, content, ofile, sfile) " + " VALUES (  "
					+ " seq_board_num.NEXTVAL, ?, ?, ?, ?)";
			
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	
	// 주어진 일련번호에 해당하는 게시물을 DTO에 담아 반환합니다.
	public RecipeBoardDTO selectView(String idx) {
		RecipeBoardDTO dto = new RecipeBoardDTO(); // DTO 객체 생성
		String query = "SELECT * FROM recipeboard WHERE idx=?"; // 쿼리문 템플릿 준비
		try {
			psmt = con.prepareStatement(query); // 쿼리문 준비
			psmt.setString(1, idx); // 인파라미터 설정
			rs = psmt.executeQuery(); // 쿼리문 실행
			
			if(rs.next()) { // 결과를 DTO 객체에 저장
				dto.setIdx(rs.getString("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setVisitcount(rs.getInt("visitcount"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto; // 결과 반환
	}
	

	// 주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킵니다.
	public void updateVisitCount(String idx) {
		String query = "UPDATE recipeboard SET "
					+ " visitcount=visitcount+1 "
					+ " WHERE idx=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	// 다운로드 횟수를 1 증가시킵니다.
	public void downCountPlus(String idx) {
		String sql = "UPDATE recipeboard SET "
					+ " downcount=downcount+1 "
					+ " WHERE idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	// 지정한 일련번호의 게시물을 삭제합니다.
	public int deletePost(String idx) {
		int result = 0;
		
		try {
			String query = "DELETE FROM recipeboard WHERE idx=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 게시글 데이터를 받아 DB에 저장되어 있던 내용을 갱신합니다(파일 업로드 지원).
	public int updatePost(RecipeBoardDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE recipeboard"
						+ " SET title=?, content=?, ofile=?, sfile=? "
						+ " WHERE idx=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getIdx());
			
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시물 수정중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}