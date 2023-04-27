<%@page import="dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<meta name="description" content="">
				<meta name="author" content="">
					<title>대덕인재개발원 JSP</title>
					<link
						href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css"
						rel="stylesheet" type="text/css">
						<link
							href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
							rel="stylesheet">
							<link href="/resources/sbadmin/css/sb-admin-2.min.css"
								rel="stylesheet">
</head>
<body id="page-top">
	<div id="wrapper">
		<%@ include file="/include/header.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="/include/nav.jsp"%>
				<div class="container-fluid">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">대덕인재개발원 JSP</h1>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<!-- Basic Card Example -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">
									   회원정보 리스트
									</h6>
								</div>
								<div class="card-body">
									<!--
									 1. 로그인 성공후 넘어왔을 때 'a001님! 환영합니다!' 메시지 출력을 완성해주세요
									 
									 2. 회원 목록에 저장되어 있는 회원 모두 출력해주세요
									 
									 --------------------------------------
									  이미지  |  회원 정보    |  버튼
									--------------------------------------- 
									          | 아이디:a001   |
									  이미지  | 비밀번호:1234 | [상제정보]
									          | 이름:박정수   | 
									          | 성별: 남자    |
									 --------------------------------------
									 
									 3.회원등록 버튼을 클릭시 회원 가입 페이지로 이동하여 회원 등록을 진행 할 수 있도록 해주세요
									  -->
									  
									  <form action="total_signup.jsp">
									  <input type="submit" value="회원등록">
									  <br> <br>
									  <table border="1">
									  <tr>
									  <th>이미지</th>
									  <th>회원 정보</th>
									  <th>버 튼</th>
									  </tr>
									  <%
									    MemberDAO dao = MemberDAO.getInstance();
									  ArrayList list = dao.getMemberList();
									  for(int i=0; i<1;i++){
									  %>
									  <tr>
									    <th><img>123</th>
									    <th>
									    아이디 : <br>
									    비밀번호 : <br>
									    이 름 : <br>
									    성 별 : <br>
									    </th>
									    <th><a href="#">상세정보</a></th>
									  </tr>
									  <%} %>
									  </table>
									  </form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="/include/footer.jsp"%>
		</div>
	</div>

	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
</body>
</html>