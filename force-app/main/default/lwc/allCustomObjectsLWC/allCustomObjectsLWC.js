import { LightningElement, track, wire } from 'lwc';
import getAllObjects from '@salesforce/apex/AllCustomObjectHandler.getAllObjects';
//import queueScheOne from '@salesforce/apex/AllCustomObjectHandler.queueScheOne';

export default class AllCustomObjectsLWC extends LightningElement {
    @track objvalue;
    @track selectedobj;
    @track selectedObjName;

    connectedCallback() {
        getAllObjects()
            .then(result => {
                let items = [];
                for(let i=0; i<result.length; i++) {
                    items.push({
                        label: result[i],
                        value: result[i]
                    });
                }
                this.objvalue = items;
            })
            .catch(error => {
                console.log(error);
            });
    }

    handleChange(event) {
        this.selectedobj = event.detail.value;
        console.log('Selected Object: ' + this.selectedobj);
    }

    scheduledQueueable() {
        let nameObj = this.selectedobj;
        console.log('Getting Single Object Name: ' + nameObj);
        queueScheOne({objName: nameObj})
            .then(result => {
                console.log(result);
            })
            .catch(error => {
                console.log(error);
            });
    }
}