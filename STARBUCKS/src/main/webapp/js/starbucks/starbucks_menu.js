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
document.getElementById('btnOrder').addEventListener('click', function() {
    if (document.getElementById('menu').value.trim() === '') {
        // 이미지가 선택되지 않은 경우
        alert('메뉴를 선택은 필수입니다');
    } else {
        document.getElementById('amount').value = document.getElementById('count').value;
        document.getElementById('orderForm').submit();
    }
});

// 정규 표현식을 사용하여 3자리마다 콤마를 추가합니다.
 function addCommas(input) {
        input.value = input.value.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }