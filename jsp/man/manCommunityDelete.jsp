<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="study.DBConnection"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 삭제 프로세스</title>
</head>
<body>
<%
	String nWNum = request.getParameter("nWNum");

	Connection con = null;
	PreparedStatement pstmt = null;
	
	int n=0;
	try{
	    con = DBConnection.getCon();
	    String sql="delete from NOTICE_BOARD where NWNum=?";
	    pstmt = con.prepareStatement(sql);
	    pstmt.setString(1, nWNum);
	   
	    n = pstmt.executeUpdate();
	}catch(SQLException se){
	    System.out.println(se.getMessage());
	}finally{
	    if(pstmt!=null) pstmt.close();
	    if(con!=null) con.close();
	}

	response.sendRedirect("manCommunityList.jsp");
%>
</body>
</html>
