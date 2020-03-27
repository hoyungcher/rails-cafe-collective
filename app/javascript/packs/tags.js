const inactiveTags = document.querySelectorAll('.tag-btn')
const cafeCards = document.querySelectorAll('.card-cafe')
const selectedTags = []
const expandButton = document.getElementById('expand-btn')
const tagSection = document.querySelector('.tag-section')
const downIcons = document.querySelectorAll('.fa-caret-down')
const upIcons = document.querySelectorAll('.fa-caret-up')
const noresultsMessage = document.getElementById('noresults-message')



const displayMessage = () => {
  const displayedCard = document.querySelectorAll(`.card-cafe[style="display: block;"]`)
  console.log(displayedCard);
  if (displayedCard.length === 0) {
    noresultsMessage.style.display = 'block';
  } else {
    noresultsMessage.style.display = 'none';
  }
}

displayMessage();

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
  console.log(intersection);
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
    displayMessage();

    if (selectedTags.length === 0) {
      showCards();
      displayMessage();
    }
  })
});

expandButton.addEventListener('click', (e) => {
  downIcons.forEach((icon) => {
    icon.classList.toggle('hidden')
  })
  upIcons.forEach((icon) => {
    icon.classList.toggle('hidden')
  })
  tagSection.classList.toggle('hidden')
});
