<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="dbhw.DBConn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Customer Insert Result</title>
</head>
<body>
<%
	//1. Connection
	Connection conn = DBConn.getMySqlConnection();

	String customerName = request.getParameter("customerName");
	String customerPhone1 = request.getParameter("customerPhone1");
	String customerPhone2 = request.getParameter("customerPhone2");
	String customerPhone3 = request.getParameter("customerPhone3");
	String customerPhone = customerPhone1 + "-" + customerPhone2 + "-" + customerPhone3;
	String customerAddress = request.getParameter("customerAddress");
	String customerGender = request.getParameter("customerGender");
	
	// 2. SQL - ������ �߰�, ����, ���� - ������ ��ü ���� 
	Statement stmt = conn.createStatement();
	
	String sql = "INSERT INTO mydb.customer VALUES(?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	try{
		pstmt.setString(1, customerName);
		pstmt.setString(2, customerPhone);
		pstmt.setString(3, customerAddress);
		pstmt.setString(4, customerGender);
		
		pstmt.execute();
		pstmt.close();
	}catch(SQLException e){
	       out.println(e.toString());
	}

%>
<script>
	alert("���� ������ �ԷµǾ����ϴ�.");
	window.location.href="Main.jsp"
</script>
</body>
</html>