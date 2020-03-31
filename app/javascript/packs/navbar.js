const searchTab = document.getElementById('search-tab');
const bookingsTab = document.getElementById('bookings-tab');
const bookmarksTab = document.getElementById('bookmarks-tab');
const profileTab = document.getElementById('profile-tab');
const logo = document.getElementById('cafe-collective-logo')

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

const changeLogoColor = () => {
    const colors = ['#222831', '#393e46', '#00adb5', '#27496d', '#142850', "#0c7b93", "#00a8cc", "#4f3961", "#ea728c", "#fc9d9d", "#f3d4d4", "#1eb2a6", "#d4f8e8", "#f67575"]
    logo.addEventListener('click', (e) => {
    logo.style.color = colors[Math.floor(Math.random() * colors.length)]
  })
}


export { changeLogoColor };

