<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<!DOCTYPE html>
<html>
 	<head>
    	<meta charset="UTF-8" />
    	<title>공지사항 등록</title>
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
	   		<li><a href="#">씨앗 등록</a></li>
	     	<li><a href="#">사용자/기관 관리</a></li>
	      	<li style="background-color: #d0db36"><a href="#">공지 사항</a></li>
	      	<li><a href="#">커뮤니티</a></li>
	 	</ul>
	    <div class="BulletinDetail">
	   	 	<!-- 다른 페이지로 입력폼을 전송하기위해 form태그로 감싼다. form태그가 무엇인지는 구글링.. -->
	   	 	<!-- 프로젝트에 맞게 action URL 수정 -->
			<form method="post"  class="submit" action="manBulletinInsert.jsp">
	    		<div class="title">글 제목</div>
	      			<textarea placeholder="게시글 내용" name="bbsContent"></textarea>
	        	<div class="content">게시글 내용</div>
	        	<!-- input 타입이 submit이 무엇인지 구글링.. -->
	        	<input type="submit" value="등록">
	       	</form>
	 	</div>
	</body>
</html>