import { LightningElement } from 'lwc';
export default class LdsRecordForm extends LightningElement {
    strRecordId;
    arrayFields = ['Name', 'AccountNumber', 'Phone', 'Type', 'Website'];
}