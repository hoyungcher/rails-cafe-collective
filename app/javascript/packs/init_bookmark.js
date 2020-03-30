const bookmarks = document.querySelectorAll('.unsaved')
const savedBookmarks = document.querySelectorAll('.saved')

const initBookmark = () => {
  bookmarks.forEach((bookmark) => {
    bookmark.addEventListener('click', (event) => {
      const bookmarkElement = event.currentTarget
      const cafeId = bookmarkElement.dataset.id
      console.log("eventTriggered")
      // send an ajax call here

      const csrfToken = document.querySelector('meta[name="csrf-token"]').content
      const headers = new Headers({
        'X-CSRF-Token': csrfToken
      })

      fetch(`cafes/${cafeId}/bookmarks`, {
        method: 'post',
        headers
      })
        .then(response => response.json())
        .then(data => {
          if (data.message === 'OK') {
            bookmarkElement.innerHTML = '<i class="fas fa-bookmark"></i>';
            bookmarkElement.classList.remove('unsaved');
            bookmarkElement.classList.add('saved');
            bookmarkElement.dataset.bookmarknumber = data.bookmarkid;
          }
        })
    })
  })
  savedBookmarks.forEach((saved) => {
    saved.addEventListener('click', (event) => {
      const savedElement = event.currentTarget
      const cafeId = savedElement.dataset.id
      const bookmarkId = savedElement.dataset.bookmarknumber
      console.log("eventTriggered1")
      const csrfToken = document.querySelector('meta[name="csrf-token"]').content
      const headers = new Headers({
        'X-CSRF-Token': csrfToken
      })

      fetch(`cafes/${cafeId}/bookmarks/${bookmarkId}`, {
        method: 'delete',
        headers
      })
      .then(response => response.json())
      .then(data => {
        if (data.message === 'Deleted') {
          console.log("eventTriggered2")
          savedElement.innerHTML = '<i class="far fa-bookmark"></i>';
          savedElement.classList.remove('saved');
          savedElement.classList.add('unsaved');
          savedElement.removeAttribute('data-bookmarknumber')
          }
        })
    })
  })




}

export { initBookmark };
