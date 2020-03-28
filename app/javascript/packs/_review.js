const rating = document.getElementById("review_rating");
const stars = document.querySelectorAll(".star");

stars.forEach((star, index) => {
  star.addEventListener('click', (e) => {
  rating.value = index + 1

    stars.forEach(resetStar => {
      resetStar.innerHTML = '';
      resetStar.innerHTML = '<i class="far fa-star"></i>'
    })


    let starray = Array.from(stars)
    starray = starray.slice(0, index + 1)
    starray.forEach(clickedStar=> {
      clickedStar.innerHTML = '';
      clickedStar.innerHTML = '<i class="fas fa-star"></i>';
    })

  });
})

