const inactiveTags = document.querySelectorAll('.tag-btn')
const cafeCards = document.querySelectorAll('.card-cafe')
const selectedTags = []

const hideCards = () => {
  cafeCards.forEach((cafe) => {
    cafe.style.display = "none";
  });
}

const showCards =() => {
  cafeCards.forEach((cafe) => {
    cafe.style.display = "block";
  });
}

const removeFromArray = (value) => {
  let counter = 0;
  selectedTags.forEach((tag) => {
    if (tag === value) {
      return;
    }
    counter++
  })
  selectedTags.splice(counter, 1);
}

const cardIsInSelection = (arrayOne, arrayTwo) => {
  let intersection = arrayOne.filter(value => -1 !== arrayTwo.indexOf(value))
  if (intersection[0] === undefined ) {
    return false
  } else {
    return true
  }
}

inactiveTags.forEach((tag) => {
  tag.addEventListener('click', (e) => {
    e.currentTarget.classList.toggle('active');

    hideCards()

    if (e.currentTarget.classList.contains('active')) {
      selectedTags.push(e.currentTarget.innerText);
    } else {
      removeFromArray(e.currentTarget.innerText);
    }

    cafeCards.forEach((cafe) => {
      let tagsArray = cafe.dataset.tags.slice(0, -1).split(',')
      if (cardIsInSelection(tagsArray, selectedTags)) {
        cafe.style.display = "block";
      }
    })

    if (selectedTags.length === 0) {
      showCards();
    }
  })
});
