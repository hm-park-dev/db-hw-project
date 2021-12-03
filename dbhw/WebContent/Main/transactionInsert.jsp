<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="dbhw.DBConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//1. Connection
	Connection conn = DBConn.getMySqlConnection();

	String transactionNumber1 = request.getParameter("transactionNumber1");
	String transactionNumber2 = request.getParameter("transactionNumber2");
	String transactionNumber = transactionNumber1 + "-" + transactionNumber2;
	String productID = request.getParameter("productID");
	String price1 = request.getParameter("price1");
	String price2 = request.getParameter("price2");
	String price = price1 + "." + price2;
	String transactionDate = request.getParameter("transactionDate");
	String customerName = request.getParameter("customerName");
	
	// 2. SQL - ������ �߰�, ����, ���� - ������ ��ü ���� 
	Statement stmt = conn.createStatement();
	
	String sql = "INSERT INTO mydb.transaction VALUES(?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	try{
		pstmt.setString(1, transactionNumber);
		pstmt.setString(2, productID);
		pstmt.setString(3, price);
		pstmt.setString(4, transactionDate);
		pstmt.setString(5, customerName);
		
		pstmt.execute();
		pstmt.close();
	}catch(SQLException e){
	       out.println(e.toString());
	}

%>
<script>
	alert("�ŷ� ������ �ԷµǾ����ϴ�.");
	window.location.href="Main.jsp"
</script>
</body>
</html>