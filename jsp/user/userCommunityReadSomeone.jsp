<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reading the content</title>
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
			
			margin-top: 4%;
			margin-left: 4%;
			margin-right: 4%;
			padding: 2%;
			
			color: black;
			font-size: 30px;
			font-weight: bold;
		}
		.texts {
			overflow: scroll;
			float: right;
			
			margin-top: 0.5%;
			margin-right: 5%;
			
			background: transparent;
			
			font-weight: bold;
			font-size: 30px;
						
		}
		.writer {
			float: right;
			
			margin-top: 0.5%;
			margin-right: 5%;
			
			background: transparent;
			
			font-weight: bold;
			font-size: 30px;
		}
	.Info {
            margin-top: 3%;
            margin-right: 1%;
            float: right;
        }
    </style>
</head>
<body>
<header>
        <img class = "Logo" src="../../image/Logo.png" alt="Logo">
        <form class = "Info">
            <div style="display: inline-flex";>
                <img class = "user" src="../../image/user.png" alt="user">
                <h3>seedb님</h3>
            </div>
            <div>
                <a href="./mainRegister.html" target="_blank">마이페이지</a>
                <a href="./Register.html">로그아웃</a>  
            </div>
        </form>
    </header>
    <ul class="navi" id="navi">
        <li><a href="userMainAll.jsp">씨앗 구매</a></li>
        <li><a href="userOrderList.jsp">주문 목록</a></li>
        <li><a href="userNoticeList.jsp">공지 사항</a></li>
        <li><a class="current" href="userCommunityList.jsp">커뮤니티</a></li>
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
    
    String Title = request.getParameter("Title");
    String Content = request.getParameter("Content");
    String UserID = request.getParameter("UserID");
    String Time = request.getParameter("Time");

   	%>
    <div class="title"><%=Title %></div>
    	<div class="contentBack">
    		<div class="content">
    			<%=Content %>
    		</div>
    		<div class="writer">
    			<%=Time %> | <%=UserID %>
    		</div>
    		
    	</div>
    <%

    stmt.close();
    conn.close();
    %>
</body>
</html>
