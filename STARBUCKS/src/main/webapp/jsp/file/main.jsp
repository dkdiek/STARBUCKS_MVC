<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타벅스</title>
<link rel="stylesheet" href="<c:url value='/css/file/main.css'/>">
<!-- Google web font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@600&display=swap"
	rel="stylesheet">

</head>
<body>
	<!-- 상단 로고 -->
	<div>
		<a href="<c:url value='/'/>"> <img id="logo"
			src="<c:url value='/images/common/logo.png'/>">
		</a>
	</div>
	
	<!-- 업로드 -->
	<div>
		<h1>파일을 선택 후 업로드하세요</h1>
	</div>
	<!-- 실제 톰캣으로 돌려야 upload 파일로 들어가고 이클립스에서 upload하면 tmp0 폴더에 upload에 저장됨 -->
	<!-- C:\worksapce_jee\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\STARBUCKS\upload -->
	</div>
	<!-- https://velog.io/@virtualplastic/JSP-Servlet-%ED%8C%8C%EC%9D%BC-%EC%97%85%EB%A1%9C%EB%93%9C -->
	<div>
		<form id="frmUpload" method="post" enctype="multipart/form-data"
			action="<c:url value='/file/upload.star'/>" accept-charset="UTF-8">
			<input id="file" type="file" name="uploadFile" multiple>
			<!-- 파일명 출력<output id="output"></output> -->
			<div>
				<input class="common-button" id="btnUpload" type="button"
					value="업로드"> <input class="common-button" id="btnReset"
					type="button" value="초기화">
			</div>
			<div>
				<!-- 미리보기 1개 <img id="preview" /> -->
				<div id="image_container"></div>
			</div>
		</form>
	</div>
	<!-- 구분선 -->
	<hr>
	<!-- 다운로드 -->
	<!-- C:\worksapce_jee\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\STARBUCKS\download -->
	<div>
		<h1>다운로드할 파일을 선택하세요</h1>
	</div>
	
	<div id="downloadList">
		<ul id="ulDownload"></ul>
	</div>

	<form id="frmDownload" method="post" action="<c:url value='/file/download.star'/>">
		<input type="hidden" name="downloadFileName" id="downloadFileName">
	</form>
	
	<script>
		// FileModel에서 리퀘스트에 담은 download 폴더의 파일 이름들을 JS 배열 생성하여 추가
		var fileList = [];
		<c:forEach var="fileName" items="${fileList}">
		fileList.push('${fileName}'); 
		</c:forEach>
	</script>
	<!-- 스크립트 임포트 -->
	<script defer src="<c:url value='/js/file/main.js'/>" ></script>
</body>
</html>
