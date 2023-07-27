import { LightningElement, api } from 'lwc';

export default class ShowPhone extends LightningElement {
    @api account;
    get phone() {
        return this.account.Phone;
    }
    get hiddenPhone() {
        return this.account.Phone.slice(0, -6) + "******";
    }
}