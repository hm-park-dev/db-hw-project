<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="dbhw.DBConn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Product Insert Result</title>
</head>
<body>
<%
	//1. Connection
	Connection conn = DBConn.getMySqlConnection();

	String productName = request.getParameter("productName");
	String productID = request.getParameter("productID");
	String supplierName = request.getParameter("supplierName");
	
	// 2. SQL - 데이터 추가, 수정, 삭제 - 실행할 객체 생성 
	Statement stmt = conn.createStatement();
	
	String sql = "INSERT INTO mydb.product VALUES(?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	try{
		pstmt.setString(1, productName);
		pstmt.setString(2, productID);
		pstmt.setString(3, supplierName);
		
		pstmt.execute();
		pstmt.close();
	}catch(SQLException e){
	       out.println(e.toString());
	}

%>
<script>
	alert("상품 정보가 입력되었습니다.");
	window.location.href="Main.jsp"
</script>
</body>
</html>