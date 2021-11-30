<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.SQLException"%>
<%@page import="study.DBConnection"%> 
<%
    request.setCharacterEncoding("utf-8");
    String bWNum =request.getParameter("BWNum");
   
    Connection con=null;
    PreparedStatement pstmt=null;
    ResultSet rs = null;
    try{
        con = DBConnection.getCon();
        //manBulletinList.jsp 에서 파라미터로 넘겨받은 게시판번호가 where이 된다
        String sql="select * from BULLETIN_BOARD where BWNum=?";
   
        pstmt = con.prepareStatement(sql);
                pstmt.setString(1, bWNum);
        rs = pstmt.executeQuery();
		//조회할 컬럼 설정
        String bWContent = rs.getString("BWContent");
%>


<!DOCTYPE html>
<html lang="ko">
  <link rel="stylesheet" href="../../html/css/usernavi.css" />

  <head>
    <meta charset="UTF-8" />
    <title>공지사항 상세보기</title>
    <link rel="stylesheet" href="../css/usernavi.css?ver=1" type="text/css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/BulletinList.css" />
    <style></style>
  </head>
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
      <li style="background-color: #d0db36"><a class="current" href="manBulletinList.jsp">공지 사항</a></li>
      <li><a href="manCommunityList.jsp">커뮤니티</a></li>
    </ul>

    <div class="BulletinDetail">
      <div class="title">글 제목</div>
      <div class="write">
      	<!-- DB에서 조회한 게시글 내용을 셋팅 -->
        <div class="content"><%=bWContent%></div>
        <!-- 해당프로젝트에 맞게 action주소 수정 -->
        <form action="manBulletinDelete.jsp" id="frm1" class="submit">
        	<!-- 삭제하려는 게시판의번호를 셋팅  -->
        	<input type="hidden" name="<%=bWNum%>"/>
          	<button onclick="javascript:manBulletinDelete();">삭제하기</button>
        </form>
      </div>
      <div class="write" style="border-top: 1px solid black">
        <div class="title">댓글</div>
        <div class="commentList"></div>
      </div>
    </div>
  </body>
<%
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
<script type="text/javascript">
    function manBulletinDelete(){
        document.frm1.submit();
    }
</script>
</html>
