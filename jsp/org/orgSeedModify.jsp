<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!-- import JDBC package -->
<%@ page language="java" import="java.text.*, java.sql.*" %>
<%@include file="../global.jsp"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>OrganizationSelectSeed</title>
    <link rel="stylesheet" href="../../html/css/usernavi.css?ver=1" type="text/css" >
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            min-width: 1200px;
        }
        .Info {
            margin-top: 3%;
            margin-right: 1%;
            float: right;
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
            background-color: #FFD600;
            color: white'
        }
        #navi li a:hover:not(.current) {
            background-color: #D0DB36;
            color: white;
        }
        #rounded-rectangle {
            width: 60%;
            height: 60px;
            margin-top: 5%;
            margin-left: 20%;
            padding-top: 1%;
            background-color: #D0DB36;
            border-radius: 30px 30px 0px 0px;
            text-align: center;
            color: white;
            font-weight: bold;
            font-size: 40px;
        }
        #background-rectangle {
            width: 50%;
            margin-left: 20%;

            background-color: #F8FFDC;
            box-shadow: 9px 10px 17px rgba(0, 0, 0, 0.1);
            border-radius: 0px 0px 30px 30px;

            text-align: left;
            padding: 5%;
            font-size: 2.5vh;
            font-weight: bold;
        }
        .textbox {
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            background-color: #FFFFFF;
            padding: 3%;
            margin-left: 10%;
            width: 60%;
            height: 1px;
            font-size: 20px;
            font-weight: bold;
        }
        .rd-rectangle_btn {
            width: 150px;
            height: 50px;
            margin-left: 35%;
            
            background-color: #D0DB36;
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
        <img class = "Logo" src="../../image/Logo.png" alt="Logo">
        <form class = "Info">
            <div style="display: inline-flex";>
                <img class = "user" src="../../image/user.png" alt="user">
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
        <li><a href="#">주문 목록</a></li>
        <li><a href="#">공지 사항</a></li>
        <li><a href="#">커뮤니티</a></li>
    </ul>
    <form action="seedModify_fuc.jsp" metho=post>
	    <div id="rounded-rectangle">씨앗 수량 수정</div>
		    <div id="background-rectangle">
		    	<h4>본인 확인을 위해 기관 이름을 다시 입력합니다.</h4>
		    	기관 이름
		    	<input type="text" name="Org" class="textbox"><br></br>
		    	<h4>수정하고 싶은 씨앗의 품종번호를 입력하세요</h4>
		    	품종 번호
		        <input type="text" name="VarietyID" class="textbox"><br></br>
		        등록 수량
		        <input type="text" name="Quantity" class="textbox"><br></br>

		        <div class="wrap">
		            <button class="rd-rectangle_btn" onclick="seedRegister_fuc.jsp;">수정하기</button>
		        </div>
		    </div>
	    <div><br></br></div>
	</form>
</body>