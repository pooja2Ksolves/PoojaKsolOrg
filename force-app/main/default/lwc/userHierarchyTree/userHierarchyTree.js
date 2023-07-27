import { LightningElement, wire } from 'lwc';
import getUserHierarchy from '@salesforce/apex/UserController2.getUserHierarchy';

export default class UserHierarchyTree extends LightningElement {
    userHierarchy;

    @wire(getUserHierarchy)
    wiredUserHierarchy({ error, data }) {
        if (data) {
            this.userHierarchy = data;
        } else if (error) {
            console.error(error);
        }
    }

    handleSelect(event) {
        console.log(event.detail);
    }
}