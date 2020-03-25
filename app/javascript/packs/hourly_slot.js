const hourlySlots = document.querySelectorAll('.hourly-slots');
const setSeats = document.getElementById('set-seats');

setPrice.addEventListener('blur', (event) => {
  hourlySlots.forEach((hourlySlot) => {
    hourlySlot.value = setSeats.value;
  })
})
