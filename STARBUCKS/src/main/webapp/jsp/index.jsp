<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
    	<link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    	<!-- Google web font -->
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap" rel="stylesheet">
	</head>
	<body>
				
		<div id="indexTop">
			<div>
				<img id="logo" src="<c:url value='/images/common/logo.png'/>">
			</div>
			<div>
				<h1>스타벅스에 오신걸 환영합니다</h1>
			</div>
		</div>
		
		<!-- 유저네임 없을때만 로그인창 나오도록 -->
		<c:if test="${ null eq sessionScope.userName }">
    		<div>
				<!-- 아이디, 비밀번호 틀렸을때 메세지 출력 -->			
    			<c:if test="${msg ne null}">
        			<span class="loginInform" style="color: yellow">${msg}</span>
				<!-- 처음 접속 시 표시 -->			
        		</c:if>
        		<c:if test="${msg eq null}">
        			<span class="loginInform">회원 정보를 입력하세요</span>
        		</c:if>
    		</div>
			
			<div>
				<form id="frmLogin" method="post" action="<c:url value='/login.star'/>">
					<input type="text" name="userId" id="userId" placeholder="아이디"><br>
					<input type="password" name="userPw"  id="userPw" placeholder="암호"><br>
					<input type="button" class="common-button" onclick="submitForm('frmLogin')" id="loginButton" value="로그인">
				</form>
			</div>
		</c:if>
	
		
		<!-- 유저네임 있을때만 메뉴가 나오도록 -->
		<c:if test="${ null ne sessionScope.userName }">
			
			<div class="welcomeContainer">
				  <img src="<c:url value='/images/index/welcome.jpg'/>" alt="welcome">
				  <div class="centered">
						${userName}님 접속 중<br>
						로그인: ${sessionScope.formattedLoginTime}
				  </div>
			</div>
			
			<div>
				<form id="frmLogout" method="post" action="<c:url value='/logout.star'/>">
					<input type="button" class="common-button" onclick="submitForm('frmLogout');  clearLoginForm();" id="logoutButton" value="로그아웃">
				</form>
			</div>
			
			<div class="menu">
			    <form action="<c:url value='/starbucks/menu.star'/>" method="post">
			        <button type="submit" class="menu-button">메뉴 주문하기</button>
			    </form>
			    <form action="http://starbucks.co.kr" method="post">
			        <button type="submit" class="menu-button">홈페이지</button>
			    </form>
			</div>
			
		</c:if>
		
		<script defer src="<c:url value='/js/index.js'/>"></script>
	</body>
</html>