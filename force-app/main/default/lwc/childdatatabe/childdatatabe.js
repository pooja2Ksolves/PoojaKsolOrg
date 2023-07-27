import { LightningElement, api, wire } from 'lwc';
import getchildmethod from '@salesforce/apex/GetChild1.getchildmethod';

export default class Childdatatabe extends LightningElement {
    @api parentId;
    Child1Rec;
    Child1Column = [];
    Child2Rec;
    Child2Column = [];
    Child3Rec;
    Child3Column = [];

    @wire(getchildmethod, { ParentId: '$parentId' })
    IstObjects({ error, data }) {
        if (data) {
            this.Child1Column = this.getColumnData(data.lstChild);
            this.Child1Rec = data.lstChild;

            this.Child2Column = this.getColumnData(data.secondChild);
            this.Child2Rec = data.secondChild;

            this.Child3Column = this.getColumnData(data.thirdChild);
            this.Child3Rec = data.thirdChild;
        } else if (error) {
            console.log('error===> ' + JSON.stringify(error));
        }
    }

    getColumnData(records) {
        let columns = [];
        if (records && records.length > 0) {
            for (let fieldName in records[0]) {
                if (fieldName !== 'attributes') {
                    columns.push({ label: fieldName, fieldName: fieldName });
                }
            }
        }
        return columns;
    }
}