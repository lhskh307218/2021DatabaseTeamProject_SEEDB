<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@include file="../global.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>UserLendSeed</title>
    <link rel="stylesheet" href="../../html/css/usernavi.css?ver=1" type="text/css" >
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            min-width: 1200px;
        }
        .Logo {
        	margin-top: 1%;
        	margin-left: 14.5%;
        }
        .Info {
        	margin-left: 50%;
        }
        .mypage {
        	margin-top: 7%;
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
        li { float: left; margin-left: 15%}
        #navi li a {
            display: block;
            color: #000000;
            padding: 10px;
            text-decoration: none;
            text-align: center;
            font-weight: bold;
        }
        #navi li a.current { 
            background-color: #FFD600;
            color: white'
        }
        #navi li a:hover:not(.current) {
            background-color: #D0DB36;
            color: white;
        }
        #name-index {
            margin-top: 2%;
            margin-left: 7.5%;
            padding-top: 1%;
            width: 100px;
			height: 30px;
			left: 56px;
			top: 35vw;
			
			background: #ECA48E;
			border-radius: 30px 30px 0px 0px;
            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
        }
        #name-backround {
            width: 5%;
            margin-left: 4%;
			height: 10px;
			left: 56px;
			top: 35vw;
			
			background: #D0DB36;
			border-radius: 30px 0px 30px 0px;
            padding: 5%;
            font-size: 2.5vh;
            font-weight: bold;
        }
        .textbox {
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            background-color: #FFFFFF;
            width: 100px;
            height: 25px;
            font-size: 20px;
            font-weight: bold;
        }
        .rd-rectangle_btn {
            width: 150px;
            height: 50px;
            margin-left: 10%;
            
            background-color: #E5993E;
            border-radius: 30px;
            border:0 solid black;

            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 2.5vh;
        }
    </style>
</head>

<body>
    <header>
        <img class = "Logo" src="../../image/Logo.png" alt="Logo" width=100px>
        <img class = "Info" src="../../image/user.png" alt="user" width=3%>
        <a class = "mypage" href="./mainRegister.html">마이페이지</a>
        <a class = "mypage" href="./Register.html">로그아웃</a>  
    </header>
    <ul class="navi" id="navi">
        <li><a href="#">씨앗 구매</a></li>
        <li><a href="#">주문 목록</a></li>
        <li><a href="#">공지 사항</a></li>
        <li><a href="#">커뮤니티</a></li>
    </ul>
    <div id="name-index">이름</div>
    <div id="name-backround"><input class = "textbox" type="text"></div>
		
		<!--
        <div class="wrap">
            <button class="rd-rectangle_btn">주문하기</button>
            <button class="rd-rectangle_btn" onclick="history.back()">재주문하기</button>
        </div>-->
    </div>
    <div><br></br></div>
</body>