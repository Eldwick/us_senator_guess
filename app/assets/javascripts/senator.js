function checkAnswer() {
  
  if ($("#guess").val() === answer){
    alert("Correct!")
  } else {
    alert("Nope, the senator is from " + answer.)
  }
}

var ready = function () {
}

$(document).ready(ready);
$(document).on('page:load', ready);