function radioDeselection() {
  const dayInputs = document.querySelectorAll(".form-shift")
  console.log(dayInputs)
  dayInputs.addEventListener('input', () => {
    const radioButton = document.querySelectorAll(".radio-button")
    radioButton.checked = false;
  });
}
window.addEventListener('load', radioDeselection)