<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//폼 페이지에서 입력한 한글을 처리하도록 request 내장 객체의 setCharacterEncoding 메소드에 문자 인코딩 유형 UTF-8로 작성
  request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

if(id.equals("admin") && pw.equals("1234")){
  response.sendRedirect("response01_success.jsp");
}else{
	response.sendRedirect("response01_failed.jsp");
}
%>