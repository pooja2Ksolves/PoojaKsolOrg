import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import executeQuery from '@salesforce/apex/QueryBuilderController.executeQuery';

export default class QueryBuilder extends LightningElement {
    objectOptions = [];
    fieldOptions = [];
    selectedObject = '';
    selectedFields = [];
    result = null;
    columns = [];

    @wire(getObjectInfo, { objectApiName: '$selectedObject' })
    wiredObjectInfo({ error, data }) {
        if (data) {
            let fields = data.fields;
            this.fieldOptions = fields.map(field => ({
                label: field.label,
                value: field.apiName
            }));
        } else if (error) {
            console.error(error);
        }
    }

    handleObjectChange(event) {
        this.selectedObject = event.target.value;
        this.selectedFields = [];
    }

    handleFieldChange(event) {
        this.selectedFields = event.detail.value;
    }

    async runQuery() {
        const fieldNames = this.selectedFields.join(',');
        const records = await executeQuery({ objectName: this.selectedObject, fields: fieldNames });
        this.result = records;
        this.columns = this.selectedFields.map(fieldName => ({
            label: fieldName,
            fieldName: fieldName
        }));
    }
}