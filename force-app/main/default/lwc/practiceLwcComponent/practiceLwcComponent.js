import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class PracticeLwcComponent extends LightningElement {
    connectedCallback(){
        let callMyMethod = this.myFunction(10,2);
        window.alert(callMyMethod);
    }
    myFunction = (dividend,divisor) =>{
      return (dividend/divisor);
    }
}