const timeSlots = document.querySelectorAll('.time-slot');
const unavailable = document.querySelector('.unavailable');
const totalPrice = document.getElementById('total-price');
const schedule = document.querySelector('.time-slots');
const booked = document.querySelector('.time-booked');




const initBooking = () => {
  timeSlots.forEach((timeSlot) => {
    timeSlot.addEventListener('click', (event) => {
      if (document.querySelectorAll('.active').length === 0) {
        if (!timeSlot.classList.contains('unavailable')) {
          event.currentTarget.classList.add('active');
          displayPrice();
        }
      } else if (document.querySelectorAll('.active').length === 1) {
        if (!timeSlot.classList.contains('unavailable')) {
          event.currentTarget.classList.add('active');
          let arr = [];
          let schArr = Array.from(schedule.children);
          schArr.forEach((element, index) => {
            if (element.classList.contains("active")) {
              arr.push(index);
            }
          })
          let sliced = schArr.slice(arr[0], arr[1] + 1)
          let unavailable = false;
          sliced.forEach(element => {
            element.classList.add('active');
            if (element.classList.contains("unavailable")) {
              unavailable = true;
            }
          })
          if (unavailable) {
            removeAllActive();
            event.currentTarget.classList.add("active")
          }
          displayPrice();
        }
      } else {
        if (!timeSlot.classList.contains('unavailable')) {
          removeAllActive();
          event.currentTarget.classList.add('active');
          displayPrice();
        }
      }

    })
  })
}

const removeAllActive = () => {
  Array.from(schedule.children).forEach((child) => {
    child.classList.remove('active');
  })
};



const displayPrice = () => {
  const activeSlots = Array.from(document.querySelectorAll('.time-slot.active')).length;
  totalPrice.innerText = `Total price: $${ 10 * activeSlots }`;
  updateValues();
};

const updateValues = () => {
  const bookingData = document.getElementById('booking-data');
  const startTime = document.querySelectorAll('.active')[0].dataset.time;
  const duration = document.querySelectorAll('.time-slot.active').length;
  bookingData.value = `${startTime},${duration}`;
}

initBooking();
