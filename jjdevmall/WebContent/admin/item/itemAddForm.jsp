<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#itembtn').click(function(){
			if($('#itemName').val()== ""){
				$('#namespan').text("상품을입력하세요");
				$('#itemName').focus();
			
			}else if($('#itemPrice').val()== "" || isNaN($('#itemPrice').val())){
				$('#namespan').text("");
				$('#pricespan').text("숫자만 입력하세요");
				$('#itemPrice').focus();
			
			}else if($('#itemRate').val()== "" || isNaN($('#itemPrice').val())){
				$('#pricespan').text("");
				$('#ratespan').text("숫자만 입력하세요");
				$('#itemRate').focus();
			}else{
				$('#itemForm').submit();
			}
		});
	});

</script>
</head>
<body>
<h3>상품등록</h3>
<form id="itemForm" action="<%=request.getContextPath()%>/admin/item/itemAddAction.jsp" method="post">
<div>
<label>상품이름 : </label>
<input id ="itemName" type="text" name="itemName">
<span id="namespan"></span>
</div>

<div>
<label>상품가격 : </label>
<input id ="itemPrice" type="text" name="itemPrice">
<span id="pricespan"></span>
</div>

<div>
<label>할인율 : </label>
<input id ="itemRate" type="text" name="itemRate">
<span id="ratespan"></span>
</div>

<input type="button" id="itembtn" value="입력">
</form>
</body>
</html>