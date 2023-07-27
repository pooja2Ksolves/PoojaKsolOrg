import { LightningElement, track } from 'lwc';

export default class MyLinkAndPopupComponent extends LightningElement {
  @track show = false;

  showPopup() {
    this.show = true;
  }
}