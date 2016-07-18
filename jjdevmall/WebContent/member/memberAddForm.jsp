<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#memberbtn').click(function(){
		if($('#memberId').val() == ""){
			$('#sapnid').text("입력하세요");
			$('#memberId').focus();
		}else if($('#memberPw').val() == ""){
			$('#sapnid').text("");
			$('#spanpw').text("입력하세요");
			$('#memberPw').focus();
		}else if($('#memberName').val() == ""){
			$('#spanpw').text("");
			$('#sapnname').text("입력하세요");
			$('#memberName').focus();
		}else if($('.memberSex:checked').length == 0){
			$('#sapnname').text("");
			
			$('#sapnsex').text("선택하세요");
			$('.memberSex').focus();	
		}else if($('#memberAge').val() == ""){
		
			$('#sapage').text("입력하세요");
			$('#memberAge').focus();
			
		}else if($('#memberAdd').val() == ""){
			
			$('#sapadd').text("입력하세요");
			$('#memberAdd').focus();	
		}else{	
			
			$('#addForm').submit();
		}
		
	
});
});
</script>
</head>
<body>
<h1>회원가입</h1>
<form id = "addForm" action="./memberAddAction.jsp" method="post" >
	<div>
	<label>member_id : </label>
	<input type="text" id ="memberId"  name="memberId">
	<span id="sapnid"></span>
	</div>
	<div>
	<label>member_pw : </label>
	<input type="password" id ="memberPw"  name="memberPw">
	<span id="sapnpw"></span>
	</div>
	<div>
	<label>member_name :</label>
	<input type="text" id ="memberName"  name="memberName">
	<span id="sapnname"></span>
	</div>
	<div>
	<label>member_sex : </label>
	<input type="radio" class="memberSex" name="memberSex" value="여자">여자
	<input type="radio" class="memberSex"  name="memberSex" value="남자">남자
	<span id="sapnsex"></span>
	</div>
	<div>
	<label>member_age :</label>
	<input type="text" id ="memberAge"  name="memberAge">
	<span id="sapage"></span>
	</div>
	<div>	
	<label>member_add :</label>
	<input type="text" id ="memberAdd"  name="memberAdd">
	<span id="sapadd"></span>
	</div>
	<input type="button" id="memberbtn" value="확인">
</form>
</body>
</html>