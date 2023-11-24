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
			background-color: #1e3932;
			color: white;
			display: flex;
			justify-content: center;
			/* 수평 가운데 정렬 */
			align-items: center;
			flex-direction: column;
			/* 세로로 나란히 정렬되도록 설정 */
			font-family: 'IBM Plex Sans KR', sans-serif;
		}
		
		#logo {
			margin-top: 190px;
			width: 100px;
		}
		
		#frmUpload {
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		}
		
		#output {
			display: block;
		  	white-space: pre-wrap;
		}
		
		/*로그인 로그아웃 버튼*/
		.common-button {
			margin: 5px;
			background-color: transparent;
			/* 배경색 설정 */
			color: white;
			/* 텍스트 색상 설정 */
			font-weight: bold;
			border: 2px solid white;
			/* 테두리 제거 */
			padding: 10px 10px;
			/* 내부 여백 설정 */
			border-radius: 5px;
			/* 모서리 둥글게 설정 */
			cursor: pointer;
			/* 포인터로 변경하여 클릭 가능한 모양으로 변경 */
			width: 100px;
			/* 원하는 너비로 설정 */
			height: 40px;
			/* 원하는 높이로 설정 */
		}
		
		#file {
    /* 여기에 사용자 지정 스타일을 추가하세요 */
    padding: 10px; /* 내부 여백을 조절합니다. */
    background-color: #3498db; /* 배경색을 변경합니다. */
    color: #fff; /* 텍스트 색상을 변경합니다. */
    border: none; /* 테두리를 없앱니다. */
    border-radius: 5px; /* 모서리를 둥글게 만듭니다. */
    cursor: pointer; /* 마우스 커서를 포인터로 변경합니다. */
}
		</style>
	</head>
	<body>
		<!-- 상단 로고 -->
		<div>
			<a href="<c:url value='/'/>"> <img id="logo"
				src="<c:url value='/images/common/logo.png'/>">
			</a>
		</div>

		<div>
			<h1>파일 업로드</h1>
		</div>
		<!-- https://velog.io/@virtualplastic/JSP-Servlet-%ED%8C%8C%EC%9D%BC-%EC%97%85%EB%A1%9C%EB%93%9C -->
		<!-- 실제 톰캣으로 돌려야 upload 파일로 들어가고 이클립스에서 upload하면 tmp0 폴더에 upload에 저장됨 -->
		<div>
			<form id="frmUpload" method="post" enctype="multipart/form-data" action="<c:url value='/file/upload.star'/>" accept-charset="UTF-8">
			<!--<form id="frmUpload" method="post" enctype="multipart/form-data" action="<c:url value='/file/upload.star'/>">  -->
				<input id="file" type="file" name="uploadFile" multiple onchange="readURL(this);" >
				<output id="output"></output>
				<div>
					<input class="common-button" id="btnUpload" type="button" value="업로드">
				</div>
				<!-- 미리보기 -->
				<div>
					<img id="preview" />
				</div>
			</form>
		</div>
		
		<div>
			<h1>다운로드</h1>
		</div>
		<div>
				<ul id="ulDownload">
					<li data-file-name="test.pdf">test.pdf download</li>
					<li data-file-name="test.zip">test.zip download</li>
					<li data-file-name="dog.jpg">dog.jpg download</li>
					<li data-file-name="개.jpg">개.jpg download</li>
					<li data-file-name="테스트_01.xlsx">테스트_01.xlsx download</li>
				</ul>
		</div>
		
		
		<form id="frmDownload" method="post" action="<c:url value='/file/download.star'/>">
			<input type="hidden" name="downloadFileName" id="downloadFileName">
		</form>
	
		<script>
			const input = document.getElementById('file')
			const output = document.getElementById('output')
	
			document.getElementById('file').addEventListener('input', (event) => {
			  const files = event.target.files
			  output.textContent = Array.from(files).map(file => file.name).join('\n')
			})
			
			document.getElementById('btnUpload').addEventListener('click', function(){
				document.getElementById('frmUpload').submit();
			});
			
			Array.from(document.getElementById('ulDownload').children).forEach(function(li){
				li.addEventListener('click', function(){
					document.getElementById('downloadFileName').value = this.dataset.fileName;
					document.getElementById('frmDownload').submit();
				});
			});
			
			
			<!-- 미리보기 -->
			function readURL(input) {
				  if (input.files && input.files[0]) {
				    var reader = new FileReader();
				    reader.onload = function(e) {
				      document.getElementById('preview').src = e.target.result;
				    };
				    reader.readAsDataURL(input.files[0]);
				  } else {
				    document.getElementById('preview').src = "";
				  }
				}
		</script>
	</body>
</html>