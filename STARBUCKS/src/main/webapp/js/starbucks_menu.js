let imgs = document.getElementsByTagName('img');
Array.from(imgs).forEach(function(img) {
	img.addEventListener('click', function() {
		removeBorderStyle();
		img.style.border = '5px double yellow';
		document.getElementById('menu').value = img.dataset.menu;
	});
});
function removeBorderStyle() {
	let imgs = document.getElementsByTagName('img');
	Array.from(imgs).forEach(function(img) {
		img.style.removeProperty('border');
	});
}
document.getElementById('btnOrder').addEventListener('click', function() {
	document.getElementById('amount').value = document.getElementById('count').value;
	document.getElementById('orderForm').submit();
});

 function addCommas(input) {
        // 정규 표현식을 사용하여 3자리마다 콤마를 추가합니다.
        input.value = input.value.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }