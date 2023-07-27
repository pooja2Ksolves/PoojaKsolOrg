import { LightningElement, track } from 'lwc';
import getContactDetail from '@salesforce/apex/GetChild.getContactDetail';
export default class TreeGridDemo extends LightningElement {

    @track gridColumns =[
        {
            type:'text',
            feildName:'name',
            label:'name'
        },
        {
            type:'text',
            feildName:'FirstName',
            label:'First Name'
        },
        {
            type:'text',
            feildName:'LastName',
            label:'Last Name'
        },
    ];

    @track gridData;

    connectedCallback(){
        getContactDetail() 
        .then(result =>{
        console.log("result"+JSON.stringify(result));
         var tempContact = JSON.parse(JSON.stringify(result));
         console.log("tempContact"+JSON.stringify(tempContact));
         for(var i=0; i<tempContact.length ; i++){
           var newContact = tempContact[i]['Contacts']; 
           console.log("newContact"+JSON.stringify(newContact));
           if(newContact){
            tempContact[i]._children = newContact;
            console.log("tempContact[i]._children"+JSON.stringify(tempContact[i]._children));
           }
         }
         this.gridData = tempContact;
         console.log("this.gridData"+JSON.stringify(this.gridData));
        })
        
        .catch(error=>{
            console.error(JSON.stringify(error));
        })
    }

}