<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userOrderList</title>
<style>
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
        .name_rectangle_buy {
            display: block;
            float: left;
            width: 25%;
            height: 650px;

            margin-top: 3%;
            margin-left: 6%;
            margin-bottom: 5%;
            border-radius: 30px 30px 30px 30px;
            background-color: #E5734F;

            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 25px;
        }
        .name_rectangle_rent {
            display: block;
            float: left;
            width: 25%;
            height: 650px;

            margin-top: 3%;
            margin-left: 6%;
            margin-bottom: 5%;
            border-radius: 30px 30px 30px 30px;
            background-color: #E5993E;

            text-align: center;
            color: white;
            font-weight: bold;
            font-size:25px;
        }
        .content_rectangle_buy {
            display: inline-block;
            width: 85%;
            height: 100%;
            padding : 5%;
            padding-left: 10.1%;

            background-color: #FFF3EF;
            box-shadow: 9px 10px 17px rgba(0, 0, 0, 0.1);
            border-radius: 0px 0px 30px 30px;

            color: black;
            font-size: 15px;
            text-align: left;
        }
        .content_rectangle_rent {
            display: inline-block;
            width: 85%;
            height: 100%;

            padding : 5%;
            padding-left: 10.1%;

            background-color: #FFFAEF;
            box-shadow: 9px 10px 17px rgba(0, 0, 0, 0.1);
            border-radius: 0px 0px 30px 30px;

            color: black;
            font-size: 15px;
            text-align: left;
        }
        .text {
            display: inline-block;
            width: 90%;
            height: 30px;

            background-color: #FFFFFF;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            margin-top: 2%;
            margin-bottom: 5%;
            border:0 solid black;
            
            font-size: 15px;
            color: black;
            font-weight: bold;
            padding: 1%;
            padding-left: 3%;
            text-align: left;
        }
		.deltext {
            display: inline-block;
            width: 260px;
            height: 30px;

            background-color: white;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            margin-top: 2%;
            margin-bottom: 5%;
            border: 0 solid black;
            
            font-size: 15px;
            color: black;
            font-weight: bold;
            padding: 1%;
            padding-left: 1%;
            text-align: left;
        }
        .rectangle_btn_buy {
            width: 100px;
            height: 40px;
            margin-left: 35%;
            margin-top: 3%;

            background-color: #E5734F;
            border-radius: 30px;
            border:0 solid black;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
        }
        .rectangle_btn_rent {
            width: 100px;
            height: 40px;
            margin-left: 35%;
            margin-top: 3%;

            background-color: #E5993E;
            border-radius: 30px;
            border:0 solid black;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
        } 
    </style>
</head>
<body>
<h1>네비게이션바</h1>
    <ul class="navi" id="navi">
        <li><a href="userMainAll.jsp">씨앗 구매</a></li>
        <li><a class="current" href="userOrderList.jsp">주문 목록</a></li>
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
   
   String ID = "abc12";
   String OrderNum = "";
   String Quantity = "";
   
   try {
	// VarietyID 구하기
       String sql = "SELECT OrderNum, Purchase_Date, SeedName, VarietyName, Quantity, OD_OrgName, Order_Purpose\r\n"
       		+ "FROM \"ORDER\" INNER JOIN \"SEED\" ON OD_VarietyID = VarietyID\r\n"
       		+ "WHERE OD_UserID LIKE '" + ID + "'";
       rs = stmt.executeQuery(sql);
       while (rs.next()) {
          OrderNum = rs.getString(1);
          String PurchaseDate = rs.getString(2);
          String SeedName = rs.getString(3);
          String VarietyName = rs.getString(4);
          Quantity = rs.getString(5);
          String OrgName = rs.getString(6);
          String OrderPurpose = rs.getString(7);
          
          if (OrderPurpose.equals("R")) { %>
    	  <div class="name_rectangle_rent">
          대여<br>
          <div class="content_rectangle_rent">
          <form action="userDeleteOrderList.jsp" method="post">
          	  주문 번호
          	  <input type="text" name="OrderNum" value="<%=OrderNum %>" class="text" placeholder="<%=OrderNum%>" readonly><br>
              대여한 고객 아이디
              <input type="text" name="ID" class="text" placeholder="<%=ID %>" readonly><br>
              대여한 씨앗 이름
              <input type="text" name="SeedName" class="text" placeholder="<%=SeedName %>" readonly><br>
              대여한 품종 이름
              <input type="text" name="VarietyName" class="text" placeholder="<%=VarietyName %>" readonly><br>
              대여한 기관
              <input type="text" name="OrgName" class="text" placeholder="<%=OrgName %>" readonly><br>
              대여한 수량
              <input type="text" name="Quantity" class="text" placeholder="<%=Quantity %>" readonly><br>
              대여한 날짜
              <input type="text" name="Purchase_date" class="text" placeholder="<%=PurchaseDate %>" readonly><br>
              
              <button class="rectangle_btn_rent" type="submit">취소하기</button>
              
          	</form>
              </div>
          </div>
          <%
          }
          else if (OrderPurpose.equals("B")) { %>
	  	  <div class="name_rectangle_buy">
      	  구매<br>
      	  <div class="content_rectangle_buy">
      	      <form action="userDeleteOrderList.jsp" method="post">
      	  	  주문 번호
      	  	  <input type="text" name="OrderNum" value="<%=OrderNum %>" class="text" placeholder="<%=OrderNum%>" readonly><br>
          	  구매한 고객 아이디
          	  <input type="text" name="ID" class="text" placeholder="<%=ID %>" readonly><br>
          	  구매한 씨앗 이름
           	  <input type="text" name="SeedName" class="text" placeholder="<%=SeedName %>" readonly><br>
           	  구매한 품종 이름
          	  <input type="text" name="VarietyName" class="text" placeholder="<%=VarietyName %>" readonly><br>
              구매한 기관
          	  <input type="text" name="OrgName" class="text" placeholder="<%=OrgName %>" readonly><br>
          	  구매한 수량
              <input type="text" name="Quantity" class="text" placeholder="<%=Quantity %>" readonly><br>
          	  구매한 날짜
          	  <input type="text" name="Purchase_date" class="text" placeholder="<%=PurchaseDate %>" readonly><br>
          	  
          	  <button class="rectangle_btn_buy" type="submit">취소하기</button>
      	  	</form>
          	  </div>
      	  	  </div>
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