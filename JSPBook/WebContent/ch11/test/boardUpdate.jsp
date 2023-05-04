<%@page import="ch11_test.BoardVO"%>
<%@page import="ch11_test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page errorPage="exceptionBoard_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시글 수정을 처리해주세요.
		> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 수정 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->
 
 <%
 	int no = Integer.parseInt(request.getParameter("no"));
 	String title = request.getParameter("title");
 	String writer = request.getParameter("writer");
 	String content = request.getParameter("content");
	
 	BoardRepository br = BoardRepository.getInstance();
 	
	BoardVO vo = br.getBoardById(no-1);
	
 	vo.setTitle(title);
 	vo.setWriter(writer);
 	vo.setContent(content);
 
 	br.updateBoard(vo);
 	request.setAttribute("no", no); 
  	request.getRequestDispatcher("boardView.jsp").forward(request, response); 
 
 %>
</body>
</html>