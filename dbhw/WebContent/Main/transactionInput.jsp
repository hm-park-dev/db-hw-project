<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Transaction Input</title>
</head>
<script>
	function Insert()
	{
		var InsertForm = document.transactionInsertForm;
		
		if(!InsertForm.transactionNumber1.value) {
			alert("�ŷ� ��ȣ�� �Է����ּ���.");
			InsertForm.transactionNumber1.focus();
			return ;
		}
		if(InsertForm.transactionNumber1.value.length != 6) {
			alert("�ŷ� ��ȣ�� ���Ŀ� �°� �Է����ּ���.");
			InsertForm.transactionNumber1.focus();
			return ;
		}
		if(!InsertForm.transactionNumber2.value) {
			alert("�ŷ� ��ȣ�� �Է����ּ���.");
			InsertForm.transactionNumber2.focus();
			return ;
		}
		if(InsertForm.transactionNumber2.value.length != 4) {
			alert("�ŷ� ��ȣ�� ���Ŀ� �°� �Է����ּ���.");
			InsertForm.transactionNumber2.focus();
			return ;
		}
		if(!InsertForm.productID.value) {
			alert("��ǰ ID�� �Է����ּ���.");
			InsertForm.productID.focus();
			return ;
		}
		if(InsertForm.productID.value.length != 8) {
			alert("��ǰ ID�� ���Ŀ� �°� �Է����ּ���.");
			InsertForm.productID.focus();
			return ;
		}
		if(!InsertForm.price1.value) {
			alert("������ �Է����ּ���.");
			InsertForm.price1.focus();
			return ;
		}
		if(!InsertForm.price2.value) {
			alert("������ �Է����ּ���.");
			InsertForm.price2.focus();
			return ;
		}
		if(InsertForm.price2.value.length != 2) {
			alert("������ ���Ŀ� �°� �Է����ּ���.");
			InsertForm.price2.focus();
			return ;
		}
		if(!InsertForm.transactionDate.value) {
			alert("��¥�� �Է����ּ���.");
			InsertForm.transactionDate.focus();
			return ;
		}
		if(!InsertForm.customerName.value) {
			alert("���� �̸��� �Է����ּ���.");
			InsertForm.customerName.focus();
			return ;
		}
		InsertForm.submit();
	}
</script>
<body>
	<form name="transactionInsertForm" id="transactionInsertForm" action="transactionInsert.jsp">
		<br>
		�ŷ� ��ȣ (######-####)
		<br>
		<input type="text" name="transactionNumber1" id="transactionNumber1" size="6" maxlength="6">
		-
		<input type="text" name="transactionNumber2" id="transactionNumber2" size="4" maxlength="4">
		<br>
		��ǰ ID (########)
		<br>
		<input type="text" name="productID" id="productID" size="8" maxlength="8">
		<br>
		���� ($#.##)
		<br>
		$
		<input type="text" name="price1" id="price1" size="4" maxlength="4">
		.
		<input type="text" name="price2" id="price2" size="2" maxlength="2">
		<br>
		��¥
		<br>
		<input type="date" name="transactionDate" id="transactionDate">
		<br>
		���� �̸�
		<br>
		<input type="text" name="customerName" id="customerName" maxlength="30">
		<br>
	</form>
	<input type="button" value="�Է�" id="transactionInput" OnClick="javascript:Insert();">
</body>
</html>