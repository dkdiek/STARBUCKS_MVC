// 폼 submit 함수
 function submitForm(formId) {
        let form = document.getElementById(formId);
        form.submit();
        
    	document.getElementById('userPw').value = '';
    }

 
// 폼 초기화 함수
function clearLoginForm() {
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
    document.getElementById('userId').addEventListener('keypress', handleEnterKey);
    document.getElementById('userPw').addEventListener('keypress', handleEnterKey);


// 로그인, 로그아웃 이후 url을 /index.star로 표시되도록
if (window.location.pathname === '/login.star' || window.location.pathname === '/logout.star') {
        history.replaceState({}, document.title, '/index.star');
    }
   
    
// 폼 초기화 함수
function clearLoginForm() {
    document.getElementById('userId').value = '';
    document.getElementById('userPw').value = '';
}


// 로그아웃 버튼을 눌렀을 때의 이벤트 핸들러
function handleLogout() {
    // 기존의 이동 기록을 모두 제거
    history.go(-history.length);
}

// 로그아웃 버튼에 이벤트 핸들러 등록
document.getElementById('logoutButton').addEventListener('click', handleLogout);