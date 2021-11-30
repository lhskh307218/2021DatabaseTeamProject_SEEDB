<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userCommunityList</title>
<style>
		input:focus {outline:none;}
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            min-width: 1200px;
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
        #purposemenu li a {
            color: #C4C4C4;
            display: block;
            padding: 10px;
            text-decoration: none;
            text-align: center;
            font-weight: bold;
        }
        #purposemenu li a.current {
           color: black;
           background-color: white;
        }
        #purposemenu li a:hover:not(.current) {
            color: black;
            background-color: white;
        }
        #purposemenudefault li a {
            color: black;
            background-color: white;
        }
        .title {
            display: block;
            float: left;
            width: 25%;
            height: 550px;

            margin-top: 3%;
            margin-left: 6%;
            margin-bottom: 5%;
            
            border-radius: 30px 30px 30px 30px;
			background: #87C8E3;
            
            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 25px;
        }
        .contentBack {
        	display: inline-block;
            width: 100%;
            height: 92%;
            
            margin-top: 3%;
            border: none;

            background-color: #FFF3EF;
            box-shadow: 9px 10px 17px rgba(0, 0, 0, 0.1);
            border-radius: 0px 0px 30px 30px;

            color: black;
            font-size: 20px;
            font-weight: bold;
            text-align: left;
        }
        .content {
			display: inline-block;
			width: 80%;
			height: 70%;
			
			background-color: white;
			border: none;
			box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
			
			margin-top: 7%;
			margin-bottom: 7%;
			margin-left: 8%;
			padding: 2%;
			
			color: black;
			text-weight: bold;
			font-size: 30px;
			font-weight: bold;
			text-align: center;
		}
        .textTime {
            display: inline-block;
            height: 30px;
	
            background: transparent;
            padding: 1%;
            border: none;
            margin-left: 8%;
            
            font-size: 20px;
            color: black;
            font-weight: bold;
            text-align: center;
        }
        .textWriter {
            display: inline-block;
            height: 30px;
	
            background: transparent;
            padding: 1%;
            border: none;
            
            font-size: 20px;
            color: black;
            font-weight: bold;
            text-align: center;
        }
        .btn {
			height: 50px;
			width: 130px;
			
			background-color: #87C8E3;
			border-radius: 30px 30px 30px 30px;
			border: none;
			margin-top: 2%;
			margin-left: 3%;
			
			color: white;
			font-weight: bold;
			font-size: 20px;
			text-aling: center;
		}
        .temp {
        	border: none;
        	background: transparent;
        	color: #FFF3EF;
        	font-size: 0.1px;
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
                <a href="../../html/selectUserType.html">로그아웃</a>  
            </div>
        </form>
    </header>
    <ul class="navi" id="navi">
        <li><a href="userMainAll.jsp">씨앗 구매</a></li>
        <li><a href="userOrderList.jsp">주문 목록</a></li>
        <li><a href="userNoticeList.jsp">공지 사항</a></li>
        <li><a class="current" href="userCommunityList.jsp">커뮤니티</a></li>
    </ul>

    <button type="submit" onclick="location.href = 'userCommunityWrite.jsp'" class="btn">글 작성하기</button>
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
   
   // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 현재 접속중인 사용자
   String nowUserID = "abc12";
   
   try {
       String sql = "SELECT BWTitle, BUserID, BWTime, BWContent\r\n"
   			+ "FROM BULLETIN_BOARD";
       rs = stmt.executeQuery(sql);
       while (rs.next()) {
          String BWTitle = rs.getString(1);
          String BUserID = rs.getString(2);
          String BWTime = rs.getString(3);
          String BWContent = rs.getString(4);
          
          if (nowUserID.equals(BUserID)) {
        	  %>
              <form action="userCommunityReadMine.jsp" method="post">
              		<div class="title" name="Title" value=<%=BWTitle %>><%=BWTitle %>
              			<button type="submit" class="contentBack">
              				<input type="text" name="Title" value="<%=BWTitle %>" class="temp" readonly>
              				<input type="text" name="Content" value="<%=BWContent %>" class="content" readonly>
              				<input type="text" size=13 name="Time" value="<%=BWTime %>" class="textTime" readonly> |
              				<input type="text" size=10 name="UserID" value="<%=BUserID %>" class="textWriter" readonly>
              			</button>
              		</div>
              </form>
              <%
          }
          else {
        	  %>
              
              <form action="userCommunityReadSomeone.jsp" method="post">
              		<div type="submit" class="title" name="Title" value=<%=BWTitle %>><%=BWTitle %>
              			<button type="submit" class="contentBack">
              				<input type="text" name="Title" value="<%=BWTitle %>" class="temp" readonly>
              				<input type="text" name="Content" value="<%=BWContent %>" class="content" readonly>
              				<input type="text" size=13 name="Time" value="<%=BWTime %>" class="textTime" readonly> |
              				<input type="text" size=10 name="UserID" value="<%=BUserID %>" class="textWriter" readonly>
              			</button>
              		</div>
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
