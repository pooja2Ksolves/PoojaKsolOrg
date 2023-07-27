import { LightningElement, wire, track, api } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import getAccount from '@salesforce/apex/AccountController2.getAccount';
import PHONE_FIELD from '@salesforce/schema/Account.Phone2__c';

export default class PhoneComponent extends LightningElement {
    @api recordId;
    @track phoneNumber;

    @wire(getRecord, { recordId: '$recordId', fields: [PHONE_FIELD] })
    wiredAccount({ error, data }) {
        if (data) {
            const phoneValue = getFieldValue(data, PHONE_FIELD);
            this.phoneNumber = phoneValue;
        }
    }

    handleViewNumber() {
        const numberElement = this.template.querySelector('.phone-number');
        if (numberElement) {
            numberElement.innerText = this.phoneNumber;
        }
    }
    
    connectedCallback() {
        this.loadAccount();
    }

    loadAccount() {
        getAccount({ accountId: this.recordId })
            .then((result) => {
                this.phoneNumber = result.Phone2__c;
            })
            .catch((error) => {
                console.error('Error loading Account', error);
            });
    }
}