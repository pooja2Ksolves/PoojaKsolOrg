import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class MyComponent extends LightningElement {
  showToast() {
    const event = new ShowToastEvent({
      title: 'Toast Title',
      message: 'This is a toast message',
      variant: 'success',
    });
    this.dispatchEvent(event);
  }
}