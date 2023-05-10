<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
                  href="${pageContext.request.contextPath }/resources/sbadmin/vendor/fontawesome-free/css/all.min.css"
                  rel="stylesheet" type="text/css">
                  <link
                     href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                     rel="stylesheet">
                     <link href="${pageContext.request.contextPath }/resources/sbadmin/css/sb-admin-2.min.css"
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
                             JSTL이 제공하는 태그의 종류와 사용법
                           </h6>
                        </div>
                        <div class="card-body">
                         	<p>java 문자열 검색</p>
                         	<!-- 설정된 문자열에 검색 문자열 java가 포함되었는지 확인하도록 fn:contains 태그를 작성합니다. -->
                         	<p>Hello, Java Server Page! => ${fn:contains("Hello, Java Server Page!","java") }</p>
                         	<!-- 설정된 문자열에 검색 문자열 java가 포함되었는지 확인하도록 fn:contaninsIgnoreCase 태그를 작성  -->
                         	<p>Hello, Java Server Page! => ${fn:containsIgnoreCase("Hello, Java Server Page!","java") }</p>
                         	<!-- 
                         		설정된 문자열에 검색 문자열 java 포함되었는지 확인하도록 fn:containsIgnoreCase 태그를 작성 
                         		대소문자를 상관하지 않고 검색합니다,
                         	 -->
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

   <!-- <script src="/resources/sbadmin/vendor/jquery/jquery.min.js"></script> -->
   <script
      src="/resources/sbadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script
      src="/resources/sbadmin/vendor/jquery-easing/jquery.easing.min.js"></script>
   <script src="/resources/sbadmin/js/sb-admin-2.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</body>
</html>