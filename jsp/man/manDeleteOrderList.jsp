<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userOrderList_delete</title>
</head>
<body>
</body>
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
   
   String OrderNum = request.getParameter("OrderNum");
   String VarietyID = "";
   String Quantity = "";
   
   try {
	   String query = "SELECT OD_VarietyID, Quantity FROM \"ORDER\" WHERE OrderNum = " + OrderNum;
	   rs = stmt.executeQuery(query);
       while (rs.next()) {
    	      VarietyID = rs.getString(1);
    	      Quantity = rs.getString(2);
   	   }
   }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
    	System.exit(1);
   }
  
   try {
	   String del = "DELETE FROM \"ORDER\" WHERE OrderNum = " + OrderNum;
       System.out.println(del);
	   rs = stmt.executeQuery(del);
       conn.commit();
   }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
    	System.exit(1);
   }
   
   try {
	   String minusQuantity = "UPDATE HAS SET Quantity = Quantity + " + Quantity + " WHERE VarietyID = '" + VarietyID + "'";
	   rs = stmt.executeQuery(minusQuantity);
       conn.commit();
   }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
    	System.exit(1);
   }
   
   stmt.close();
   conn.close();
%>
<script>
	alert("주문이 취소되었습니다.");
	location.href='#';
</script>
</body>
</html>