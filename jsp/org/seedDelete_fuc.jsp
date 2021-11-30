<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@include file="../global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seedRegister_fuc.jsp</title>
	<%!
	boolean Org_Result = false;
	boolean Register_Result = true;
	%>
</head>
<body>
	<%
	String serverIP = "192.168.56.1";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "seed";
	String pass = "seed";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	Connection conn = null;
	Statement stmt = null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);	
	%>
	<%
	String VarietyID, Quantity, Org, sql, query;
	int res;
	
	Org =  request.getParameter("Org");
	VarietyID = request.getParameter("VarietyID");
	Quantity = request.getParameter("Quantity");
	
	stmt = conn.createStatement();
	conn.setAutoCommit(false);
	if(Org.equals(global_User_ID))
	{
		Org_Result = true;
		try {
			sql = "SELECT H.VARIETYID FROM HAS H WHERE H.ORGNAME = '" 
					+ Org + "'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				String tmpVID = rs.getString(1);
				
				if(VarietyID.equals(tmpVID) != true) {
					Register_Result = false;
					break;
				}
			}
			
			if(Register_Result == true)
			{
				Register_Result = true;
				try {
					query = "DELETE FROM HAS WHERE VARIETYID = '"
                 			+ VarietyID + "'"
                 			+ " AND ORGNAME = '"
                 			+ Org + "'";
					res = stmt.executeUpdate(query);
					if (res == 1) {
						Register_Result = true;
						conn.commit();
					} else {
						Register_Result = false;
					}
				} catch (SQLException ex2) {
					System.err.println("sql error = " + ex2.getMessage());
					System.exit(1);
				}
			}
		} catch (SQLException ex1) {
 			System.err.println("sql error = " + ex1.getMessage());
 			System.exit(1);
 		}
	}
	%>
	<% if(Org_Result == false) {%>
		<script>
			alert('기관명이 동일하지 않습니다!'); 
			window.history.back();
		</script>
	<% }else { %>
		<script>
			alert('씨앗이 삭제되었습니다!');
			location.href="orgSeedManage.jsp";
		</script>
	<% } %>
</body>
</html>