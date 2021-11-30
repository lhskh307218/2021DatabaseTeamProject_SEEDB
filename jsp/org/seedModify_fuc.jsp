<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@include file="../global.jsp"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>seedRegister_fuc.jsp</title>
	<%!
	boolean Org_Result = true;
	boolean Register_Result;
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
	ResultSet rs = null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);	
	
	String VarietyID, Quantity, Org, sql, query;
	int res;
	
	Org =  request.getParameter("Org");
	VarietyID = request.getParameter("VarietyID");;
	Quantity = request.getParameter("Quantity");;
	
	if(Org.equals(global_User_ID))
	{
		try {
			sql = "SELECT H.VARIETYID " + "FROM HAS H " 
					+ "WHERE H.ORGNAME = '" + Org + "'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				String tmpVID = rs.getString(1);
				
				if(VarietyID.equals(tmpVID) == false) {
					Register_Result = false;
				}
				else {
					Register_Result = true;
					try {
						query = "UPDATE HAS SET QUANTITY = "
	      						+ Quantity
	      						+ " WHERE VARIETYID = '"
	                 			+ VarietyID + "'";
						res = stmt.executeUpdate(query);
						if (res == 1) {
							Register_Result = true;
							conn.commit();
							return;
						} else {
							Register_Result = false;
						}
					} catch (SQLException ex2) {
						System.err.println("sql error = " + ex2.getMessage());
						System.exit(1);
					}
				}
			}
		} catch (SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
	}
	else {
		Org_Result = false;
	}
	%>
	<% if(Org_Result == false) {%>
		<script>
			alert('기관명이 동일하지 않습니다!'); 
			window.history.back();
		</script>
	<% }else { %>
		<% if(Register_Result == true) {%>
		<script>
			alert('씨앗 수정에 성공했습니다!');
			location.href="../../html/org/orgSeedList.html";
		</script>
		<% }else { %>
		<script>
			alert('씨앗 수정에 실패했습니다!'); 
			window.history.back();
		</script>
		<% } %>
	<% } %>
</body>
</html>