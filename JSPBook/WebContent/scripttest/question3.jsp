<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(function(){
	var name=""		
	
	$(".dtext").on("click",function(){
		$("#resBox").append($(this).text()+"클릭되었습니다.<br>");
		
		$("#resBox").scrollTop($("#resBox")[0].scrollHeight);
		
		if(name==""){
		$(this).css("background","yellow")
		name=$(this)	
		}else if(name!=""){
			
		num = $(this).text()
		$(this).text(name.text())	
		name.text(num)
		name.css("background","none")
		name=""
		}
	})
	
	
	$("#pBtn").on("click",function(){
		
			num =$('#boxSelect option:selected').attr("value")
			num2 = $("#content").val()
			
			if(num==1){
				$("#firstDiv").text(num2)
			}
			if(num==2){
				$("#secondDiv").text(num2)
			}
			if(num==3){
				$("#thirdDiv").text(num2)
			}
			if(num==4){
				$("#fourDiv").text(num2)
			}if(num==5){
				$(".dtext").text(num2)
			}
			
	})
	
})


</script>
 <style type="text/css">
 	.dtext{
 	border: 1px solid black;
 	width: 50%;
 	}
 	
 	#resBox{
 	border: 1px solid black;
 	width: 50%;
 	height:100px;
 	overflow-Y: scroll;
 	}
 </style>
</head>
<body>
		<!-- 
		총 4가지의 div가 있습니다.
		제일 먼저 선택한(클릭) div에 있는 텍스트를 
		두번째 눌린 div로 옮기는데 이때, 서로 박스에 들어있는 텍스트를 교체한다.
	 -->
	<div class="dtext" id="firstDiv">첫번째 박스</div>
	<div class="dtext" id="secondDiv">두번째 박스</div>
	<div class="dtext" id="thirdDiv">세번째 박스</div>
	<div class="dtext" id="fourDiv">네번째 박스</div>
	
	<br/>
	<hr/>
	<br/>
	
	<div style="overflow-y: scroll;" id="history"></div>
	<!-- 
		아래 select box에 있는 박스 순서를 선택하고
		출력 할 텍스트를 입력 후에 출력 버튼을 클릭 시,
		내가 입력한 텍스트가 선택한 div 박스안에 
		내가 입력한 텍스트가 추가로 출력되게 해주세요.
	 -->
	 
	 <div id="resBox"></div>
	 
	<select id="boxSelect">
		<option value="1">첫번째 박스</option>
		<option value="2">두번째 박스</option>
		<option value="3">세번째 박스</option>
		<option value="4">네번째 박스</option>
		<option value="5">모든 박스</option>
	</select>
	<input type="text" id="content"/>
	<input type="button" value="출력" id="pBtn"/>
		
		
</body>
</html>