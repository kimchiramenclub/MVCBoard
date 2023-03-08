<%@ page import="fileupload.MyfileDTO"%>
<%@ page import="fileupload.MyfileDAO"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/Uploads"); // 저장할 디렉토리 경로 저장
int maxPostSize = 1024 * 1000; //파일최대크기(1Mbyte)
String encoding = "UTF-8";

try {
	//1. MultipartRequest 객체 생성

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);

	//2. 새로운 파일명 생성 ("업로드일시.확장자")
	String fileName = mr.getFilesystemName("attachedFile"); //현재파일이름 
	String ext = fileName.substring(fileName.lastIndexOf(".")); //파일확장자  예) myfile.sql

	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String newFileName = now + ext; //새로운 파일 이름 ("업로드일시.확장자")

	//3. 파일명 변경 
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);

	//4. 다른 폼값 받기 
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer();
	if (cateArray == null) {
		cateBuf.append("선택사항 없음");
	} else {
		for (String s : cateArray) {
	cateBuf.append(s + ","); //사진,과제,워드,음원 
		}
	}

	//5. DTO생성 
	MyfileDTO dto = new MyfileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setCate(cateBuf.toString());
	dto.setOfile(fileName);
	dto.setSfile(newFileName);
	
	//6. DAO를 통해 데이베이스 연동하여 myfile테이블에 입력 
	
	MyfileDAO dao = new MyfileDAO(application);
	dao.insertFile(dto);
	dao.close();

	//7. 파일목록 JSP로 리다이렉션 (페이지 이동) 
	response.sendRedirect("FileList.jsp");
} catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMessage", "파일 업로드 오류");
	            request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>