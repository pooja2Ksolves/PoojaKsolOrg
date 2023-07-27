import { LightningElement, wire } from 'lwc';
import getUsers from '@salesforce/apex/UserQueryController.getUsers';
import { loadScript, loadStyle } from 'lightning/platformResourceLoader';
import tenantjs from '@salesforce/resourceUrl/tenantjs';

export default class UserList extends LightningElement {
    users = [];

    @wire(getUsers)
    wiredUsers({ error, data }) {
        if (data) {
            this.users = data;
            this.loadTenantJS();
        } else if (error) {
            console.error(error);
        }
    }

    async loadTenantJS() {
        await loadScript(this, tenantjs);
        // Use tenant.js here to show the data
    }

    get userWithTitles() {
        return this.users.map(user => {
            return {
                Id: user.Id,
                Name: user.Name,
                Title: user.Title
            };
        });
    }
}