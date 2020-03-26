const sortRatingBtn = document.querySelector('.sort-rating');
const sortPriceBtn = document.querySelector('.sort-price');
// const sortDistanceBtn = document.querySelector('.sort-distance');

let cafesToSort = document.querySelectorAll('.card-cafe');
cafesToSort = Array.prototype.slice.call(cafesToSort, 0);

// sort by rating

const sortByRating = () => {
  cafesToSort.sort(function(a, b) {
    let aord = +parseInt(a.dataset.rating);
    let bord = +parseInt(b.dataset.rating);
    return bord - aord;
  })
  let parent = document.querySelector('.cafe-container .row');
  parent.innerHTML = "";
  for(let i = 0, l = cafesToSort.length; i < l; i++) {
    parent.appendChild(cafesToSort[i]);
  }
}

sortRatingBtn.addEventListener('click', (e) => {
  const activeBtn = document.querySelectorAll('.active-sort-btn');
  activeBtn.forEach((button) => {
    button.classList.remove('active-sort-btn')
    // activeBtn.classList.add('inactive-sort-btn')
  });
  e.currentTarget.classList.add('active-sort-btn')
  sortByRating();
})



// sort by price

const sortByPrice = () => {
  cafesToSort.sort(function(a, b) {
    let aord = +parseInt(a.dataset.price);
    let bord = +parseInt(b.dataset.price);
    return aord - bord;
  })
  let parent = document.querySelector('.cafe-container .row');
  parent.innerHTML = "";
  for(let i = 0, l = cafesToSort.length; i < l; i++) {
    parent.appendChild(cafesToSort[i]);
  }
}

sortPriceBtn.addEventListener('click', (e) => {
  const activeBtn = document.querySelectorAll('.active-sort-btn');
  activeBtn.forEach((button) => {
    button.classList.remove('active-sort-btn')
    // activeBtn.classList.add('inactive-sort-btn')
  });
  e.currentTarget.classList.add('active-sort-btn')
  sortByPrice();
})
