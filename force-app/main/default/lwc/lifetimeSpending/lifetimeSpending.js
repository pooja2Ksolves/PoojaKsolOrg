import { LightningElement, track } from 'lwc';
import getAccountLifetimeSpending from '@salesforce/apex/lwcLifetimeSpendingController.getAccountLifetimeSpending';
import Longitude from '@salesforce/schema/Lead.Longitude';

export default class lifetimeSpending extends LightningElement {
    @track Opportunitys = [];
    @track error;
    accId = '0012w000016koROAAY';

    handleLoad() {
        console.log("in load");
        getAccountLifetimeSpending({ accId: this.accId })
            .then(result => {
                this.Opportunitys = result;
                console.log("result"+this.Opportunitys);
                console.log("result stringify"+JSON.stringify(this.Opportunitys));

            })
            .catch(error => {
                this.error = error;
            });
    }
}