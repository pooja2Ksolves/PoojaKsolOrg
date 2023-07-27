import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import conObject from '@salesforce/schema/Contact';
import conFirstName from '@salesforce/schema/Contact.FirstName';
import conLastName from '@salesforce/schema/Contact.LastName';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ContactCreate extends LightningElement {
    firstname = '';
    lastname = '';
    ContactChangeVal(event){
        if(event.target.label == 'FirstName'){
         this.firstname = event.target.value;
        }
        if(event.target.label == 'LastName'){
            this.lastname = event.target.value;
           }
    }
    insertContactAction(){
        const fields = {};
        fields[conFirstName.fieldApiName] = this.firstname;
        fields[conLastName.fieldApiName] = this.lastname;

        constRecordInput = {apiName :conObject.ObjectApiName,fields};
        createRecord(recordInput)
        .then(contactobj=>{
            this.contactId = conObject.id;
            this.dispatchEvent(
             new ShowToastEvent({
                title : 'Success',
                message : 'Contact Record has been created',
                variant : 'success',
             }),
            );
        })
        .catch(error =>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title : 'Error creating record',
                    message : 'Error While Creating The record',
                variant : 'error',
                }),
            );
        });
    }
}