// 이미지 선택시 보더 보여주기
let menuImgs = document.getElementsByClassName('menuImg');

Array.from(menuImgs).forEach(function(img) {
	img.addEventListener('click', function() {
		removeBorderStyle();
		img.style.border = '5px double yellow';
		document.getElementById('menu').value = img.dataset.menu;
	});
});

function removeBorderStyle() {
	let menuImgs = document.getElementsByClassName('menuImg');
	Array.from(menuImgs).forEach(function(img) {
		img.style.removeProperty('border');
	});
}

// 폼 보내기
/*document.getElementById('btnOrder').addEventListener('click', function() {
	if (document.getElementById('menu').value.trim() === '') {
		// 이미지가 선택되지 않은 경우
		alert('메뉴를 선택은 필수입니다');
	} else {
		document.getElementById('amount').value = document.getElementById('count').value;
		document.getElementById('orderForm').submit();
	}
});*/

document.getElementById('btnOrder').addEventListener('click', function() {
    if (document.getElementById('menu').value.trim() === '') {
        // 메뉴가 선택되지 않은 경우
        alert('메뉴 선택은 필수입니다');
        event.preventDefault();  // 폼 제출을 중단
    } else {
        var xhr = new XMLHttpRequest();
        var url = "/starbucks/stock.star";
        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-Type", "application/json");

        var data = {
            param: {
                menu: document.getElementById('menu').value,
                amount: document.getElementById('count').value
            }
        };

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    var jsonResponse = JSON.parse(xhr.responseText);
                    if (1 == jsonResponse.resultCode) {
                        document.getElementById('amount').value = document.getElementById('count').value;
                        document.getElementById('orderForm').submit();
                    } else {
                        alert('주문 가능 개수를 초과하였습니다.(최대수량:' + jsonResponse.data.stock + '개)');
                    }
                } else {
                    // 오류 처리
                    alert('요청을 처리하는 동안 오류가 발생했습니다.');
                }
            }
        };

        var jsonData = JSON.stringify(data);
        xhr.send(jsonData);
    }
});




// 정규 표현식을 사용하여 3자리마다 콤마를 추가합니다.
function addCommas(input) {
	input.value = input.value.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}