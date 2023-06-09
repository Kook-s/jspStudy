<%@page import="ch11_test.BoardVO"%>
<%@page import="ch11_test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	1. 게시판 수정 페이지를 작성해주세요.
	
	[출력 예]
	
	게시글 등록
	─────────────────────────────
	제목 : 제목입니다1
	작성자 : 홍길동
	내용 : 내용입니다1
	─────────────────────────────
	[ 수정  ] [ 목록 ]
	
	2. 수정 버튼 클릭 시, 게시글 수정(boardUpdate.jsp)을 진행해주세요.
	3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
 -->
 <%

	int no = Integer.parseInt(request.getParameter("no"));
	BoardRepository br = BoardRepository.getInstance();
	BoardVO vo = br.getBoardById(no-1); 
 %>

	<c:set value="<%=vo.getNo()%>" var="no" />
	<c:set value="<%=vo.getTitle()%>" var="title" />
	<c:set value="<%=vo.getWriter()%>" var="writer" />
	<c:set value="<%=vo.getContent()%>" var="content" />

<form action="boardUpdate.jsp">
	<input type="hidden" name="no" value="${no }">
	<table border="1">
		<tr>
			<th>제 목</th>
	 		<th><input type='text' value="${title}" name='title'></th>
		</tr>
		<tr>
			<th>글쓴이</th>
	 		<th><input type='text' value="${writer}" name='writer'></th>
		</tr>
		<tr>
			<th>내 용</th>
	 		<th><input type='text' value="${content}" name='content'></th>
		</tr>
	</table>
	<input type="submit" value="수정">
	 <input type="button" value="목록" onClick="location.href='boardList.jsp'">
 </form>
 
</body>
</html>