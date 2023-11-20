<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
		<style>
			body{
				background-color: #00704A;
				color : white;
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
				<li><a href="<c:url value='/'/>"><img src="https://cdn-icons-png.flaticon.com/512/8001/8001205.png" width="30px"> HOME</a></li>
			</ul>
		</div>
		<div>
				<h2>
					<!-- 메뉴명을 변수에 담아 c:out에서 대문자로 변환 -->
					<c:set var="upperMenu" value="${menu}" />	
					고객님 주문하신
					<font style="font-size: 2em;">
						<c:out value=" ${upperMenu.toUpperCase()}" /> - <fmt:formatNumber value="${amount}" pattern="#,###" />
					</font>
					개가 나왔습니다.
				</h2>
			</div>
			<div>
				<h3>				
					결제 금액 : <fmt:formatNumber value="${sum}" pattern="#,###" /> 원
				</h3>
			</div>
			<div>
		
		<div>
			<c:forEach begin="1" end="${amount}" varStatus="i">
				<span style="display: inline-block; text-align: center;">
					<c:if test="${i.count % 10 eq 0}">
						 <span style="font-weight: bold; color: yellow;">${i.count}</span>
					</c:if>
					<br>
					<img src="<c:url value='/images/starbucks/${menu}.jpg'/>"
						style="width: 70px;
	                        <c:if test="${i.count % 10 eq 0}">
	                            border: 5px double yellow;
	                        </c:if>
	                    ">
				</span>
			</c:forEach>
		</div>
	
		<%
		//	}
		%>
		</div>
	</body>
</html>