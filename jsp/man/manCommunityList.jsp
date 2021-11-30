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
       <title>커뮤니티 목록</title>
       <link rel="stylesheet" href="../css/usernavi.css?ver=1" type="text/css" />
       <link rel="stylesheet" href="../css/header.css" />
        <link rel="stylesheet" href="./css/BulletinList.css" />
       <link rel="stylesheet" href="../css/communityList.css" />
        <style></style>
    
    </head>
   <meta charset="UTF-8">
   <title>커뮤니티 목록</title>
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
            <li><a href="manSeedAllow.html">기관 씨앗 승인</a></li>
            <li><a href="manOrderList.jsp">주문 목록</a></li>
            <li><a href="manBulletinList.jsp">공지 사항</a></li>
            <li style="background-color: #d0db36"><a class="current" href="manCommunityList.jsp">커뮤니티</a></li>
       </ul>
      <div class="kategorie">
         <input type="radio" name="kategorie" id="zero" />
         <label for="zero">전체</label>
         <input type="radio" name="kategorie" id="one" />
          <label for="one">나눔</label>
         <input type="radio" name="kategorie" id="two" />
         <label for="two">홍보</label>
          <input type="radio" name="kategorie" id="three" />
          <label for="three">소통</label>
    </div>
    <div class="communityList">
    <%
        Connection con=null;
        PreparedStatement pstmt=null;
        ResultSet rs = null;
        try{
            con = DBConnection.getCon();
            String sql="SELECT N.NWTitle, N.NWContent, N.NWtime, R.UserID FROM NOTICE_BOARD N, \"READ\" R WHERE N.NWNum = R.NWNum";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            //디비의 Row 만큼 while반족
            while(rs.next()){
                int no = rs.getInt("NWNum");
                String title1 = rs.getString("NWTitle");
                String id = rs.getString("UserID");
                String co = rs.getString("NWContent");
                String dt = rs.getString("NWTime");   
   %>

         <div class="Community">
            <div class="title"><a href="manCommunityDetail.jsp?NWNum=<%=no%>" ><%=title1 %></a></div>
             <div class="content">
                <div class="preview"><a href="manCommunityDetail.jsp?NWNum=<%=no%>" ><%=co %></a></div>
                <div class="inf">
                  <div><%=dt %> </div>
                  <div><%=id %></div>
                </div>
             </div>
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
