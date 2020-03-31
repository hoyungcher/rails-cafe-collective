const hourlySlots = document.querySelectorAll('.hourly-slots');
const setSeats = document.getElementById('set-seats');


const initSlot = () => {
  if(setSeats) {
    setSeats.addEventListener('input', (event) => {
      hourlySlots.forEach((hourlySlot) => {
        if (hourlySlot.disabled === false) {
          hourlySlot.value = setSeats.value
        }
      })
    })
  }
}

export { initSlot };
