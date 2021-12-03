/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.54
 * Generated at: 2020-12-26 09:41:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.File;
import java.nio.file.Files;
import java.io.BufferedReader;
import java.nio.file.Paths;
import java.util.Enumeration;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import java.util.*;
import java.io.*;
import java.sql.*;
import dbhw.DBConn;

public final class csvUpload_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.nio.file.Files");
    _jspx_imports_classes.add("java.nio.file.Paths");
    _jspx_imports_classes.add("java.util.Enumeration");
    _jspx_imports_classes.add("com.oreilly.servlet.multipart.DefaultFileRenamePolicy");
    _jspx_imports_classes.add("java.io.BufferedReader");
    _jspx_imports_classes.add("dbhw.DBConn");
    _jspx_imports_classes.add("java.io.File");
    _jspx_imports_classes.add("com.oreilly.servlet.MultipartRequest");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"EUC-KR\">\r\n");
      out.write("<title>CSV Upload</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

	//1. Connection
	Connection conn = DBConn.getMySqlConnection();

	String uploadPath = request.getRealPath("uploadFile");
	String fileName = "";
	String orgfileName = "";
	String filePath = "";
	String line = "";
	String a = "";
	
	int successNum = 0;
	int failedNum = 0;
	
	ArrayList<String[]> arrList = new ArrayList<String[]>();
	FileReader fr = null;
	BufferedReader br = null;
	
	try{
		MultipartRequest multi = new MultipartRequest(
								request, uploadPath, 10*1024, "utf-8", 
								new DefaultFileRenamePolicy());
		fileName = multi.getFilesystemName("fileName");
		orgfileName = multi.getOriginalFileName("fileName");
		
		filePath = uploadPath + "\\" + fileName;
		File csv = new File(filePath);
		br = new BufferedReader(new FileReader(csv));
		
		out.println("<p>"+fileName+"</p>");
		out.println("<p>"+orgfileName+"</p>");
		out.println("<p>"+filePath+"</p>");
		
		while ((line = br.readLine()) != null) { 
			// -1 옵션은 마지막 "," 이후 빈 공백도 읽기 위한 옵션 
			line = line.replaceAll(", ", ",");
			String[] token = line.split(",", -1); 
			
			if (token[0].equals("C")) {	
				String customerName = token[1];
				String customerPhone = token[2];
				String customerAddress = token[3];
				String customerGender = token[4];
				
				// 2. SQL - 데이터 추가, 수정, 삭제 - 실행할 객체 생성 
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
					successNum++;
				}catch(SQLException e){
				       out.println(e.toString());
				}
			}
			else if (token[0].equals("T")) {
				String transactionNumber = token[1];
				String productID = token[2];
				
				String _price = token[3];
				String price = _price.substring(_price.indexOf("$")+1);
				
				String dateString = token[4];
				String[] splitDate = dateString.split("/");
				String day = splitDate[0];
				if (day.length() == 1) {
					day = "0" + day;
				}
				String month = splitDate[1];
				if (month.length() == 1) {
					month = "0" + month;
				}
				String year = splitDate[2];
				String transactionDate = year + "-" + month + "-" + day;
				
				String customerName = token[5];
				
				
				// 2. SQL - 데이터 추가, 수정, 삭제 - 실행할 객체 생성 
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
					successNum++;
				}catch(SQLException e){
				       out.println(e.toString());
				}
				
			}
			else if (token[0].equals("P")) {
				String productName = token[1];
				String productID = token[2];
				String supplierName = token[3];
				
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
					successNum++;
				}catch(SQLException e){
				       out.println(e.toString());
				}
			}
			else {
				failedNum++;
				out.print("csv 파일 읽기에 실패했습니다.");
			}
		} 
		
		br.close();
		
		if(csv.exists()) 
			csv.delete(); 

	} catch (Exception e) {
		e.getStackTrace();
	}
	
	// out.print("<script>alert('정보가 처리되었습니다.')</script>");
	// out.print("<script>window.location.href='Main.jsp'</script>");

      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}