import { LightningElement, api } from "lwc";

export default class OrderActions extends LightningElement {
  @api recordId;

  showPopUpdateShippingAddress() {
    /* const modal = this.template.querySelector("c-update-shipping-address");
    modal.showPopUp(); */
  }

  showPopUpRescheduledelivery() {
    /* const modal = this.template.querySelector("c-child-2");
    modal.showPopUp(); */
  }

  showPopUpWarrantyDetails() {
   /*  const modal = this.template.querySelector("c-warranty-details");
    modal.showPopUp(); */
  }
}