<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select your Seed</title>
	<style>
		input:focus {outline:none;}
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
            width: 1200px;

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
            height: 300px;
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
            border:0 solid black;
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
            border:0 solid black;
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
        }
        #textboxThird {
            background: transparent;
            border:0 solid black;

            padding: 2%;
            height: 3px;
            font-size: 20px;
            font-weight: bold;
        }
        #textboxFourth {
            background: transparent;
            border:0 solid black;

            padding: 2%;
            height: 3px;
            font-size: 20px;
            font-weight: bold;
        }
        #textboxRed {
            background: transparent;
            border:0 solid black;

            padding: 2%;
            height: 3px;
            color: red;
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
            	선택하신 씨앗을 구매/대여할 수 있는 기관의 목록과 잔여수량입니다.
            	<div class="backseedLists">
    			<%
    
    			try {
    			String sql = "SELECT VarietyName, H.OrgName, Org_purpose, Quantity\r\n"
    					+ "FROM \"SEED\" S INNER JOIN HAS H ON S.VarietyID = H.VarietyID INNER JOIN \"ORGANIZATION\" ORG ON H.OrgName = ORG.OrgName\r\n"
    					+ "WHERE SeedName='" + SeedName + "'";
    	
    			rs = stmt.executeQuery(sql);
        		while (rs.next()) {
           			String VarietyName = rs.getString(1);
           			String OrgName = rs.getString(2);
           			String tmp = rs.getString(3);
           			String remaining = rs.getString(4);
           			String orgPurpose = "";        			
           			
           		
           			if (tmp.equals("A")) {
           				orgPurpose = "구매 및 대여";
           			}
           			else if (tmp.equals("L")) {
           				orgPurpose = "대여";
           			}
           			else if (tmp.equals("S"))
           				orgPurpose = "구매";
           			
           			if (Integer.parseInt(remaining) < 5)
           				remaining = "품절";
           		
    			%>	
    			<form action="userMakeOrder.jsp">
    				<button type="submit" class="seedLists" onclick="location.href='userMakeOrder.jsp'">
    					<input size="15" id="textboxFirst" name="VarietyName" value="<%=VarietyName %>"> 
    					<input size="32" id="textboxSecond" name="OrgName" value="<%=OrgName%>">
    					<input size="7" id="textboxThird" name="orgPurpose" value="<%=orgPurpose %>">
    					<%
    					if (remaining.equals("품절")) {
    						System.out.println("품절");
    					%>
    						<input size="5" id="textboxRed" name="remaining" value="<%=remaining %>">
    					<%
    					}
    					else {
    						System.out.println("품절아님");
    					%>
    					<input size="5" id="textboxFourth" name="remaining" value="<%=remaining %>">
    					<%
    					}
    					%>
    				</button>
    			</form>
    			<%
        		}
        		%>
        		</div>
        	</div>
        </div>
        
        
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