<%@page import="ch11_test.BoardVO"%>
<%@page import="ch11_test.BoardRepository"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
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
	1. 게시판 목록을 출력해주세요.
		> JSTL을 활용해주세요.
		> 초기 화면에서는 데이터가 없으므로 '조회하실 게시글이 존재하지 않습니다.'를 출력해주세요.
		> 데이터가 있는 경우엔 제목, 작성자, 작성일, 조회수를 맞춰서 데이터를 출력해주세요.
				
		** 초반 데이터는 없습니다.
					제목						작성자		작성일			조회수
	─────────────────────────────────────────────────────────────────────────────
						조회하실 게시글이 존재하지 않습니다.
	─────────────────────────────────────────────────────────────────────────────						
	[ 게시글 등록하기  ]
	
		** 데이터가 있는 경우 아래와 같이 출력됩니다.
				제목						작성자		작성일			조회수
	─────────────────────────────────────────────────────────────────────────────
		게시판 제목입니다......! 1			허나훔		2022-12-12		1245
		게시판 제목입니다......! 2			송서영		2022-12-12		1245
		게시판 제목입니다......! 3			채진영		2022-12-12		1245
		게시판 제목입니다......! 4			배영호		2022-12-12		1245
		게시판 제목입니다......! 5			조은혁		2022-12-12		1245
		게시판 제목입니다......! 6			조현수		2022-12-12		1245
		.....
	─────────────────────────────────────────────────────────────────────────────
	 [ 게시글 등록하기  ]
	
	2. 시큐리티 적용
		> 게시판 등록 페이지를 시큐리티 보호자원으로 설정해주세요.
			- 시큐리티 인증방식 : FORM
			- 시큐리티 로그인 
		> 등록 페이지는 역할명 admin만 접근 가능토록 해주세요.
			- id : admin
			- pw : a1234
		> 로그인 인증 시, loginSecurity.jsp로 이동하여 인증을 진행 할 수 있도록 해주세요.
		> 로그인 인증 실패 시, loginFailed.jsp로 이동할 수 있도록 해주세요.
			  
	3. 게시글 클릭 시, 해당 게시글 상세보기 페이지로 이동합니다.
		> 상세보기 페이지로 이동할 때, 조회수가 상승합니다.
 -->
 게시판 리스트
 
 <table border="1" style="width: 100%">
 	<tr>
 		<th>글번호</th>
 		<th>제목</th>
 		<th>작성자</th>
 		<th>작성일</th>
 		<th>조회수</th>
 	</tr>
 	<%
 		BoardRepository br = BoardRepository.getInstance();
 		List<BoardVO> list = br.selectBoardList();
 		
 		if(list.size() == 0){
 			
 	%>
 	 <tr>
 	 	<th colspan="5">조회하실 게시글이 존재하지 않습니다.
 	 	<c:set value="제이에스티엘 확인하는 용도 문구" var="title"/>
 	 	<p>${title }</p>
 	 	</th>
 	 </tr>
 	<%
 		}else{
 			for(BoardVO vo : list){
 	%>
 	 	 	<c:set value="<%=vo.getNo() %>" var="no"/>
 	 	 	<c:set value="<%=vo.getTitle() %>" var="title"/>
 	 	 	<c:set value="<%=vo.getWriter()%>" var="writer"/>
 	 	 	<c:set value="<%=vo.getRegDate() %>" var="data"/>
 	 	 	<c:set value="<%=vo.getHit() %>" var="hit"/>
 	 
 	
	 	<tr>
	 		<th>${no}</th>
	 		<th>${title}</th>
	 		<th><a href="boardView.jsp?no=<%=vo.getNo() %>">${writer}</a></th>
	 		<th>${data}</th>
	 		<th>${hit}</th>
	 	</tr>
 	<%}} %>
 </table>
	<input type="button" value="글쓰기" onClick="location.href='boardForm.jsp'">
</body>
</html>