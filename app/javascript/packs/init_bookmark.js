const bookmarks = document.querySelectorAll('.bookmark')

const initBookmark = () => {
  bookmarks.forEach((bookmark) => {
    bookmark.addEventListener('click', (event) => {
      const bookmarkElement = event.currentTarget
      const cafeId = bookmarkElement.dataset.id

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
            bookmarkElement.innerHTML = '<i class="fas fa-bookmark"></i>'
          }
        })
    })
  })
}

export { initBookmark };
