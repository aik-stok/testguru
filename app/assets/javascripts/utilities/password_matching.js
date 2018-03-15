document.addEventListener('turbolinks:load', function() {
	var input = document.querySelector('#user_password_confirmation')
	if (input) { input.addEventListener('keyup', checkPasswordMatch) }
})

function checkPasswordMatch() {
	var password = $("#user_password").val();
	var confirmPassword = $("#user_password_confirmation").val()

	if (password != confirmPassword) {
		$("#check-password-match").html("Passwords do not match!")
		$(this).css("color","red")
    } 
      else {
		$("#check-password-match").html("Passwords match.")
		$(this).css("color","green")
    }
}