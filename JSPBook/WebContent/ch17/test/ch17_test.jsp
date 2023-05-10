<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@page errorPage="errorPage_error.jsp" %>
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
                        	<!-- 
                        	문제)
                        	406호 전원의 이름을 , 로 구분하여 각각 나눈 후 ,
                        	아래와 같이 출력해주세요
                        	------------------------------------------------
                        	"김'씨 성을 가진 사람 몇명 : 3
                        	"박'씨 성을 가진 사람 몇명 : 4
                        	"이'씨 성을 가진 사람 몇명 : 5
                        	....
                        	....
                        	------------------------------------------------
                        	[출력 예]
                        	
                        	 **406호 전원의 이름을 넣을 때 스크립틀릿을 활용해도 무방
                        	  또는 JSTL로 바로 값을 넣어도 무방
                        	  
                        	  1.JSTL을 이용하여 작성해주세요
                        	 -->
                        	 <%String name =
                                "유이현,배문기,전다미,오대환,구기현,오미나,진현성,홍기태,이수진,김동혁,박승우,김민경,박경수,정은지,변정민,"+
                                "조성희,황지현,정재균,고영우,박윤수,이성일,신국현,이지영,전지혜,신현근,김지완"; 
                        	 
                        	 Set<String> set406 = new HashSet<>();
                        	 Map<String,Integer> map406 = new HashMap<>();
								%>
								
                        	 <c:set value="<%=set406 %>" var='set406'/>
                        	 <c:set value="<%=map406 %>" var='map406'/>
                        	 
                        	 <c:set value="<%=name %>" var='name'/>
                        	 <c:set value="${fn:split(name,',') }" var="names"/>
                        	 
                        	 <c:forEach var="i" begin="0" end="${fn:length(names)-1 }">
                         		<c:set value="${fn:substring(names[i],0,1) }" var="onename"/>
                         		<p>${names[i]=onename }</p>
                         		
                         		<c:set var='t1' value="${set406.add(names[i])}"/>
                         	</c:forEach>
                         		
                         	<c:forEach var="s" items="${set406}">
                         		<c:set var="t2" value="${map406.put(s,0) }"/>
                         	
                         	</c:forEach>
                         	
                         	 <c:forEach var="i" begin="0" end="${fn:length(names)-1 }">
                         			${map406.put(names[i],map406.get(names[i])+1) }
                         	</c:forEach>
                         	<br>
                         	${map406 }
                        			
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