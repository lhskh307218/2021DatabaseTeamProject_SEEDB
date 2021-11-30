<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userBuySeed</title>
</head>
<body>
<%
   String serverIP = "localhost";
   String strSID = "orcl";
   String portNum = "1521";
   String user = "teamproject";
   String pass = "comp322";
   String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
   request.setCharacterEncoding("UTF-8");

   Connection conn = null;
   Statement stmt = null;
   ResultSet rs;
   
   Class.forName("oracle.jdbc.driver.OracleDriver");
   conn = DriverManager.getConnection(url, user, pass);
   conn.setAutoCommit(false);
   stmt = conn.createStatement();
   
   String UserID = request.getParameter("UserID");
   String Title = request.getParameter("Title");
   String Content = request.getParameter("Content");
   String Purpose = request.getParameter("Purpose");
   
   try {
	   String query = "INSERT INTO \"BULLETIN_BOARD\" VALUES (BW_SEQ.NEXTVAL, '" + Purpose + "', '" + Title + "', '" + UserID + "', TO_CHAR(SYSDATE, 'YYYY.MM.DD HH24:MI'), '" + Content + "')";
	   System.out.println(query);
	   rs = stmt.executeQuery(query);
       conn.commit();
   }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
    	System.exit(1);
   }
   
   stmt.close();
   conn.close();
   
%>
<script>
	alert("글 작성이 완료되었습니다.");
	location.href='userMainAll.jsp';
</script>
</body>
</html>