document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.test-progress-bar');
  if (progressBar) {
    progressBar.style.width = progressBar.dataset.testProgress + "%"
  }
});