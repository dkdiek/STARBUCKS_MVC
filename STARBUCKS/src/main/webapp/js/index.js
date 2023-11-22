// 폼 submit 함수
 function submitForm(formId) {
        let form = document.getElementById(formId);
        form.submit();
        
        //로그인이나 로그아웃 버튼 제출되면 인풋 공백으로 변경
    	document.getElementById('userId').value = '';
    	document.getElementById('userPw').value = '';
    }


// Enter 키 이벤트 처리 함수
function handleEnterKey(event) {
    if (event.key === 'Enter') {
        event.preventDefault(); // 폼의 기본 동작 방지 (엔터 시 폼 전송 방지)
        document.getElementById('loginButton').click(); // 로그인 버튼 클릭
    }
}
	    // 아이디 입력란과 암호 입력란에 이벤트 리스너 등록
			let userIdInput = document.getElementById('userId');
			let userPwInput = document.getElementById('userPw');
			
			if (userIdInput !== null) {
			    userIdInput.addEventListener('keypress', handleEnterKey);
			}
			
			if (userPwInput !== null) {
			    userPwInput.addEventListener('keypress', handleEnterKey);
			}


// 로그인, 로그아웃 url -> /index.star로 표시되도록
if (window.location.pathname === '/login.star' || window.location.pathname === '/logout.star') {
        history.replaceState({}, document.title, '/index.star');
    }