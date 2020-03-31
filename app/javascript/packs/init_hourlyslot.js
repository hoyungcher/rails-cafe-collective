const today = new Date();
const currentHour = today.getHours();
const slots = document.querySelectorAll('.hourly-slots')


slots.forEach((slot, index) => {
  if(currentHour >= (index + 8)) {
    slot.style.backgroundColor = 'rgba(0,0,0,0.1)';
  }
})
