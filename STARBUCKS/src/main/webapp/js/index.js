function submitForm() {
	// Get the form element
	let form = document.getElementById('loginForm');

	// Submit the form
	form.submit();
}

document.getElementById('loginButton').addEventListener('click', function() {
	submitForm();
});


function submitOutForm() {
	// Get the form element
	let form2 = document.getElementById('logoutForm');

	// Submit the form
	form2.submit();
}

document.getElementById('logoutButton').addEventListener('click', function() {
	submitOutForm();
});