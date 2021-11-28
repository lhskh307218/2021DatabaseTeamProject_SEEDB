<%@page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf8"%>

<%

   String global_User_ID;

   String global_User_PW;

    // 현재 접속자 분류: 1) 고객 2) 기관 3) 관리자 . 기본값은 고객
   int global_User_Type = 1;

%>