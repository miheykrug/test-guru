document.addEventListener('turbolinks:load', function() {
  var timerId;
  var timer = document.querySelector('#timer');
  var testPassageForm = document.querySelector('#test_passage_form');

  if (timer) {
    var timerEnd = timer.dataset.timerEnd;
  }

  function update() {
    var date = Math.floor(Date.now() / 1000);
    var remainingTime = timerEnd - date;

    if (remainingTime < 1) {
      clearTimeout(timerId);
      testPassageForm.submit()
    }

    var hours = timeFormat(Math.floor(remainingTime / (60 * 60)));
    remainingTime %= 60 * 60;
    timer.children[0].innerHTML = hours;

    var minutes = timeFormat(Math.floor(remainingTime / (60)));
    remainingTime %= 60;
    timer.children[1].innerHTML = minutes;

    var seconds = timeFormat(remainingTime);
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

function timeFormat(time) {
  return (time < 10) ? ('0' + time) : time;
}