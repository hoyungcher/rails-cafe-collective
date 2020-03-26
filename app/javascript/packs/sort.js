const sortRatingBtn = document.querySelector('.sort-rating');
const sortPriceBtn = document.querySelector('.sort-price');
const sortDistanceBtn = document.querySelector('.sort-distance');

let cafesToSort = document.querySelectorAll('.card-cafe');
cafesToSort = Array.prototype.slice.call(cafesToSort, 0);

// sort by rating
const sortByRating = () => {
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
  sortByRating();
})

// sort by price

// const sortByPrice = () => {
//   cafesToSort.sort(function(a, b) {
//     let aord = +parseInt(a.dataset.price);
//     let bord = +parseInt(b.dataset.price);
//     return aord - bord;
//   })
//   let parent = document.querySelector('.cafe-container');
//   parent.innerHTML = "";
//   for(let i = 0, l = cafesToSort.length; i < l; i++) {
//     parent.appendChild(cafesToSort[i]);
//   }
// }

// sortPriceBtn.addEventListener('click', (e) => {
//   console.log("hello");
//   sortByPrice();
// })
