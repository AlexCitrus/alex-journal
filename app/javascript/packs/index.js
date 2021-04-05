const burgerIcon = document.querySelector("#burger");
const navbarMenu = document.querySelector("#nav-links");

burgerIcon.addEventListener("click", () => {
  navbarMenu.classList.toggle("is-active");
  burgerIcon.classList.toggle("is-active");
});

const deleteModal = document.querySelectorAll("#delete-modal");
const modalDelete = document.querySelector(".modal_delete");

for (let i = 0; i < deleteModal.length; i++){

    deleteModal[i].addEventListener("click", () => {
      modalDelete.classList.add("is-active");
    });
}
