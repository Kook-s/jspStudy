<%@page import="ch11_test.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="ch11_test.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img{
width: 100px;
height: 100px;
}
</style>

</head>
<body>
<!-- 
	첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.
	- 자료실을 구성하는데 필요한 내용 모두는 board를 작성했던 방식을 참고하여 작성한다.
	
	1. 파일의 유형에 따라 유형에 맞는 default 이미지로 리스트를 구성하세요.
	
	[출력 예]
	
	자료실
	[pdf]	[excel]	[excel]	[ppt]
	[image] [txt]	[word]	[txt]
	[etc]	[etc]	[pdf]	[ppt]
	[...]
	
	목록 
 -->
 0504 금 8시 제출 나머지 파일 형식 기본 이지미로 대처함 
 어린이날이라 신나서 멈춤
 <table border="1" style="width: 10%">

 	<%
 		BoardRepository br = BoardRepository.getInstance();
 		List<BoardVO> list = br.selectBoardList();
 		
 		if(list.size() == 0){
 	%>
 	 <tr>
 	 	<th colspan="5">자료실 게시글이 존재하지 않습니다.
 	 	<c:set value="제이에스티엘 확인하는 용도 문구" var="title"/>
 	 	<p>${title }</p>
 	 	</th>
 	 </tr>
 	<%
 		}else{
 			for(BoardVO vo : list){
 	%>
 	 	 	
 	 	 	<c:set value="<%=vo.getFileName() %>" var="file"/>
 	 
 	
	 	<tr>
	 	
	 		<th><a href="${pageContext.request.contextPath }/resources/images/${file}">
	 		<%
	 			if(vo.getFileName().contains("png")||vo.getFileName().contains("jpg")){
	 		%>
	 		<img src="free-icon-img-8760611.png">
	 		<%
	 			}
	 		
	 			else if(vo.getFileName().contains("ppt")&&vo.getFileName().contains("pptx")){
	 		%>
	 		<img src="free-icon-pdf-337946.png">
	 		<%
	 			}
	 		
	 			else if(vo.getFileName().contains("pdf")){
	 		%>
	 		<img src="free-icon-ppt-337949.png">
	 		<%
	 			}
	 		
	 			else{
	 		%>
	 				<img src="free-icon-docs-281760.png">
	 		<%
	 			}
	 		%>
	 		
	 		</a></th>
	 		
	 	</tr>
 	<%}} %> 
 
</body>
</html>