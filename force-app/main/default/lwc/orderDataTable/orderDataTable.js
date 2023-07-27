import { LightningElement, track, wire } from 'lwc';
import searchOrders from '@salesforce/apex/OrderController.searchOrders';

const columns = [
    { label: 'Order Number', fieldName: 'OrderNumber', type: 'text' },
    { label: 'Account Name', fieldName: 'Account.Name', type: 'text' },
    // Add more columns as needed
];

export default class OrderDataTable extends LightningElement {
    @track searchQuery = '';
    @track data = [];
    columns = columns;

    handleSearch(event) {
        this.searchQuery = event.target.value;
        this.searchOrders();
    }

    @wire(searchOrders, { searchQuery: '$searchQuery' })
    wiredOrders({ error, data }) {
        if (data) {
            this.data = data;
        } else if (error) {
            // Handle error
            console.error(error);
        }
    }
}