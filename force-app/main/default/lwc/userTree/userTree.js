import { LightningElement, wire } from 'lwc';
import getUsers from '@salesforce/apex/UserController.getUsers';

export default class UserTree extends LightningElement {
    @wire(getUsers)
    users;
}