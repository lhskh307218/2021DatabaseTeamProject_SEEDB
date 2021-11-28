<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
        select {
            margin-top: 20px;
            float: right;
            width:150px;
            height: 40px;
            font-weight: bold;
            text-align: left;
            padding-left: 10px;
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
        .seeds {
            background-color: #D0DB36;
            height: 300px;
            width: 23%;

            border:0 solid black;
            border-radius: 30px;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            
            margin: 1%;
            float: left;
            padding-top: 10%;
                        
            text-align: center;
            font-weight: bold;
            font-size: 40px;
        }        
        .nameSeedLists {
            display: block;
            float: left;
            height: 450px;
            width: 1000px;

            background-color: #F8FFDC;
            border:0 solid black;
            border-radius: 30px;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            
            margin-top: 1%;
            margin-left: 2%;
            
            padding-top: 1%;
                        
            text-align: center;
            color: black;
            font-weight: bold;
            font-size: 35px;
        }
        .backseedLists {
            overflow: scroll;
            display: inline-block;
            width: 90%;
            height: 70%;
            margin-top: 4%;

            background-color: #F8FFDC;
            color: black;
            font-size: 30px;
            box-shadow: 9px 10px 17px rgba(0, 0, 0, 0.1);
        }
        .seedLists {
            display: inline-block;
            width: 100%;
            height: 15%;

            padding: 1%;
            background-color: #F8FFDC;
            color: black;
            font-size: 30px;
        }
        .selectSeedLists {
            display: inline-block;
            width: 100%;
            height: 15%;

            padding: 0.5%;
            background-color: #D0DB36;
            color: white;
            font-size: 30px;
            box-shadow: 9px 10px 17px rgba(0, 0, 0, 0.1);
        }
        .name_order {
            width: 1050px;
            height: 60px;
            margin-top: 600px;
            margin-left: 5%;
            
            padding-top: 1%;
            background-color: #D0DB36;
            border-radius: 30px 30px 0px 0px;
            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 30px;
        }
        .back_order {
            width: 990px;
            margin-left: 5%;

            background-color: #F8FFDC;
            box-shadow: 9px 10px 17px rgba(0, 0, 0, 0.1);
            border-radius: 0px 0px 30px 30px;

            text-align: left;
            padding: 2%;
            font-size: 20px;
            font-weight: bold;
        }
        .textbox {
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            background-color: #FFFFFF;
            border:0 solid black;

            padding: 2%;
            margin-left: 1%;
            width: 500px;
            height: 1px;
            font-size: 20px;
            font-weight: bold;
        }
        .rectangle_btn_buy {
            width: 120px;
            height: 50px;

            background-color: #E5734F;
            border-radius: 30px;
            border:0 solid black;
            

            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
        }
        .rectangle_btn_rent {
            width: 120px;
            height: 50px;

            background-color: #E5993E;
            border-radius: 30px;
            border:0 solid black;
            

            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
        }
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
    </style>
    <script>
    	$('div').click(function() {
    		if ($(this).hasClass("seedLists")) {
    			$(this).removeClass("seedLists");
    			$(this).addClass("selectSeedLists");
    		}
    	})
    </script>
</head>
<body>
<h1>네비게이션바</h1>
    <ul class="navi" id="navi">
        <li><a class="current" id="navi" href="userMainAll.jsp">씨앗 구매</a></li>
        <li><a href="userOrderList.jsp">주문 목록</a></li>
        <li><a href="#">공지 사항</a></li>
        <li><a href="#">커뮤니티</a></li>
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
    
    String SeedName = request.getParameter("SeedName");
    //---------------------------- 여기로 받음!! -----------------------------
    %>
    	<div style="margin-top: 3%;">
        	<div class="seeds"><%=SeedName %></div>
        	<div class="nameSeedLists">
            	선택하신 씨앗을 구매/대여할 수 있는 기관의 목록입니다.
            	<div class="backseedLists">
    			<%
    
    			try {
    			String sql = "SELECT VarietyName, H.OrgName, Org_purpose\r\n"
    					+ "FROM \"SEED\" S INNER JOIN HAS H ON S.VarietyID = H.VarietyID INNER JOIN \"ORGANIZATION\" ORG ON H.OrgName = ORG.OrgName\r\n"
    					+ "WHERE SeedName='" + SeedName + "'";
    	
    			rs = stmt.executeQuery(sql);
        		while (rs.next()) {
           			String VarietyName = rs.getString(1);
           			String OrgName = rs.getString(2);
           			String tmp = rs.getString(3);
           			String SeedPurpose = "";
           			
           			if (tmp.equals("A"))
           				SeedPurpose = "구매 및 대여";
           			else if (tmp.equals("L"))
           	           	SeedPurpose = "대여";
           			else if (tmp.equals("S"))
           	            SeedPurpose = "구매";
    			%>
    				<div class="seedLists" onclick="click()"><%=VarietyName %> / <%=OrgName %> / <%=SeedPurpose %></div>
           
    			<%
        		}
        		%>
        		</div>
        	</div>
        </div>
        
        <div class="wrap" style="float: left;">
        		<button type="submit" class="rectangle_btn_buy" onclick="location.href='userBuy.html';">구매하기</button>
        		<button type="submit" class="rectangle_btn_rent" onclick="location.href='userRent.html';">대여하기</button>
    	</div>
        
        <!--
        <form action="userBuy.html">
    		<div class="name_order">주문을 원하시는 씨앗의 씨앗 이름, 품종 이름, 기관 이름을 입력해주세요</div>
    		<div class="back_order">
                 씨앗 이름
                <input type="text" name="SeedName" class="textbox"><br></br>
                품종 이름
                <input type="text" name="VarietyName" class="textbox"><br></br>
                구매 및 대여 기관
                <input type="text" name="OrgName" class="textbox"><br></br>  
            </div>
    		
		</form>
		-->
        
        	<%
    		}catch(SQLException ex2) {
    			System.err.println("sql error = " + ex2.getMessage());
       			System.exit(1);
    		}
    		stmt.close();
    		conn.close();
    
    		%>   

<!-- 
    <div class="footer">
        Database Team7_SEEDB .<br>
        2020110787 서경희 .<br>
        2017111751 장현준 .<br>
        2020115001 홍송은 .
    </div>
    -->
</body>
</html>