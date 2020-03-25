const timeSlots = document.querySelectorAll('.time-slot');
const unavailable = document.querySelector('.unavailable');
const totalPrice = document.getElementById('total-price');
const startEndTime = document.querySelectorAll('.startend')



const initBooking = () => {
  timeSlots.forEach((timeSlot) => {
    if (!timeSlot.classList.contains('unavailable')) {
      timeSlot.addEventListener('click', (event) => {
        event.currentTarget.classList.toggle('active');
        displayPrice();
      })
    }
  })

};

const displayPrice = () => {
  const activeSlots = Array.from(document.querySelectorAll('.time-slot.active')).length;
  totalPrice.innerText = `Total price: $${ 10 * activeSlots }`;
};


export { initBooking };
