<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<!--DB를 커넥션해주는 메소드를 간편하게 사용하기위해 자바로 선언해 놓는다.-->
<%@page import="study.DBConnection"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 삭제 프로세스</title>
</head>
<body>
<%
	//manBulletinDetail.jsp 에서 넘겨받은 삭제할 게시판번호
	String bWNum = request.getParameter("bWNum");

	Connection con = null;
	PreparedStatement pstmt = null;
	
	int n=0;
	try{
	    con = DBConnection.getCon();
	    String sql="delete from BULLETIN_BOARD where BWNum=?";
	    pstmt = con.prepareStatement(sql);
	    pstmt.setString(1, bWNum);
	   
	    n = pstmt.executeUpdate();
	}catch(SQLException se){
	    System.out.println(se.getMessage());
	}finally{
	    if(pstmt!=null) pstmt.close();
	    if(con!=null) con.close();
	}
	//성공후 이동할 페이지를 정한다.
	response.sendRedirect("manBulletinList.jsp");
%>
</body>
</html>
