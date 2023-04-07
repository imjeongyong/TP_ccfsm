package noticeboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import menuboard.MenuBoardDAO;
import menuboard.MenuBoardDTO;
import utils.JSFunction;

/**
 * Servlet implementation class NWriteController
 */
@WebServlet("/noticeboard/write.do")
public class NWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/NoticeBoard/Write.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 파일 업로드 처리 ==============================
		// 업로드 디렉터리의 물리적 경로 확인
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");

		// 초기화 매개변수로 설정한 첨부 파일 최대 용량 확인
		ServletContext application = getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));

		// 파일 업로드
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		if (mr == null) {
			// 파일 업로드 실패
			JSFunction.alertLocation(response, "첨부 파일이 제한 용량을 초과합니다.", "../photoboard/write.do");
			return;
		}

		// 2. 파일 업로드 외 처리 ===========================
		// 폼값을 DTO에 저장
		NoticeBoardDTO dto = new NoticeBoardDTO();
		dto.setTitle(mr.getParameter("title"));
		dto.setUserid(mr.getParameter("userid"));
		dto.setContent(mr.getParameter("content"));

		// 원본 파일명과 저장된 파일 이름 설정
		String fileName = mr.getFilesystemName("ofile");
		if (fileName != null) {
			// 첨부 파일이 있을 경우 파일명 변경

			// 새로운 파일명 생성
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;

			// 파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);

			dto.setOfile(fileName);
			dto.setSfile(newFileName);
		}

		// DAO를 통해 DB에 게시 내용 저장
		NoticeBoardDAO dao = new NoticeBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();

		// 성공 or 실패?
		if (result == 1) { // 글쓰기 성공
			response.sendRedirect("../noticeboard/list.do");
		} else { // 글쓰기 실패
			response.sendRedirect("../noticeboard/write.do");
		}
	}
}