<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Customer Input</title>
</head>

<script>
	function Insert()
	{
		var InsertForm = document.customerInsertForm;
		if(!InsertForm.customerName.value) {
			alert("�̸��� �Է����ּ���.");
			InsertForm.customerName.focus();
			return ;
		}
		
		if(!InsertForm.customerPhone1.value) {
			alert("�ڵ��� ��ȣ�� �Է����ּ���.");
			InsertForm.customerPhone1.focus();
			return ;
		}
		if(!InsertForm.customerPhone2.value) {
			alert("�ڵ��� ��ȣ�� �Է����ּ���.");
			InsertForm.customerPhone2.focus();
			return ;
		}
		if(!InsertForm.customerPhone3.value) {
			alert("�ڵ��� ��ȣ�� �Է����ּ���.");
			InsertForm.customerPhone3.focus();
			return ;
		}
		
		if(!InsertForm.customerAddress.value) {
			alert("�ּҸ� �Է����ּ���.");
			InsertForm.customerAddress.focus();
			return ;
		}
		
		if(!InsertForm.customerGender.value) {
			alert("������ �Է����ּ���.");
			InsertForm.customerGender.focus();
			return ;
		}
		
		if(!(InsertForm.customerGender.value == "Female" || InsertForm.customerGender.value == "Male")) {
			alert("������ ���Ŀ� �°� �Է����ּ���.");
			InsertForm.customerGender.focus();
			return ;
		}
		
		InsertForm.submit();
	}
</script>
<body>
	<form name="customerInsertForm" id="customerInsertForm" action="customerInsert.jsp">
		<br>
		�̸�
		<br>
		<input type="text" name="customerName" id="customerName" maxlength="30">
		<br>
		�ڵ��� ��ȣ (###-###-####)
		<br>
		<input type="text" name="customerPhone1" id="customerPhone1" size="3" maxlength="3">
		<input type="text" name="customerPhone2" id="customerPhone2" size="3" maxlength="3">
		<input type="text" name="customerPhone3" id="customerPhone3" size="3" maxlength="4">
		<br>
		�ּ�
		<br>
		<input type="text" name="customerAddress" id="customerAddress" maxlength="40">
		<br>
		���� (Female / Male)
		<br>
		<input type="text" name="customerGender" id="customerGender" maxlength="10">
		<br>
	</form>
	<input type="button" value="�Է�" id="customerInput" OnClick="javascript:Insert();">
</body>
</html>