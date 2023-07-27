import { LightningElement, wire } from 'lwc';
import getObjectOptions from '@salesforce/apex/ObjectFieldController.getObjectOptions';
import getFieldOptions from '@salesforce/apex/ObjectFieldController.getFieldOptions';
import fetchRecords from '@salesforce/apex/ObjectFieldController.fetchRecords';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' },
    { label: 'Owner Name', fieldName: 'Owner.Name' },
];

export default class ObjectRecordFetch extends LightningElement {
    objectOptions = [];
    fieldOptions = [];
    selectedObject = '';
    selectedField = '';
    records;
    columns = COLUMNS;

    @wire(getObjectOptions)
    wiredObjectOptions({ error, data }) {
        if (data) {
            this.objectOptions = data;
        } else if (error) {
            console.error(error);
        }
    }

    handleObjectChange(event) {
        this.selectedObject = event.detail.value;
        this.fieldOptions = [];
        this.records = null;
        if (this.selectedObject) {
            getFieldOptions({ objectName: this.selectedObject })
                .then((data) => {
                    this.fieldOptions = data;
                })
                .catch((error) => {
                    console.error(error);
                });
        }
    }

    handleFieldChange(event) {
        this.selectedField = event.detail.value;
        if (this.selectedObject && this.selectedField) {
            const query = `SELECT Id, Name, CreatedDate, Owner.Name FROM ${this.selectedObject} ORDER BY CreatedDate DESC LIMIT 10`;
            fetchRecords({ query })
                .then((data) => {
                    this.records = data;
                })
                .catch((error) => {
                    console.error(error);
                });
        }
    }
}