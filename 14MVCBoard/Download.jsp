<%@ page import="utils.JSFunction"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/Uploads"); 
String saveFileName = request.getParameter("sName");
String originalFilename = request.getParameter("oName");

try{
	//파일을 찾아 입력 스트림을 생성 
	File file = new File(saveDirectory, saveFileName);
	InputStream inStream = new FileInputStream(file);
	
	// 한글 파일명 깨짐 방지 
	 String client = request.getHeader("User-Agent"); //클라이언트의 웹 브라우저의 종류를 알수있음
	 if(client.indexOf("WOW64") == -1){  //WOW64란 Windows on Windows 64bit
		 originalFilename = new String(originalFilename.getBytes("UTF-8"),"ISO-8859-1");
	 }else{
		 
		 originalFilename = new String(originalFilename.getBytes("KSC5601"),"ISO-8859-1");
	 }
	//파일 다운로드용 응답헤더 설정
	 response.reset();
	    response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition", 
	                       "attachment; filename=\"" + originalFilename + "\"");
	    response.setHeader("Content-Length", "" + file.length() );
	
	 out.clear();  //출력스트림 초기화
	 //response 내장 객체로부터 새로운 출력 스트림 생성 
	 OutputStream outStream = response.getOutputStream();
	  
	 //출력스트림에 파일 내용 출력
	 byte b[] = new byte[(int)file.length()];
	 int readBuffer = 0;
	 while((readBuffer = inStream.read(b))>0){
		 outStream.write(b , 0 , readBuffer);
		 
	 }
	//입/출력 스트림 닫음  
	 inStream.close();
	 outStream.close();
	 
} catch(FileNotFoundException e){
	JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
} catch(Exception e1){
	JSFunction.alertBack("예외 발생", out);
}

%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일다운로드 </title>
</head>
<body>

</body>
</html> -->