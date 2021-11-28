<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
   
   String ID = request.getParameter("ID");
   String SeedName = request.getParameter("SeedName");
   String VarietyName = request.getParameter("VarietyName");
   String OrgName = request.getParameter("OrgName");
   String VarietyID = "";
   
   try {
	   String query = "SELECT VarietyID FROM \"SEED\" WHERE VarietyName = '" + VarietyName + "'";
       System.out.println(query);
	   rs = stmt.executeQuery(query);
       while (rs.next()) {
    	      VarietyID = rs.getString(1);
   	   }
   }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
    	System.exit(1);
   }

   try {
	   String makeOrder = "INSERT INTO \"ORDER\" VALUES (ORDER_SEQ.NEXTVAL, '" + ID + "', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'), 'R', '" + OrgName + "', '" + VarietyID + "', 5)";
       System.out.println(makeOrder);
	   rs = stmt.executeQuery(makeOrder);
       conn.commit();
   }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
    	System.exit(1);
   }
   
   try {
	   String minusQuantity = "UPDATE HAS SET Quantity = Quantity - 5 WHERE VarietyID = '" + VarietyID + "'";
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
	alert("주문이 완료되었습니다.");
	location.href='userMain.html';
</script>
</body>
</html>