package model2.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet
public class ViewController extends HttpServlet
{
		
		public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
			//2. DAO 객체 생성
			MVCBoardDAO dao = new MVCBoardDAO();
			//3. 게시물의 일련번호를 매개변수로 받음
			String idx = req.getParameter("idx");
			//4. 조회수를 먼저 증가시킴
			//updateVisitCount() : 일련번호(idx)로 조회수 증가  
			dao.updateVisitCount(idx);
			//5. 게시물 내용 가져오기
			//selectView() : 일련번호(idx)로 게시물 조회 
			MVCBoardDTO dto = dto.selectView(idx);
			//6. 게시물 내용을 줄바꿈 처리
			dto.setContent(dto.getContent().replace("\r\n", "<br>"));
			//7. DTO객체를 request 영역에 저장
			req.setAttribute("dto", dto);
			//8. View.jsp로 포워드
			req.getRequestDispatcher("/14MVCBoard/View.jsp").forward(req, resp);
		}
	
}
