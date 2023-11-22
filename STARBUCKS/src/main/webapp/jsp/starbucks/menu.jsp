<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
		<link href="<c:url value='/css/menu.css'/>" rel="stylesheet">
		
		<!-- Google web font -->
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap" rel="stylesheet">

	</head>
	<body>
		<div>
			<a href="<c:url value='/'/>">
				<img id="logo" src="<c:url value='/images/common/logo.png'/>">
			</a>
		</div>
			<h1>메뉴를 선택하고 수량을 입력하세요</h1>
		<div id="menu-images">
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
				<input type="number" id="count" value="1"> 개
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
		
		<script defer src="<c:url value='/js/starbucks_menu.js'/>"></script>
		
	</body>
</html>