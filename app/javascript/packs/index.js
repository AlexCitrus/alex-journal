const burgerIcon = document.querySelector("#burger");
const navbarMenu = document.querySelector("#nav-links");

burgerIcon.addEventListener("click", () => {
  navbarMenu.classList.toggle("is-active");
  burgerIcon.classList.toggle("is-active");
});



function hideNotice() {
  setInterval(function() {
    document.querySelector('.notification').style.display = "none";
  }, 6000);

  
}

hideNotice();


