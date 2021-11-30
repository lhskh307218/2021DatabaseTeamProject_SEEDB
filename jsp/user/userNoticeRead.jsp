<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userNoticeBoard</title>
<style>
		input:focus {outline:none;}
		.footer {
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 115px;

            text-align: right;
            color:white;
            font-size: 20px;
            font-weight: bold;
            background-color: #FFCE1F;
        }
        .navi {
            background-color: #FFCE1F;
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }
        .purposemenu {
            background-color: white;
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }
        li { float: left; }
        #navi li a {
            display: block;
            color: #000000;
            padding: 10px;
            text-decoration: none;
            text-align: center;
            font-weight: bold;
        }
        #navi li a.current { 
            background-color: #D0DB36;
            color: black;
        }
        #navi li a:hover:not(.current) {
            background-color: #FFD600;
            color: white;
        }
        .title {
			width: 700px;
			height: 65px;
			
			margin-top: 3%;
			margin-left: 4%;
			padding-top: 1%;
			
			background-color: #87C8E3;
			border-radius: 30px 30px 0px 0px;
			
			text-align: center;
			font-size: 40px;
			font-weight: bold;
			color: white;
		}
		.contentBack {
			width: 92%;
			height: 650px;
			
			margin-left: 4%;

			background-color: #FFF3EF;
		}
		.content {
			overflow: scroll;
			display: inline-block;
			
			width: 88%;
			height: 70%;
			background-color: white;
			
			margin: 4%;
			padding: 2%;
			
			color: black;
			text-weight: bold;
			text-size: 30px;
		}
		.comment {
			display: inline-block;
			width: 100%;
			height: 10%;
			overflow: scroll;
			
			<!-- background: transparent; -->
			background-color: black;
			
		}
    </style>
</head>
<body>
<h1>네비게이션바</h1>
    <ul class="navi" id="navi">
        <li><a href="userMainAll.jsp">씨앗 구매</a></li>
        <li><a href="userOrderList.jsp">주문 목록</a></li>
        <li><a class="current" href="userNoticeList.jsp">공지 사항</a></li>
        <li><a href="userCommunityList.jsp">커뮤니티</a></li>
    </ul>
    
    <%
    String serverIP = "localhost";
    String strSID = "orcl";
    String portNum = "1521";
    String user = "teamproject";
    String pass = "comp322";
    String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
    request.setCharacterEncoding("UTF-8");

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs;
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, user, pass);
    conn.setAutoCommit(false);
    stmt = conn.createStatement();
    
    String Num = request.getParameter("Num");
    String Title = request.getParameter("Title");
    
    try {
    	String sql = "SELECT NWContent\r\n"
    			+ "FROM NOTICE_BOARD\r\n"
    			+ "WHERE NWNum = " + Num;
    	
    	rs = stmt.executeQuery(sql);
        while (rs.next()) {
        	String Content = rs.getString(1);
   	%>
    		<div class="title"><%=Title %></div>
    		<div class="contentBack">
    			<div class="content">
    				<%=Content %>
    			</div>
    		</div>
    	<%
        }
    }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
       	System.exit(1);
    }
    
    %>
    
    
    
    <%
    stmt.close();
    conn.close();
    %>
</body>
</html>
