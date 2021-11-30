<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<!--DB를 커넥션해주는 메소드를 간편하게 사용하기위해 자바로 선언해 놓는다.-->
<%@page import="study.DBConnection"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 인서트 프로세스</title>
</head>
<body>
<%
	//넘겨받는 값은 utf-8로 인코딩해서 받는다.
	request.setCharacterEncoding("utf-8");

	//이전 페이지에서 받은 입력폼의 파라미터
	//게시글 내용 입력폼, input의 name값으로 받는다
    String bbsContent = request.getParameter("bbsContent");
    //String email=request.getParameter("email"); 이메일은 없어서 주석
   
    //db에 저장하기
    Connection con = null;
    PreparedStatement pstmt = null;
    
    //manBulletinWrite.jsp 입력폼에는 [게시물내용] 항목만 있기 때문에 다른 컬럼의 인서트는 정의 하지 않음, 필요시 추가하세요
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
    // 결과 응답하기   
%>
<script type="text/javascript">
	//디비 Insert가 성공적이면 pstmt.executeUpdate() 반환하는 값이 1이다.
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
