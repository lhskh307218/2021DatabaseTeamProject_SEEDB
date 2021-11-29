<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@include file="global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>userLogin.jsp</title>
</head>
<body>
	<%!
	boolean Login_Result;
	%>
	<%
	String serverIP = "192.168.56.1";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "seed";
	String pass = "seed";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	%>
	<%
		try{
			String ID = request.getParameter("userID");
			String PW = request.getParameter("userPW");
			
			String query = "SELECT U.USERID, U.PW \r\n" 
							+ "FROM \"USER\" U \r\n" 
							+ "WHERE U.USERID = '" + ID + "'";
			
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String real_id = rs.getString(1);
				String real_pw = rs.getString(2);
				
				if (real_pw.equals(PW)){
					global_User_ID = ID;
					global_User_PW = PW;
					global_User_Type = 1;
					
					Login_Result = true;
				}
				else {
					session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
					Login_Result = false;
				}
			}
		}catch(SQLException ex2) {
			System.err.println("sql error = " + ex2.getMessage());
			System.exit(1);
		}
		
		pstmt.close();
		conn.close();
	%>
	<% if(Login_Result == true) {%>
		<script>location.href="../userMain.html";</script>
	<% }else { %>
		<script>
			alert('로그인에 실패했습니다!'); 
			window.history.back();
		</script>
	<% } %>
</body>
</html>