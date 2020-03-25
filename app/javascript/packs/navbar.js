const searchTab = document.getElementById('search-tab');
const bookingsTab = document.getElementById('bookings-tab');
const bookmarksTab = document.getElementById('bookmarks-tab');
const profileTab = document.getElementById('profile-tab');

const tabs = document.querySelectorAll('.navbar-item');
tabs.forEach((tab) => {
  tab.addEventListener('click', (event) => {
    disableActiveTabs();
    tab.classList.add('active');
  });
});

const disableActiveTabs = () => {
  tabs.forEach((tab) => {
    tab.classList.remove('active');
  });
};
