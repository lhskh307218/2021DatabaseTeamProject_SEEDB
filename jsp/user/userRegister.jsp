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
	boolean register_Result;
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
			String iUser_Id = request.getParameter("userID");
			String iUser_Name = request.getParameter("userName");
			String iUser_Pw = request.getParameter("userPW");
			String iUser_Addr = request.getParameter("userAddr");
			String iUser_Age = request.getParameter("userAge");
			String iUser_PhoneN = request.getParameter("userPhoneN");
			String iUser_Gender = request.getParameter("userGender");
			String iUser_Email = request.getParameter("userEmail");
			
			String sql = "INSERT INTO \"USER\" VALUES (" + "'" + iUser_Id + "', " + "'" + iUser_Name + "', " + "'"
					+ iUser_Pw + "', " + "'" + iUser_Addr + "', " + iUser_Age + ", " + iUser_PhoneN + ", " + "'"
					+ iUser_Gender + "'" + "'" + iUser_Email + "')";
			
			result = stmt.executeUpdate(sql);
			
			if(result == 1){
				conn.commit();
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
		<script>location.href="../userLogin.html";</script>
	<% }else { %>
		<script>
			alert('회원가입에 실패했습니다!'); 
			window.history.back();
		</script>
	<% } %>
</body>
</html>