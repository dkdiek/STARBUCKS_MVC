<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
		<link href="<c:url value='/css/starbucks.css'/>" rel="stylesheet">
		<style>
			body {
				background-color: #00704A;
				color: white;
			}
			
			li {
				list-style: none;
			}
			
			a {
				text-decoration: none;
			}
			
			a:visited {
				color: white; /* 방문한 후에도 글자색을 보라색으로 유지 */
			}
		</style>
	</head>
	<body>
		<div>
			<ul>
				<li><a href="<c:url value='/'/>"><img src="https://static.vecteezy.com/system/resources/previews/010/157/862/non_2x/house-and-home-icon-symbol-sign-free-png.png" width="30px"> HOME</a></li>
			</ul>
		</div>
		<div>
			<span>
				<img class="menuImg" data-menu="cake" src="<c:url value='/images/starbucks/cake.jpg'/>">
			</span>
			<span>
				<img class="menuImg" data-menu="coffee" src="<c:url value='/images/starbucks/coffee.jpg'/>">
			</span>
			<span>
				<img class="menuImg" data-menu="sandwich" src="<c:url value='/images/starbucks/sandwich.jpg'/>">
			</span>
		</div>
		<div>
			<span>
				<input type="number" id="count" value="1">개
			</span>
		</div>
		<div>
			<span>
				<input type="button" id="btnOrder" value="주문하기">
			</span>
		</div>
		<form id="orderForm" method="post" action="<c:url value='/starbucks/order.star'/>">
			<input type="hidden" id="menu" name="menu">
			<input type="hidden" id="amount" name="amount">
		</form>
		
		<script src="<c:url value='/js/starbucks_menu.js'/>"></script>
		
	</body>
</html>