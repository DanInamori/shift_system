function checkSubmitBtnEnable(){
  const nameInputCheck = document.querySelectorAll(".member-name-check")
  const shiftCreatorSubmitBtn = document.getElementById("submit_btn")
  const nameNumber = document.querySelectorAll(".member-name-check").length
  for (let i = 0; i < nameNumber; i++ ) {

    nameInputCheck[i].addEventListener('change', () => {
      let checkCount = 0;
      for (let j = 0; j < nameNumber; j++ ) {
        if (nameInputCheck[j].checked){
          checkCount++;
        }
      };
      if (checkCount == 0) {
        shiftCreatorSubmitBtn.setAttribute("style", "background-color: #bbbbbb; pointer-events: none;")
        shiftCreatorSubmitBtn.disabled = true;
      } else if (checkCount > 0) {
        shiftCreatorSubmitBtn.setAttribute("style", "background-color: #CC6600; pointer-events: all;")
        shiftCreatorSubmitBtn.disabled = false;
      }
    });
  }
}
window.addEventListener('load',checkSubmitBtnEnable )