<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="ch11_test.BoardVO"%>
<%@page import="ch11_test.BoardRepository"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	1. 게시글 등록을 처리해주세요.
		> 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
		> 게시글 등록 실패 시, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
 -->

	<%
		request.setCharacterEncoding("utf-8");
	String realFolder = request.getServletContext().getRealPath("/resources/images");
	String encType = "utf-8";

	int maxSize = 5 * 1024 * 1024;

	File file = new File(realFolder);
	if (!file.exists()) {
		file.mkdirs();
	}

	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000);
	upload.setSizeThreshold(maxSize);
	upload.setRepositoryPath(realFolder);
	
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();

	String title = "";//
	String content = "";//
	String writer = "";//
	String regDate = ""; 
	String fileName = "";
	
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
	regDate = format.format(date);
	
	while (params.hasNext()) {
		FileItem item = (FileItem) params.next();

		if (item.isFormField()) {
			String fieldName = item.getFieldName();

			if (fieldName.equals("title")) {
				title = item.getString(encType);
			} else if (fieldName.equals("content")) {
				content = item.getString(encType);
			} else if (fieldName.equals("writer")) {
				writer = item.getString(encType);
			}

		} else {
			String fileFieldName = item.getFieldName();
			fileName = item.getName();
			String contentType = item.getContentType();
			String origianlFileName = fileName;
			long fileSize = item.getSize();
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile);

		}
	}
	BoardRepository dao = BoardRepository.getInstance();
	
	BoardVO vo  = new BoardVO();
	
	vo.setTitle(title);
	vo.setContent(content);
	vo.setWriter(writer);
	vo.setRegDate(regDate);
	vo.setNo(dao.getNo());
	
	vo.setFileName(fileName);
	
    dao.addBoard(vo);
    
	/* ProductRepository dao = ProductRepository.getInstance();

	Product newProduct = new Product();
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price);
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setCondition(condition);
	newProduct.setFilename(fileName); 

	dao.addProduct(newProduct);*/

	 response.sendRedirect("boardList.jsp"); 
	%>
	
<%= title %>
<%= content %>
<%= writer %>
<%= regDate %>
<%= fileName %>


</body>
</html>