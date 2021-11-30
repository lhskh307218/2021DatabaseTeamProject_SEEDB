<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="study.DBConnection"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 인서트 프로세스</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	//이전 페이지에서 받은 입력폼의 파라미터
    String bbsContent = request.getParameter("bbsContent");
   
    //db에 저장하기
    Connection con = null;
    PreparedStatement pstmt = null;
    
    String sql ="insert into BULLETIN_BOARD(BWNum,BWContent,BWTime)"+
    			"values(BW_SEQ.NEXTVAL,?,TO_CHAR(SYSDATE, 'YYYY.MM.DD HH24:MI'))";
    int n=0;
   
    try{
        con = DBConnection.getCon();
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, bbsContent);
       
        n = pstmt.executeUpdate();
    }catch(SQLException se){
        System.out.println(se.getMessage());
    }finally{
        try{
            if(pstmt!=null) pstmt.close();
            if(con!=null) con.close();
        }catch(SQLException se){
            System.out.println(se.getMessage());
        }
    }   
   
%>
<script type="text/javascript">
    if(<%=n%> > 0){
        alert("정상적으로 등록이 되었습니다.");
        location.href="manBulletinList.jsp";//등록 후 이동할 페이지를 지정
    }else{
        alert("등록에 실패했습니다.");
        history.go(-1);//이전페이지로 돌아가기
    }
</script>
</body>
</html>
