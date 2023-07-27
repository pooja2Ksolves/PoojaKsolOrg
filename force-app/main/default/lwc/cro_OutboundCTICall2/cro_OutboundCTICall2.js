import { LightningElement ,api,track,wire} from 'lwc';
import getAccountData from "@salesforce/apex/cro_OutboundCTICallController.getAccountRecord";
import updateOutboundCallCounter from "@salesforce/apex/cro_OutboundCTICallController.updateOutboundCallCounter";
import { getRecord } from 'lightning/uiRecordApi';
//import accountObject from "@salesforce/schema/Account";
//import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
//import viewNumberReason from "@salesforce/schema/Account.View_NumberReason__c";
import Id from '@salesforce/user/Id';
import UserNameFIELD from '@salesforce/schema/User.Name';
import currentUserRoleId from '@salesforce/schema/User.UserRoleId';
//import UsrRoleName from '@salesforce/schema/User.UserRole.DeveloperName';

//import restrictedRoleIdForOutboundCallLabel from "@salesforce/label/c.Restricted_RoleId_For_Outbound_Call";
//import { createLog, showToastMessage } from "c/cro_JavaScriptUtil";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Cro_OutboundCTICall extends LightningElement {
    @api recordId; 
     AccountRecord 
     hidephoneNo;
     originalPhone;
     viewNumberCounter;
     number;
     newNumberValue;
     confirmDisabled = false;
     showError = false;
     isShowPopup = false;
     viewNumberReasonOptions = null;
     selectedViewNumberReason= null;
     @track valuesofnumber = false;
     //viewNumberReason;
     defaultRecordTypeId;
     currentUsrRoleName
     @track showConfirmation = false;
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
            //this.currentUsrRoleName = data.fields.UserRole.value.fields.DeveloperName.value;
            console.log("currentUsrRoleName::"+this.currentUsrRoleName);
        } else if (error) {
            console.log('error');
            this.error = error ;
        }

        /*if(restrictedRoleIdForOutboundCallLabel.includes(this.currentUsrRoleName)){
            this.confirmDisabled = true; 
        }*/
    }
    connectedCallback() {

        getAccountData({ AccountId: this.recordId})
            .then((result) => {
                console.log(result);
                this.AccountRecord = result;
                this.hidephoneNo =result.Phone2__c;
                this.originalPhone =result.Phone;

                this.error = undefined;
                console.log('In null phone'+result.Phone2__c);
                if(result.Phone2__c == null || result.Phone2__c == undefined){
                    this.showError = true;
                    this.confirmDisabled = true; 
                    
                }
            })
            .catch((error) => {
                this.error = error;
                this.contacts = undefined;
            });
        }
        /*@wire(getObjectInfo, { objectApiName: accountObject })
        orderRecordTypeMetadataHandler({ data, error }) {
          if (data) {
            this.defaultRecordTypeId = data.defaultRecordTypeId;
          }
          if (error) {
            this.error = error;
          }
        }
        @wire(getPicklistValues, {
            recordTypeId: "$defaultRecordTypeId",
            fieldApiName: viewNumberReason
          })
          reasonForViewNumberPicklist({ data, error }) {
            if (data) {
              this.viewNumberReasonOptions = data.values;
            }
            if (error) {
              this.error = error;
            }
          }*/
    getIconName() {
        return 'utility:call';
      }
      handleClick(){
        //this.showConfirmation = true;
         console.log('Test on click');
             this.hidephoneNo = this.AccountRecord.Phone;
             this.isShowPopup = true;
             this.valuesofnumber = true;
             console.log("value"+this.valuesofnumber);
             this.confirmDisabled = true;
             this.number =this.template.querySelector('lightning-click-to-dial[data-name="callOutbound"]').value;       
             console.log();
             if(this.hidephoneNo != this.number){
             updateOutboundCallCounter({ recId: this.recordId})
             .then((result) => {
                console.log('Success'+result);
             })
             .catch((error) => {    
                 console.log('error'+error);                      
                 createLog(this.componentName, error.body.message, this.recordId);
                 showToastMessage("error", "sticky", "Error", "Please contact your administrator.");
             });
             this.showConfirmation = false;
         }
         //this.showToast();
        /* const event = new ShowToastEvent({
             title: 'Toast Title',
             message: 'This is a toast message',
             variant: 'success',
           });
           this.dispatchEvent(event);*/

        
     }
      handleClick2() {
        // Redirect to Google link
        window.location.href = 'https://www.google.com';
      }
      
   /*showToast() {
        const event = new ShowToastEvent({
          title: 'Toast Title',
          message: 'This is a toast message',
          variant: 'success',
        });
        this.dispatchEvent(event);
      }*/
    handleCancel(){
        this.isShowPopup = false;
    }
    saveHandle(event){
        console.log('Save handle')
        this.isShowPopup = false;  
    }
    handleChange(event) {            
        console.log("Reason Value"+event.target.value);
    }
    handleClick1() {
        if (this.valuesofnumber){
          console.log("in if");
          this.showConfirmation = true;
        }
     
    }
  
    handleYes() {
      // Call your handleClick method here
      this.showConfirmation = false;
    }
  
    handleNo() {
      this.showConfirmation = false;
    }
  }