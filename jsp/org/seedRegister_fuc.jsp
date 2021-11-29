<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@include file="../global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-">
<title>seedRegister_fuc.jsp</title>
	<%!
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

	String VarietyID, Quantity, sql, query;
	int res;

	VarietyID = request.getParameter("VarietyID");;
	Quantity = request.getParameter("Quantity");;
	
	try {
		sql = "SELECT H.VARIETYID " + "FROM \"HAS\" H " 
				+ "WHERE H.ORGNAME = '" + global_User_ID + "'";
		rs = stmt.executeQuery(sql);
		
		while(rs.next())
		{
			String tmpVID = rs.getString(1);
			
			if(VarietyID.equals(tmpVID)) {
				Register_Result = false;
			}
			else {
				Register_Result = true;
				try {
					System.out.println(global_User_ID);
					query = "INSERT INTO HAS VALUES ("
							+ "'" + VarietyID + "', "
							+ "'" + global_User_ID + "', " 
							+  Quantity + ", 0)";
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
	%>
	<% if(Register_Result == true) {%>
		<script>
			alert('씨앗 등록에 성공했습니다!');
			location.href="../../html/org/orgSeedList.html";
		</script>
	<% }else { %>
		<script>
			alert('이미 존재하는 품종입니다!'); 
			window.history.back();
		</script>
	<% } %>
</body>
</html>