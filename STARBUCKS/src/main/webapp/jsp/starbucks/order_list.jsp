<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%
//String menu = (String)request.getAttribute("menu");
//int amount = (Integer)request.getAttribute("amount");
//String sum = (String)request.getAttribute("sum");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>스타벅스</title>
		<link href="<c:url value='/css/starbucks/order_list.css'/>" rel="stylesheet">
		
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
		
		<div>
			<h1>원하시는 조건으로 주문을 조회하세요</h1>
		</div>
		
		<div>
			<form id="frmOrderSearch" method="post" action="<c:url value='/starbucks/orderList.star'/>">
				<div>
					<select name="menu" id="menuSelect">
						<option value="">모든 메뉴</option>
						<option value="cake">케이크</option>
						<option value="coffee">커피</option>
						<option value="sandwich">샌드위치</option>
					</select>
					<input id="user_id" type="text" name="user_id" placeholder="주문자 ID를 입력하세요">
				</div>
				<div>
					<input type="button" id="btnSearch" value="조건 적용">
				</div>
			</form>
		</div>
		<table>
		    <thead>
		        <tr>
		            <th>Seq</th>
		            <th>메뉴</th>
		            <th>금액</th>
		            <th>합계</th>
		            <th>User ID</th>
		            <th>주문일시</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach var="order" items="${orderList}">
		            <tr>
		                <td><c:out value="${order.seq}" /></td>
		                <td><c:out value="${order.menu}" /></td>
		                <td><c:out value="${order.amount}" /></td>
		                <td><c:out value="${order.sum}" /></td>
		                <td><c:out value="${order.user_id}" /></td>
		                <td><c:out value="${order.create_date}" /></td>
		            </tr>
		        </c:forEach>
		    </tbody>
		</table>
		
	<script>
			// 폼 전송
			let btnSearch = document.getElementById('btnSearch');
			btnSearch.addEventListener('click', function(){
				document.getElementById('frmOrderSearch').submit();
			});
			
			// 텍스트창 클릭시 배경 변경
			document.addEventListener('DOMContentLoaded', function() {
				  
				var menuSelect = document.getElementById('menuSelect');
		        var savedMenuValue = "${menu}";

		        // Event listener for when the input is clicked
		        inputField.addEventListener('focus', function() {
		            // Change styles when input is clicked
		            inputField.style.backgroundColor = '#fff';
		            inputField.style.color = '#000'; // Change text color as needed
		            inputField.placeholder = ''; // Remove placeholder
		        });

		        // Event listener for when the input loses focus
		        inputField.addEventListener('blur', function() {
		            // Revert styles when input loses focus
		            inputField.style.backgroundColor = '#362415';
		            inputField.style.color = '#fff';
		            inputField.placeholder = '주문자 ID를 입력하세요'; // Restore placeholder
		        });
		    });
			

	</script>
	
	</body>
</html>