const timeSlots = document.querySelectorAll('.time-slot');
const unavailable = document.querySelector('.unavailable');
const totalPrice = document.getElementById('total-price');
const schedule = document.querySelector('.time-slots');

const initBooking = () => {
  timeSlots.forEach((timeSlot) => {
    timeSlot.addEventListener('click', (event) => {
      if (document.querySelectorAll('.active').length === 0) {
        if (!timeSlot.classList.contains('unavailable')) {
          event.currentTarget.classList.add('active');
          displayPrice();
        }
      } else if (document.querySelectorAll('.active').length === 1) {
          event.currentTarget.classList.add('active');
          let arr = [];
          let schArr = Array.from(schedule.children);
          console.log(schArr)
          schArr.forEach((element, index) => {
            if (element.classList.contains("active")) {
              arr.push(index);
            }
          })
          let sliced = schArr.slice(arr[0], arr[1])
          sliced.forEach(element => {
            element.classList.add('active');
          })
          console.log(sliced)
          displayPrice();
      } else {
        removeAllActive();
        event.currentTarget.classList.add('active');
      }

    })
  })
}

const removeAllActive = () => {
  Array.from(schedule.children).forEach((child) => {
    child.classList.remove('active');
  })
};







// const initBooking = () => {
//   timeSlots.forEach((timeSlot) => {
//     if (document.querySelectorAll('.active').length === 0) {
//       if (!timeSlot.classList.contains('unavailable')) {
//         timeSlot.addEventListener('click', (event) => {
//           event.currentTarget.classList.add('active');
//           displayPrice();
//         })
//       }
//     } else if (document.querySelectorAll('.active').length === 1) {
//         console.log("here")

//         timeSlot.addEventListener('click', (event) => {
//           console.log("here")
//           const schedule = document.querySelector('.time-slots');
//           event.currentTarget.classList.add('active');
//           let arr = [];
//           let schArr = Array.from(schedule.children);
//           console.log(schArr)
//           schArr.forEach((element, index) => {
//             if (element.classList.contains("active")) {
//               arr.push(index);
//             }
//           })
//           let sliced = schArr.slice(arr[0], arr[1])
//           sliced.forEach(element => {
//             element.classList.add('active');
//           })
//           console.log(sliced)
//           displayPrice();

//         })

//   }





const displayPrice = () => {
  const activeSlots = Array.from(document.querySelectorAll('.time-slot.active')).length;
  totalPrice.innerText = `Total price: $${ 10 * activeSlots }`;
};


export { initBooking };
