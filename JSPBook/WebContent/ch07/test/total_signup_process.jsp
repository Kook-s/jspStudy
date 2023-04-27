<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.io.File"%>
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
									   회원가입 페이지 정보가공
									</h6>
								</div>
								<div class="card-body">
								<!-- 
								 1.회원가입 폼에서 넘겨받은 일반 데티어 파일 데이터를 전달받아서
								 일반 데이터와 파일명을 저장하여 회원 객체 하나를 저장 후 회우너 목록에 해당하는 리스트에 저장하여
								 목록 페이지에서 리스트데이터를 활용할 수 있도록 해주세요
								 -DAO , VO 활용
								 
								 2.회원가입이 완료되면 total_signin.jsp로 이동하여 로그인을 진행 할 수 있도록 해주세요
								 -->
								 
								<%
								 String fileUploadPath = "C:\\Users\\PC-20\\git\\jspStudy\\JSPBook\\WebContent\\ch07\\test\\img";
								
								File tempFile = new File(fileUploadPath);
								if(!tempFile.exists()){
									tempFile.mkdirs();
								}
								MemberDAO dao = MemberDAO.getInstance();
								MemberVO vo = new MemberVO();
								
								DiskFileUpload upload = new DiskFileUpload();
								upload.setSizeMax(5*1024*1024); //업로드할 파일의 최대 크기 (byte)
								upload.setSizeThreshold(4096); // 메모리상에 저장할 최대 크기()
								upload.setRepositoryPath(fileUploadPath); //업로드된 파일을 임시로 저장할 경로
								
								List item =  upload.parseRequest(request);
							    Iterator params = item.iterator();
							    
							    int maxSize = 4*1024*1024; //파일 업로드 시 1개의 파일 당 사이즈 (최대 사이즈)
							    
							      while(params.hasNext()){
							    	  FileItem fileItem = (FileItem)params.next();
							    	  
							    	  if(fileItem.isFormField()){ //홈페이지에서 전송된 요청 파라미터가 일반 데이터 일 때
							    		  String name = fileItem.getFieldName();
							    	     String value =  fileItem.getString("utf-8");
							    	     out.print(name + "=" + value +"<br>");
							    	     
							    	     if(name.equals("id")){vo.setMem_id(value);}
							    	     if(name.equals("pw")){vo.setMem_pw(value);}
							    	     if(name.equals("name")){vo.setMem_name(value);}
							    	     if(name.equals("gender")){vo.setMem_sex(value);}
							    	     
							    	  }else{
							    		  String fileFieldName = fileItem.getFieldName();
							    		  String fileName = fileItem.getName();
							    		  String contentType = fileItem.getContentType();
							    		  long filesize = fileItem.getSize();
							    		  
							    		  File file = new File(fileUploadPath + "/"+fileName);
							    		  if(maxSize <filesize){
							    			  out.print("파일 크기를 초과하였습니다<br>");
							    		  }else{
							    			  fileItem.write(file);
							    			  vo.setFilename(fileName);
							    			  
							    		  }
							    		  
							    		  out.println("-------------------------------------<br>");
							    		  out.println("요청 파라미터 이름 : "+fileFieldName+"<br>");
							    		  out.println("저장 파일 이름 : "+fileName+"<br>");
							    		  out.println("파일 콘텐츠 이름 : "+contentType+"<br>");
							    		  out.println("파일 크기 : "+filesize+"<br>");
							    	  }
							      }
							    
							    dao.insertMember(vo);
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