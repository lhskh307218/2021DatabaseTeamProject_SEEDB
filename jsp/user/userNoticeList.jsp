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
        #textboxFirst {
        	margin-left: 1%;
            height: 3px;
            
            background: transparent;
            border:0 solid black;
			
            padding: 2%;
            font-size: 20px;
            font-weight: bold;
        }
        #textboxSecond {
            background: transparent;
            border:0 solid black;

            padding: 2%;
           
            height: 3px;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
        }
        #textboxThird {
            background: transparent;
            border:0 solid black;

            padding: 2%;
            height: 3px;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
        }
        .seedLists1 {
        	height: 65px;
        	width: 90%;
        	
        	border: none;
        	margin-left: 5%;
        	margin-top: 2.5%;
        	background-color: #FFD600;
        	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        	
        	font-size: 20px;
        	font-weight: bold;
        }
        .seedLists2 {
        	height: 65px;
        	width: 90%;
        	
        	border: none;
        	margin-left: 5%;
        	margin-top: 2.5%;
        	background-color: #FFCE1F;
        	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        	
        	font-size: 20px;
        	font-weight: bold;
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
    <br>
    <input size="5" id="textboxFirst" name="VarietyName" value="글 번호" style="margin-left: 6%;" readonly>| 
    <input size="80" id="textboxSecond" name="OrgName" value="글 제목" readonly> |
    <input size="15" id="textboxThird" name="orgPurpose" value="날짜" readonly>
    
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

    try {
    	String sql = "SELECT NWNum, NWTitle, NWTime\r\n"
    			+ "FROM NOTICE_BOARD";
    	
    	rs = stmt.executeQuery(sql);
        while (rs.next()) {
        	String Num = rs.getString(1);
           	String Title = rs.getString(2);
           	String Date = rs.getString(3);
           	
           	if (Integer.parseInt(Num) % 2 == 1) {
           		System.out.println("홀수");
           		%>
                <form action="userNoticeRead.jsp">
                <button type=submit class="seedLists1">
                	<input size="5" id="textboxFirst" name="Num" value="<%=Num %>"> 
            		<input size="80" id="textboxSecond" name="Title" value="<%=Title%>">
            		<input size="13" id="textboxThird" name="Date" value="<%=Date %>">
            	</button>
                </form>
         
                <%
           	}
           	else if (Integer.parseInt(Num) % 2 == 0) {
           		System.out.println("짝수");
           		%>
                <form action="userNoticeRead.jsp">
                <button type="submit" class="seedLists2">
                	<input size="5" id="textboxFirst" name="Num" value="<%=Num %>"> 
            		<input size="80" id="textboxSecond" name="Title" value="<%=Title%>">
            		<input size="13" id="textboxThird" name="Date" value="<%=Date %>">
            	</button>
                </form>
         
                <%
           	}
        }
    }catch(SQLException ex2) {
    	System.err.println("sql error = " + ex2.getMessage());
       	System.exit(1);
    }
    stmt.close();
    conn.close();
    
    %>

</body>
</html>
