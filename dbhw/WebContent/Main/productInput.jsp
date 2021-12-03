<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Product Input</title>
</head>
<script>
	function Insert()
	{
		var InsertForm = document.productInsertForm;
		if(!InsertForm.productName.value) {
			alert("��ǰ �̸��� �Է����ּ���.");
			InsertForm.productName.focus();
			return ;
		}
		if(!InsertForm.productID.value) {
			alert("��ǰ ID�� �Է����ּ���.");
			InsertForm.productID.focus();
			return ;
		}
		if(!InsertForm.supplierName.value) {
			alert("������ �̸��� �Է����ּ���.");
			InsertForm.supplierName.focus();
			return ;
		}
		if(InsertForm.productID.value.length != 8) {
			alert("��ǰ ID�� ���Ŀ� �°� �Է����ּ���.");
			InsertForm.supplierName.focus();
			return ;
		}
		
		InsertForm.submit();
	}
</script>
<body>
	<form name="productInsertForm" id="productInsertForm" action="productInsert.jsp">
		<br>
		��ǰ �̸�
		<br>
		<input type="text" name="productName" id="productName" maxlength="30">
		<br>
		��ǰ ID (########)
		<br>
		<input type="text" name="productID" id="productID" size="8" maxlength="8">
		<br>
		������ �̸�
		<br>
		<input type="text" name="supplierName" id="supplierName" maxlength="30">
		<br>
	</form>
	<input type="button" value="�Է�" id="productInput" OnClick="javascript:Insert();">
</body>
</html>