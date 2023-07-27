import { LightningElement ,api} from 'lwc';
import getAccount from "@salesforce/apex/OutboundCall.getAccount";

export default class CallDialerFunction extends LightningElement {
   @api RecordId;
   AccountRecord
   CallDialerIcon;
   OriginalPhone;

   connectedCallback(){
    getAccount({AccountId: this.RecordId})
    .then((result) => {
     debugger;
     console.log(result);
     this.AccountRecord = result;
     this.CallDialerIcon = result.Call_Dialer_Icon__c;
     this.OriginalPhone = result.Phone;
     this.error = undefined;
    })
    .catch((error) =>{
        this.error = error;
        this.contacts = undefined;
    } )
   }
}