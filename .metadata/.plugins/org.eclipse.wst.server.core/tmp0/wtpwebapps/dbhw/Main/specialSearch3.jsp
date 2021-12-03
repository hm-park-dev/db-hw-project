<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="dbhw.DBConn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Special Search3 Result</title>
</head>
<%
	//1. Connection
	Connection conn = DBConn.getMySqlConnection();
	String mvalue = request.getParameter("mvalue");
	ResultSet rs = null;
	PreparedStatement pstmt = null;	
	
	// 2. SQL - ������ �߰�, ����, ���� - ������ ��ü ���� 
	Statement stmt = conn.createStatement();
	
	String sql = 
			"SELECT COUNT(transaction.customerName), transaction.customerName, product.supplierName "
			+ "FROM product, transaction "
			+ "WHERE transaction.productID=product.productID "
			+ "group by transaction.customerName, product.supplierName "
			+ "HAVING product.supplierName = ANY(SELECT DISTINCT product.supplierName FROM product) AND COUNT(transaction.customerName) >" + mvalue;
	
	pstmt = conn.prepareStatement(sql);
	
	try {
		rs = pstmt.executeQuery();
			
		if (!rs.next()) {
			out.println("�ش��ϴ� ������ �����ϴ�.");
			return ;
		} else {
			rs = pstmt.executeQuery();
		}
		
		out.print("<p>�ϳ��� supplier���� " + mvalue + "�� �̻��� ��ǰ�� �� ���� �̸� </p>");
		out.print("������ �����ڿ� ���ؼ� ����մϴ�.");
		out.print("<table border =" + "2 " + "width =" + "700 " + "align ="
                + "center " + "bordercolor =" + "red " + "cellspacing ="
                + "2 " + " bordercolor =" + "red >");
		out.print("<tr>");
        out.print("<th>" + "Count" + "</th>");
        out.print("<th>" + "Customer Name" + "</th>");
        out.print("<th>" + "Supplier Name" + "</th>");
        out.print("</tr>");
        
        while(rs.next()) {
			String count = rs.getString("COUNT(transaction.customerName)");
			String customerName = rs.getString("transaction.customerName");
			String supplierName = rs.getString("product.supplierName");
			
			out.print("<tr>");
			out.println("<td>" + count + "</td>");
	        out.println("<td>" + customerName + "</td>");
	        out.println("<td>" + supplierName + "</td>");
	        out.print("</tr>");
		}
	} catch(SQLException e){
	    out.println(e.toString());
	}
%>
<body>

</body>
</html>