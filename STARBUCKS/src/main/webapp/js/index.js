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


//팝업-----------------------------------------------------------------------------
		    // 쿠키 찾기
		    let getCookie = function (name) {
		        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		        return value ? value[2] : null;
		    };
		    console.log(getCookie('BlackFridayGift')); // 변경: 'deviceCookie'에서 'BlackFridayGift'로 수정
		
		    // 팝업 닫기
		    let closePop = function () {
		        document.getElementById("popup_layer").style.display = "none";
		    };
		
		    // 기간설정
		    function setCookie(name, value, expiredays) {
		        let todayDate = new Date();
		        todayDate.setDate(todayDate.getDate() + expiredays);
		        document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toUTCString() + ";";
		    }
		
		    // 오늘하루만보기 닫기버튼 스크립트
		    function closeToday() {
		        // 쿠키 유효시간을 0으로 바꿔 로그아웃까지 팝업 안보이기
		        setCookie("BlackFridayGift", "event", 0); // 변경: 'DeviceCookie'에서 'BlackFridayGift'로 수정
		        document.getElementById("popup_layer").style.display = "none";
		    }
		
		    // 로그인한 후에 쿠키가 존재하면 팝업을 보이도록 설정
		    let blackFridayGift = getCookie('BlackFridayGift');
		    if (null != blackFridayGift) {
		        document.getElementById("popup_layer").style.display = "block";
		        document.getElementById("imgBlackFridayGift").src = "./images/popup/" + blackFridayGift + ".jpg";
		    }
		    
/*눈 ------------------------------------------------------------------------------------------ */
var c = document.getElementById('canv'), 
    $ = c.getContext("2d");
var w = c.width = window.innerWidth, 
    h = c.height = window.innerHeight;

Snowy();
function Snowy() {
  var snow, arr = [];
  var num = 600, tsc = 1, sp = 0.5;  //num:눈송이 개수 , tsc:눈송이 가로 변화율, sp:내리는 속도
  var sc = 0.8, t = 10, mv = 20, min = 1;  //sc:눈송이 크기
    for (var i = 0; i < num; ++i) {
      snow = new Flake();
      snow.y = Math.random() * (h + 50);
      snow.x = Math.random() * w;
      snow.t = Math.random() * (Math.PI * 2);
      snow.sz = (100 / (10 + (Math.random() * 100))) * sc;
      snow.sp = (Math.pow(snow.sz * .8, 2) * .15) * sp;
      snow.sp = snow.sp < min ? min : snow.sp;
      arr.push(snow);
    }
  go();
  function go(){
    window.requestAnimationFrame(go);
      $.clearRect(0, 0, w, h);
      //배경색
      $.fillStyle = 'transparent';
      $.fillRect(0, 0, w, h);
      $.fill();
        for (var i = 0; i < arr.length; ++i) {
          f = arr[i];
          f.t += .05;
          f.t = f.t >= Math.PI * 2 ? 0 : f.t;
          f.y += f.sp;
          f.x += Math.sin(f.t * tsc) * (f.sz * .3);
          if (f.y > h + 50) f.y = -10 - Math.random() * mv;
          if (f.x > w + mv) f.x = - mv;
          if (f.x < - mv) f.x = w + mv;
          f.draw();}
 }
 function Flake() {
   this.draw = function() {
      this.g = $.createRadialGradient(this.x, this.y, 0, this.x, this.y, this.sz+8);
      this.g.addColorStop(0, 'hsla(255,255%,255%,1)');
      this.g.addColorStop(1, 'hsla(255,255%,255%,0)');
      $.moveTo(this.x, this.y);
      $.fillStyle = this.g;
      $.beginPath();
      $.arc(this.x, this.y, this.sz, 0, Math.PI * 2, true);
      $.fill();}
  }
}
/*________________________________________*/
window.addEventListener('resize', function(){
  c.width = w = window.innerWidth;
  c.height = h = window.innerHeight;
}, false);

