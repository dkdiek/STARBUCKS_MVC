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
		
		<style>
			body {
				background-color: #00704A;
				color: white;
				display : flex;
				justify-content: center; /* 수평 가운데 정렬 */
  				align-items: center;
				flex-direction: column; /* 세로로 나란히 정렬되도록 설정 */
  				
			}
			ul{
				display : flex;
				justify-content: center; /* 수평 가운데 정렬 */
			}
			li {
			
			}
			ul li {
    align-self: center;
}
			
			a {
				text-decoration: none;
			}
			
			a:visited {
				color: white; /* 방문한 후에도 글자색을 보라색으로 유지 */
			}
			div{
				display:flex;
				justify-content: center; /* 수평 가운데 정렬 */
  				align-items: center;

			}
		</style>
	</head>
	<body>
		<div>
			<h1>스타벅스에 오신걸 환영합니다</h1>
		</div>
		<!-- 유저네임 없을때만 로그인창 나오도록 -->
		<c:if test="${ null eq sessionScope.userName }">
			<div>
				<form id="loginForm" method="post" action="<c:url value='/login.star'/>">
					<input type="text" name="userId" placeholder="아이디"><br>
					<input type="text" name="userPw" placeholder="암호"><br>
					<input type="button" onclick="submitForm('loginForm')" id="loginButton" value="로그인">
				</form>
			</div>
		</c:if>
		
		<!-- 유저네임 있을때만 메뉴가 나오도록 -->
		<c:if test="${ null ne sessionScope.userName }">
			<div>
				<span>${userName}님 로그인 중</span>
			</div>
			
			<div>
				<form id="logoutForm" method="post" action="<c:url value='/logout.star'/>">
					<input type="button" onclick="submitForm('logoutForm')" id="logoutButton" value="로그아웃">
				</form>
			</div>
			
			<div>
				<ul>
					<li><a href="<c:url value='/starbucks/menu.star'/>">메뉴 주문하기</a></li>
				</ul>
			</div>
		</c:if>
		
		<script defer src="<c:url value='/js/index.js'/>"></script>
	</body>
</html>