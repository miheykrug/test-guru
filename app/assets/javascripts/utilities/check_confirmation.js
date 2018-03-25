document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.password_confirmation');
  if (control) { control.addEventListener('keyup', checkConfirmation) }
});

function checkConfirmation() {
  var passwordInput = document.querySelector('#user_password');
  var passwordConfirmationInput = document.querySelector('#user_password_confirmation');

  if (passwordInput.value === passwordConfirmationInput.value) {
    this.querySelector('.octicon-check').classList.remove('hide');
    this.querySelector('.octicon-x').classList.add('hide')

  } else {
    this.querySelector('.octicon-x').classList.remove('hide');
    this.querySelector('.octicon-check').classList.add('hide');
  }

  if (passwordConfirmationInput.value === "") {
    this.querySelector('.octicon-x').classList.add('hide');
    this.querySelector('.octicon-check').classList.add('hide');
  }
}

