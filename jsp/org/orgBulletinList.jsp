<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.SQLException"%>
<%@page import="study.DBConnection"%> 
<!DOCTYPE html>
<html>
 	<link rel="stylesheet" href="../../html/css/usernavi.css" />

  	<head>
    	<meta charset="UTF-8" />
    	<title>공지사항 목록</title>
    	<link rel="stylesheet" href="../css/usernavi.css?ver=1" type="text/css" />
    	<link rel="stylesheet" href="../css/header.css" />
    	<link rel="stylesheet" href="../css/BulletinList.css" />
    	
 	</head>
	<meta charset="UTF-8">
	<title>공지사항 목록</title>
  	<body>
	    <header>
	     	<img class="Logo" src="../image/Logo.png" alt="Logo" />
	      	<form class="Info">
	        	<div style="display: inline-flex" ;>
	          		<img class="user" src="../image/user.png" alt="user" />
	          		<h3>seedb님</h3>
	        	</div>
	        	<div>
	          		<a href="./mainRegister.html" target="_blank">마이페이지</a>
	          		<a href="./Register.html">로그아웃</a>
	        	</div>
			</form>
		</header>
		<ul class="navi" id="navi">
	   		<li><a href="orgSeedRegister.html">씨앗 등록</a></li>
	      	<li><a href="orgOrderList.jsp">주문 목록</a></li>
	      	<li style="background-color: #d0db36"><a class="current" href="orgBulletinList.jsp">공지 사항</a></li>
	      	<li><a href="orgCommunityList.jsp">커뮤니티</a></li>
	 	</ul>
	    <div class="BulletinList">
	    	<div class="title">
	        <div>글 번호</div>
	        <div>글 제목</div>
	        <div>날짜</div>
	   	</div>
    <%
        //db 에서 회원목록 얻어와 테이블에 출력
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        try{
            con = DBConnection.getCon();
            String sql="select * from BULLETIN_BOARD";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            //디비의 Row 만큼 while을 돌린다
            while(rs.next()){
                int no = rs.getInt("BWNum");
                String p = rs.getString("BWPurpose");
                String title1 = rs.getString("BWTitle");
                String id = rs.getString("BUserID");
                String co = rs.getString("BWContent");
                String dt = rs.getString("BWTime");   
	%>

	   	<div class="Bulletin">
	   	</div>
	<%
            }
        }catch(SQLException se){
            System.out.println(se.getMessage());
        }finally{
            try{
                if(rs!=null)  rs.close();
                if(pstmt!=null)  pstmt.close();
                if(con!=null)  con.close();
            }catch(SQLException se){
                System.out.println(se.getMessage());
            }
        }
    %>
		

	</div>
	</body>
</html>
