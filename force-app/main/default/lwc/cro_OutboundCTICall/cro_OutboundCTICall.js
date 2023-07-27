import { LightningElement ,api,track,wire } from 'lwc';
import getAccountData from "@salesforce/apex/cro_OutboundCTICallController.getAccountRecord";
import updateOutboundCallCounter from "@salesforce/apex/cro_OutboundCTICallController.updateClickCount";
import { getRecord } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';
import UserNameFIELD from '@salesforce/schema/User.Name';
import currentUserRoleId from '@salesforce/schema/User.UserRoleId';
import restrictedRoleIdForOutboundCallLabel from "@salesforce/label/c.Restricted_RoleId_For_Outbound_Call";
//import { createLog, showToastMessage } from "c/cro_JavaScriptUtil";

export default class Cro_OutboundCTICall extends LightningElement {
    @api recordId; 
    AccountRecord;
    showPhone = false;
    hidephoneNo;
    originalPhone;
    error;
    viewNumberCounter;
    number;
    newNumberValue;
    @track userId = Id;
    @track currentUserName;
    @track currentUserRoleId;
    @wire(getRecord, { recordId: Id, fields: [UserNameFIELD, currentUserRoleId ]}) 
    currentUserInfo({error, data}) {
        if (data) {
            console.log(data.fields.Name.value);
            console.log(data.fields.UserRoleId.value);
            this.currentUserName = data.fields.Name.value;
            this.currentUserRoleId = data.fields.UserRoleId.value;
        } else if (error) {
            console.log('error');
            this.error = error ;
        }
    }
    connectedCallback() {
        getAccountData({ AccountId: this.recordId})
            .then((result) => {
                console.log(result);
                this.AccountRecord = result;
                this.hidephoneNo =result.Account.Phone2__c;
                this.originalPhone =result.Account.PersonMobilePhone;
                //this.viewNumberCounter = result.View_Number_Counter__c;
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.contacts = undefined;
            });
        }
        getIconName() {
            return 'utility:call';
          }
          handleChange(event){
            console.log('Hnadle event');
            this.newNumberValue = event.target.value;
        } 
        handleClick(){
            console.log('Test on click');
            //console.log('No::'+this.AccountRecord.PersonMobilePhone);
            console.log('No::'+this.AccountRecord.View_Number_Counter__c);
            if(restrictedRoleIdForOutboundCallLabel.includes(this.currentUserRoleId)){
              console.log('not allowed');
              showToastMessage("error", "sticky", "Error", "The current user role cannot access this button. Please contact your administrator.");
            }
            else{
                console.log('Show');
                            
                this.hidephoneNo = this.AccountRecord.PersonMobilePhone;
                this.number =this.template.querySelector('lightning-click-to-dial[data-name="callOutbound"]').value;       
                console.log();
                if(this.hidephoneNo != this.number){
                updateOutboundCallCounter({ recId: this.recordId})
                .then((result) => {
                   console.log('Success'+result);
                   this.showPhone = true;
                })
                .catch((error) => {    
                    console.log('error'+error);                      
                    //createLog(this.componentName, error.body.message, this.recordId);
                    //showToastMessage("error", "sticky", "Error", "Failed to fetch new customer details. Please contact your administrator.");
                });
            }
            else {
                this.showPhone = true;
            }
            }
        }
    }