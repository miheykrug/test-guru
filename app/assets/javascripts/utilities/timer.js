document.addEventListener('turbolinks:load', function() {
  var timerId;
  var timer = document.querySelector('#timer');
  var endTestPassage = document.querySelector('#end_test_passage');
  var testPassageForm = document.querySelector('#test_passage_form');

  if (timer) {
    var timerEnd = timer.dataset.timerEnd;
  }

  function update() {
    var date = Date.now();
    var remainingTime = timerEnd - date;

    if (remainingTime < 1000) {
      clearTimeout(timerId);
      endTestPassage.value = 'true';
      testPassageForm.submit()
    }

    var hours = Math.floor(remainingTime / (1000 * 60 * 60));
    remainingTime %= 1000 * 60 * 60;
    if (hours < 10) hours = '0' + hours;
    timer.children[0].innerHTML = hours;

    var minutes = Math.floor(remainingTime / (1000 * 60));
    remainingTime %= 1000 * 60;
    if (minutes < 10) minutes = '0' + minutes;
    timer.children[1].innerHTML = minutes;

    var seconds = Math.floor(remainingTime / (1000));
    if (seconds < 10) seconds = '0' + seconds;
    timer.children[2].innerHTML = seconds;
  }

  function timerStart() {
    timerId = setInterval(update, 1000);
    update();
  }
  if (timer) {
    timerStart()
  }
});