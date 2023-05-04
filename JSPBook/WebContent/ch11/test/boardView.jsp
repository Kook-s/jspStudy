<%@page import="ch11_test.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="ch11_test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
	1. 게시글 상세보기를 출력해주세요.
		> JSTL을 활용해주세요. 
	
	[출력 예]
	
	게시판 상세보기
	──────────────────────────────────────────────
	제목 : 
	작성자 작성일 조회수
	──────────────────────────────────────────────
	내용
	──────────────────────────────────────────────
	
	[ 수정  ] [ 삭제  ] [ 목록  ]
	
	2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
	3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
		> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
	4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
 -->
	<%
		int no = 0;
		no = Integer.parseInt(request.getParameter("no"));
		if(no==0){
			no =(int)request.getAttribute("no");
		}
	    BoardRepository br = BoardRepository.getInstance();
	 	BoardVO vo = br.getBoardById(no-1); 
	 	vo.setHit(vo.getHit()+1);
	%>

 	<c:set value="<%=vo.getNo() %>" var="no"/>
	<c:set value="<%=vo.getTitle()%>" var="title" />
	<c:set value="<%=vo.getWriter()%>" var="writer" />
	<c:set value="<%=vo.getContent()%>" var="content" />
	<c:set value="<%=vo.getRegDate()%>" var="data" />
	<c:set value="<%=vo.getHit()%>" var="hit" />

	<table border="1">
		<tr>
			<th>글번호</th>
	 		<th>${no}</th>
		</tr>
		<tr>
			<th>제 목</th>
	 		<th>${title}</th>
		</tr>
		<tr>
			<th>내 용</th>
	 		<th>${content}</th>
		</tr>
		<tr>
			<th>글쓴이</th>
	 		<th>${writer}</th>
		</tr>
		<tr>
			<th>날짜</th>
	 		<th>${data}</th>
		</tr>
		<tr>
			<th>조회수</th>
	 		<th>${hit}</th>
		</tr>	
	</table>
    <input type="button" class="btn btn-primary"  value="수정" onClick="location.href='boardUpdateForm.jsp?no=${no}'">
    <%-- <input type="button" value="삭제" onClick="location.href='boardRemove.jsp?no=${no}'"> --%>
    
   <input type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal" value="삭제">
		   
		  
		  <!-- The Modal -->
		<div class="modal" id="myModal">
  		<div class="modal-dialog">
    	<div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">진짜 정말로 삭제 하겠습니까?</h4>
       <!--  <button type="button" class="btn-close" data-bs-dismiss="modal"></button> -->
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        진짜 삭제하겠습니까?!?!?!?!
        
      </div>

      <!— Modal footer —>
      <div class="modal-footer">
      <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="삭제" onClick="location.href='boardRemove.jsp?no=${no}'">
        <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="취소">
      </div>

    </div>
  </div>
</div>
    
</body>
</html>