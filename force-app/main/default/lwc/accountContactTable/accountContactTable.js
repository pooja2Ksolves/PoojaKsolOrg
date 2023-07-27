import { LightningElement, api, wire, track } from 'lwc';
import getAccountContacts from '@salesforce/apex/AccountContactController.getAccountContacts';
import saveContactChanges from '@salesforce/apex/AccountContactController.saveContactChanges';

const columns = [
    { label: 'Serial No.', fieldName: 'serialNumber', type: 'text' },
    { label: 'Contact Name', fieldName: 'contactName', type: 'text', editable: true },
    { label: 'Account Name', fieldName: 'accountName', type: 'text', editable: true },
    { label: 'Email', fieldName: 'email', type: 'email', editable: true },
    { label: 'Phone', fieldName: 'phone', type: 'phone', editable: true }
];

export default class AccountContactTable extends LightningElement {
    @api recordId;

    @track contactData;
    @track columns = columns;
    @track isEditMode = false;

    @wire(getAccountContacts, { accountId: '$recordId' })
    wiredAccountContacts({ error, data }) {
        if (data) {
            let count = 1;
            this.contactData = data.map((contact) => ({
                id: contact.Id,
                serialNumber: count++,
                contactName: contact.Name,
                accountName: contact.Account.Name,
                email: contact.Email,
                phone: contact.Phone
            }));
        } else if (error) {
            console.log('Error fetching account contacts:', error);
        }
    }

    handleEdit() {
        this.isEditMode = true;
    }

    handleSave() {
        const modifiedContacts = this.contactData.filter(contact => contact._edited);
        if (modifiedContacts.length === 0) {
            this.isEditMode = false;
            return;
        }

        const modifiedContactData = modifiedContacts.map(contact => ({
            Id: contact.id,
            Name: contact.contactName,
            Account: { Name: contact.accountName },
            Email: contact.email,
            Phone: contact.phone
        }));

        saveContactChanges({ contactData: modifiedContactData })
            .then(result => {
                // Handle successful save, if required
                this.isEditMode = false;
            })
            .catch(error => {
                console.error('Error saving contact changes:', error);
                // Handle error, if required
            });
    }

    handleCancel() {
        this.isEditMode = false;
        // Reset changes, if required
    }

    handleCellChange(event) {
        const { fieldName, value, rowId } = event.detail;
        const editedRow = this.contactData.find(contact => contact.id === rowId);
        if (editedRow) {
            editedRow[fieldName] = value;
            editedRow._edited = true;
        }
    }
}