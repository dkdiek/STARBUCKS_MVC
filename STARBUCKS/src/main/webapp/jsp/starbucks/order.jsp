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
		<link href="<c:url value='/css/order.css'/>" rel="stylesheet">
		
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
			<div id="top-info">
				<h2>
					<!-- 메뉴명을 변수에 담아 c:out에서 대문자로 변환 -->
					<c:set var="upperMenu" value="${menu}" />	
					주문하신 [
						<span id="order-info">
							<c:out value=" " />
							<c:out value="${upperMenu.toUpperCase()}" /> - <fmt:formatNumber value="${amount}" pattern="#,###" /> 개
						</span>
					 ] 가 준비되었습니다
				</h2>
				<h3>				
					결제 금액 : <fmt:formatNumber value="${sum}" type="currency" currencySymbol="" /> 원
				</h3>
			</div>
			
			<div id="image-group" style="display: flex; flex-wrap: wrap;">
			    <c:forEach begin="1" end="${amount}" varStatus="i">
			        <div style="display: inline-block; text-align: center; position: relative; margin: 5px;">
			            <img src="<c:url value='/images/starbucks/${menu}.jpg'/>"
			                style="width: 100px;
			                    <c:if test="${i.count % 10 eq 0}">
			                        border: 5px double yellow;
			                    </c:if>
			                ">
			            <c:if test="${i.count % 10 eq 0}">
			                <span style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-weight: bold; color: yellow;">
			                    ${i.count}
			                </span>
			            </c:if>
			        </div>
			        <c:if test="${i.count % 10 eq 0}">
			            <br>
			        </c:if>
			    </c:forEach>
			</div>

		<%
		//	}
		%>
		</div>
	</body>
</html>