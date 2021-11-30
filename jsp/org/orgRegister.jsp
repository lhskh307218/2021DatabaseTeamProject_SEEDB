<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>userRegister.jsp</title>
</head>
<body>
	<%!
	boolean register_Result = true;
	%>
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
	%>
	<%
		int result = 0;
	
		try{
			String UserName = request.getParameter("UserName");
			String UserPurpose = request.getParameter("UserPurpose");
			String UserArea = request.getParameter("UserArea");
			String UserAffiliateDate = request.getParameter("UserAffiliateDate");
			String UserP = request.getParameter("UserP");
			String UserPW = request.getParameter("UserPW");
			
			String sql = "INSERT INTO ORGANIZATION VALUES (" + "'" + UserName + "', " + "'" + UserPurpose + "', " + "'"
					+ UserArea + "', '" + UserAffiliateDate + "', " + UserP + ", '" + UserPW + "')";
			
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
			
			if(result == 1){
				register_Result = true;
			}
			else
				register_Result = false;
			
		
		}catch(SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
		stmt.close();
		conn.close();
	%>
	<% if(register_Result == true) {%>
		<script>
			alert('회원가입에 성공했습니다!'); 
			location.href="../../html/org/orgLogin.html";
		</script>
	<% }else { %>
		<script>
			alert('회원가입에 실패했습니다!'); 
			window.history.back();
		</script>
	<% } %>
</body>
</html>