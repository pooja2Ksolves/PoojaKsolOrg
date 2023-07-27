import { LightningElement, track, api } from 'lwc';
export default class Sample extends LightningElement {
   @api firstname="hello";
   handlechange(event){
  console.log(this.firstname);  // This will not change even we change the view text data.   
   }
}