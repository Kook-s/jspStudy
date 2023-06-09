<%@page import="ch11_test.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="vo.MemberVO"%>
<%@page import="ch11_test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="exceptionBoard_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	삭제할 게시글 정보를 넘겨받고, 삭제를 진행해주세요.
	삭제가 실패하여 에러가 발생 할 경우, exceptionBoard_error.jsp 페이지로 이동할 수 있게 해주세요.
	
	삭제 완료 후, 게시판 목록 페이지(boardList.jsp)로 이동해주세요.
 -->
	<!-- 
	1. 게시글 삭제를 처리해주세요.
		> 삭제 성공 후, 상세보기 페이지(boardList.jsp)로 이동해주세요.
		> 삭제 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->

	<%
		int no = Integer.parseInt(request.getParameter("no"));
	BoardRepository br = BoardRepository.getInstance();
	br.deleteBoard(no - 1);

	List<BoardVO> list = br.selectBoardList();
	for (BoardVO vo : list) {
		if (no < vo.getNo()){
			vo.setNo(vo.getNo() - 1);
		br.updateBoard(vo);
		br.minNo();
		}
	}

	response.sendRedirect("boardList.jsp");
	%>
</body>
</html>