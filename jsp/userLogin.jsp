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
	<%
		String ID = request.getParameter("userID");
		String password = request.getParameter("userPW");

		global_User_ID = ID;
		global_User_PW = PW;
		global_User_Type = 1;
	%>
	<%
		
		out.println("&nbsp;&nbsp;&nbsp;&middot; ID: <b>"+ ID +"</b>.</br>");
		out.println("&nbsp;&nbsp;&nbsp;&middot; PW: <b>" +password+"</b>.</br>");
	%>
</body>
</html>