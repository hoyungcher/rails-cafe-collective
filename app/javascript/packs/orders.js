const deliveredTable = document.querySelector('.delivered-orders');
const undeliveredTable = document.querySelector('.undelivered-orders');

const deliveredOrder = document.querySelectorAll('.delivered-order');
const undeliveredOrder = document.querySelectorAll('.undelivered-order');

const noPendingOrders = document.getElementById('no-pending-orders');
const noDeliveredOrders = document.getElementById('no-delivered-orders');

if (deliveredOrder.length > 0) {
  deliveredTable.style.display = "block";
  noDeliveredOrders.style.display = "none";
} else {
  deliveredTable.style.display = "none";
  noDeliveredOrders.style.display = "block";
}


if (undeliveredOrder.length > 0) {
  undeliveredTable.style.display = "block";
  noPendingOrders.style.display = "none";
} else {
  undeliveredTable.style.display = "none";
  noPendingOrders.style.display = "block";
}
