<%@ page language="java" import="java.sql.*" %>
<%@ page import="dbhw.DBConn" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Main Page</title>
<script>
	function doChange(srcE, targetId){
   		var val = srcE.options[srcE.selectedIndex].value;
    	var targetE = document.getElementById(targetId);
    	removeAll(targetE);

    	if(val == 'Customer'){
        	addOption('name', targetE);
        	addOption('phone', targetE);
        	addOption('address', targetE);
        	addOption('gender', targetE);
    	}
    	else if(val == 'Transaction'){
        	addOption('transactionNumber', targetE);
        	addOption('productID', targetE);
        	addOption('price', targetE);
        	addOption('date', targetE);
        	addOption('customerName', targetE);
    	}
    	else if(val == 'Product') {
    		addOption('name', targetE);
    		addOption('productID', targetE);
    		addOption('supplierName', targetE);
    	}
	}

function addOption(value, e){
    var o = new Option();
    o.value = value;
    o.text = value;
   
    e.options.add(o);
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit; ++i){
        e.remove(1);
    }
}
</script>
</head>
<body>
	<form name="customerInsert" action="customerInput.jsp">
		<input type="submit" value="���� �Է�">
	</form>
	<form name="transactionInsert" action="transactionInput.jsp">
		<input type="submit" value="�ŷ� �Է�">
	</form>
	<form name="productInsert" action="productInput.jsp">
		<input type="submit" value="��ǰ �Է�">
	</form>
	<p> ===================================== </p>
	<form name="uploadForm" action="csvUpload.jsp" method="post" enctype="Multipart/form-data">
		<p>csv ���� ���ε�</p>
		<input type="file" name="fileName">
		<input type="submit" value="���ε�">
	</form>
	<p> ===================================== </p>
	<form name="searchForm" action="searchAttr.jsp">
		<p>�� Table�� Attribute�� �˻��մϴ�.</p>
		<p>�˻��� Table�� Attribute�� �������ּ���.</p>
		<select name="search" id="search" onchange="doChange(this, 'selectAttr')">
			<option value="None">=== Table ===</option>
			<option value="Customer">Customer</option>
			<option value="Transaction">Transaction</option>
			<option value="Product">Product</option>
		</select>
		<select name="selectAttr" id="selectAttr">
			<option value="None">=== Attribute ===</option>
		</select>
		<input type="text" name="searchValue" size="20" id="searchValue">
		<input type="submit" value="�˻�">
	</form>
	<p> ===================================== </p>
	<form name="special1" action="specialSearch1.jsp">
		<input type="submit" value="���ں��� ���ڰ� ���� �� ��ǰ�� �̸� �˻�">
	</form>
	<p> ===================================== </p>
	<form name="special2" action="specialSearch2.jsp">
		��¥: <input type="date" name="transactionDate" id="transactionDate">
		<br>
		<input type="submit" value="�־��� �� ������ ���� ���� �ŷ��� �̷���� ��ǰ �˻�">
	</form>
	<p> ===================================== </p>
	<form name="special3" action="specialSearch3.jsp">
		m: <input type="text" name="mvalue" size="3" maxlength="3">
		<br>
		<input type="submit" value="�ϳ��� supplier���� m�� �̻��� ��ǰ�� �� ������ �̸� �˻�">
	</form>
</body>
</html>