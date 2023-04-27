<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="vo.MemberVO"%>
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
<link href="/resources/sbadmin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="/resources/sbadmin/css/sb-admin-2.min.css" rel="stylesheet">
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
									<h6 class="m-0 font-weight-bold text-primary">로그인 데이터
										가공페이지</h6>
								</div>
								<div class="card-body">
									<!--
									  1. 로그인 페이지에서 전송한 아이디, 비밀번호를 받는다.
									  
									  2. 전달받은 아이디 , 비밀번호에 해당하는 내 정보가 있는지 없는지 체크
									  	- DAO ,VO를 활용하여 진행할 수 있도록 합니다.
									  	-DAO ,VO 까지는 제가 제공해 드릴께요
									  	
									  3.전달받은 아이디 비밀번호 해당하는 회원인 경우에는 total_memberList.jsp로 이동하여
									  회원 목록 페이지를 완성해주세요
									  - 회원 목록 페이지로 넘어가서 해당 목록 페이제에서는 'a001님! 환영합니다!' 메시지를 출력해주세요
									  
									  4.전달받은 아이디 비밀번호에 해당하지 않는 회원인 경우에는 total_signin.jsp로 이동하여
									  다시 로그인을 진행할 수 있도록 해주시고, 에러 메시지를 출력해 주세요.
									  -->

									<%
										request.setCharacterEncoding("utf-8");

									MemberDAO dao = MemberDAO.getInstance();
									ArrayList<MemberVO> list = dao.getMemberList();

									String id = request.getParameter("id");
									String pw = request.getParameter("pw");

									for (int i = 0; i < list.size(); i++) {
										if (id.equals(list.get(i).getMem_id()) ) {
											request.getRequestDispatcher("total_memberList.jsp").forward(request, response);
											
										}
									}

									request.setAttribute("error", 1);
									request.getRequestDispatcher("total_signin.jsp").forward(request, response);
									%>
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