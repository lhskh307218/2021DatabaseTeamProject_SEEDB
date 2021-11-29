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
   
   String ID = request.getParameter("ID");
   String SeedName = request.getParameter("SeedName");
   String VarietyName = request.getParameter("VarietyName");
   String OrgName = request.getParameter("OrgName");
   String remaining = request.getParameter("remaining");
   String Quantity = request.getParameter("Quantity");
   String orgPurpose = request.getParameter("orgPurpose");
   String VarietyID = "";
   
   try {
	   String query = "SELECT VarietyID FROM \"SEED\" WHERE VarietyName = '" + VarietyName + "'";
	   rs = stmt.executeQuery(query);
       while (rs.next()) {
    	      VarietyID = rs.getString(1);
   	   }
   }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
    	System.exit(1);
   }
   
   if (orgPurpose.equals("대여")) {
	      orgPurpose = "R";
	      Quantity = "5";
   }
   else if (orgPurpose.equals("구매"))
	      orgPurpose = "B";
   
   if (Integer.parseInt(remaining) < Integer.parseInt(Quantity)) {
	   System.out.println("go back");
	   %>
	      <script>
	            alert("주문하려는 양이 현재 잔여량보다 많습니다!");
	            history.back();
	      </script>
	   <%
   }
   else if (Integer.parseInt(Quantity) < 5) {
	   System.out.println("go back");
	   %>
	   	  <script>
	   	  		alert("5g이상부터 주문하실 수 있습니다.");
	   	  		history.back();
	   	  </script>
	   <%
   }
   else {
   

   try {
	   String makeOrder = "INSERT INTO \"ORDER\" VALUES (ORDER_SEQ.NEXTVAL, '" + ID + "', TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI'), '" + orgPurpose + "', '" + OrgName + "', '" + VarietyID + "', " + Quantity + ")";
	   rs = stmt.executeQuery(makeOrder);
       conn.commit();
   }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
    	System.exit(1);
   }
   
   try {
	   String minusQuantity = "UPDATE HAS SET Quantity = Quantity - " + Quantity + " WHERE VarietyID = '" + VarietyID + "'";
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
	location.href='userMainAll.jsp';
</script>
<%
}
%>
</body>
</html>