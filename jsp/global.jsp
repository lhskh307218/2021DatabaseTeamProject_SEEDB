<%@page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<meta charset="utf-8">
<%

   String global_User_ID = "농촌진흥청";
   String global_User_PW;

    // 현재 접속자 분류: 1) 고객 2) 기관 3) 관리자 . 기본값은 고객
   int global_User_Type;

%>