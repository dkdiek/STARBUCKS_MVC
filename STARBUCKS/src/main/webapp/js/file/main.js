const input = document.getElementById('file')
const output = document.getElementById('output')

//업로드 버튼 클릭 폼 섭밋
document.getElementById('btnUpload').addEventListener('click', function() {
	document.getElementById('frmUpload').submit();
});


// 다운로드 -------------------------------------------------------------------------------------------
// DOMContentLoaded- HTML 문서의 모든 초기 HTML 및 스타일이 완전히 로드되고 파싱된 후에 발생하는 이벤트
document.addEventListener('DOMContentLoaded', function() {

    // ulDownload에 동적으로 li 요소 추가
    const ulDownload = document.getElementById('ulDownload');
    fileList.forEach(fileName => {
        const li = document.createElement('li');
        li.dataset.fileName = fileName;

        // 한글 파일명 인코딩
        const encodedFileName = encodeURIComponent(fileName);

        // 한글 파일명으로 표시
        li.textContent = `${fileName}`;

        li.addEventListener('click', function() {
            document.getElementById('downloadFileName').value = encodedFileName;
            document.getElementById('frmDownload').submit();
        });

        ulDownload.appendChild(li);
    });

});


// 인풋 초기화-------------------------------------------------------------------------------------------
document.getElementById('btnReset').addEventListener('click', function() {
	document.getElementById('file').value = '';
	const imageContainer = document.getElementById('image_container');
	// 이미지 컨테이너 기존 미리보기 삭제
	while (imageContainer.firstChild) {
		imageContainer.removeChild(imageContainer.firstChild);
	}
});



/* 미리보기------------------------------------------------------------------------------------------- */
input.addEventListener('change', (event) => {
	readURL(input);
});

function readURL(input) {
	const imageContainer = document.getElementById('image_container');
	// 이미지 컨테이너 기존 미리보기 삭제
	while (imageContainer.firstChild) {
		imageContainer.removeChild(imageContainer.firstChild);
	}

	// input파일이 null이거나 undefined인 경우 접근하면 오류 나서 같이 포함
	if (input.files && input.files.length > 0) {
		for (const file of input.files) {
			const reader = new FileReader();
			reader.onload = function(e) {
				// 각 파일 미리보기를 감싸는 div
				const previewContainer = document.createElement('div');
				previewContainer.classList.add('previewContainer');

				// 이미지 엘리먼트 생성
				const img = document.createElement('img');
				img.setAttribute('src', e.target.result);

				// 파일 이름을 표시하는 span 엘리먼트 생성
				const fileNameText = document.createElement('span');
				fileNameText.classList.add('fileNameText');
				fileNameText.textContent = file.name;

				// 각 엘리먼트를 미리보기 컨테이너에 추가
				// 이미지 파일인 경우에만 이미지 엘리먼트 추가
				if (file.type.startsWith('image/')) {
					// 이미지 엘리먼트 생성
					const img = document.createElement('img');
					img.setAttribute('src', e.target.result);
					previewContainer.appendChild(img);
				}
				//파일명 추가
				previewContainer.appendChild(fileNameText);

				// 미리보기 컨테이너를 이미지 컨테이너에 추가
				imageContainer.appendChild(previewContainer);
			};
			reader.readAsDataURL(file);
		}
	}
}



//output 파일명 출력(이전)------------------------------------------------------------------------------------
/*document.getElementById('file').addEventListener('input', (event) => {
	const files = event.target.files
	output.textContent = Array.from(files).map(file => file.name).join('\n')
})*/

/*다운로드 버튼 클릭 폼 섭밋(이전)---------------------------------------------------------------
Array.from(document.getElementById('ulDownload').children).forEach(function(li) {
	li.addEventListener('click', function() {
		//downloadFileName 인코딩
	document.getElementById('downloadFileName').value = encodeURIComponent(this.dataset.fileName);
		document.getElementById('frmDownload').submit();
	});
});*/