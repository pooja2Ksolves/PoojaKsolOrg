import { LightningElement,track } from 'lwc';
import getOrderData from '@salesforce/apex/vlog_OrderSearch.getOrderData';

export default class CustomRecordSearch2 extends LightningElement {
    searchKey;
    @track Orders;
    //This Funcation will get the value from Text Input.
    handelSearchKey(event){
        this.searchKey = event.target.value;
    }

    //This funcation will fetch the order number on basis of searchkey
    SearchOrderHandler(){
        //call Apex method.
        getOrderData({numberkey: this.searchKey})
        .then(result => {
                this.Orders = result;
        })
        .catch( error=>{
            this.Orders = null;
        });

    }
    cols = [
        {label:'Account Name', fieldName:'Account.Name' , type:'text'} ,
        {label:'Order Start Date', fieldName:'EffectiveDate' , type:'Date'} ,
        {label:'Status', fieldName:'Status' , type:'text'}
              
    ]
}