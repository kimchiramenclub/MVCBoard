<%@ page import="fileupload.MyfileDTO" %>
<%@ page import="fileupload.MyfileDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB myfile 테이블에 등록된 파일 목록 보기</title>
</head>
<body>
<h2>DB myfile 테이블에 등록된 파일 목록 보기</h2>
<a href  = "FileUploadMain.jsp">파일 등록하기</a>
<%
 MyfileDAO dao = new MyfileDAO(application);
 List<MyfileDTO> fileLists = dao.myFileList();
 dao.close();
 %>
 <table border="1">
   <!-- 반환받은 값을 이용해서 목록을 반복 출력 -->
   <tr>
      <th>No</th><th>작성자</th><th>제목</th><th>카테고리</th><th>원본파일명</th><th>저장된 파일명</th><th>작성일</th>
   </tr><th></th>
   <%for(MyfileDTO f: fileLists) { %>
   <tr>
      <td><%= f.getIdx() %></td>
      <td><%= f.getName() %>/td>
      <td><%= f.getTitle() %></td>
      <td><%= f.getCate() %></td>
      <td><%= f.getOfile() %></td>
      <td><%= f.getSfile() %></td>
      <td><%= f.getPostdate() %></td>
      <td><a href="Download.jsp?oName=<%= URLEncoder.encode(f.getOfile(),"UTF-8") %>&sName=<%= URLEncoder.encode(f.getSfile(),"UTF-8") %>">[다운로드]</a></td>
   </tr>
  <% } %>
  
 </table>
</body>
</html>