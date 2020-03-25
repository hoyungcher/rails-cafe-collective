const searchButton = document.querySelector('.search')

searchButton.addEventListener("click", (e) => {
  preventDefault();
  document.getElementById("main-index-section").scrollIntoView({behavior: "smooth", block: "start"});
})
