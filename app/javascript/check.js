function radioDeselection() {
  const dayInputsOut = document.querySelectorAll(".form-shift.clock.out")
  const dayInputsIn = document.querySelectorAll(".form-shift.clock.in")
  const dayNumber = document.querySelectorAll(".form-shift.clock.in").length
  for (let i = 0; i < dayNumber ; i++ ) {
    dayInputsOut[i].addEventListener('input', () => {
      uncheckRadioButton(i);
    });
    dayInputsIn[i].addEventListener('input', () => {
      uncheckRadioButton(i);
    });
 }
}
function uncheckRadioButton(i) {
  const freeRadioButton = document.querySelectorAll(".free-radio-button")
  const offRadioButton = document.querySelectorAll(".off-radio-button")
  offRadioButton[i].checked = false;
  freeRadioButton[i].checked = false;
}
window.addEventListener('load', radioDeselection)