const sortRatingBtn = document.querySelector('.sort-rating');
const sortPriceBtn = document.querySelector('.sort-price');
const sortDistanceBtn = document.querySelector('.sort-distance');


const sortByRating = () => {
  let cafesToSort = document.querySelectorAll('.card-cafe');
  cafesToSort = Array.prototype.slice.call(cafesToSort, 0);
  cafesToSort.sort(function(a, b) {
    let aord = +parseInt(a.dataset.rating);
    let bord = +parseInt(b.dataset.rating);
    return bord - aord;
  })
  let parent = document.querySelector('.cafe-container');
  parent.innerHTML = "";
  for(let i = 0, l = cafesToSort.length; i < l; i++) {
    parent.appendChild(cafesToSort[i]);
  }
}

sortRatingBtn.addEventListener('click', (e) => {
  console.log("hello");
  sortByRating();
})
