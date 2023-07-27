import { LightningElement, api } from "lwc";

export default class Modal extends LightningElement {
  showModal = false;

  @api show() {
    this.showModal = true;
  }

  handleDialogClose() {
    this.showModal = false;
    this.dispatchEvent(new CustomEvent("close"));
  }

  handleYesClick() {
    this.showModal = false;
    this.dispatchEvent(new CustomEvent("yes"));
  }

  handleNoClick() {
    this.showModal = false;
    this.dispatchEvent(new CustomEvent("no"));
  }
}