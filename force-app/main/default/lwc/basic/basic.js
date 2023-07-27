import { LightningElement } from 'lwc';

export default class Basic extends LightningElement {
    
    get options() {
        return [
            { label: 'Spanish', value: 'Spanish' },
            { label: 'English', value: 'English' },
            { label: 'Portuguese', value: 'Portuguese' },
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
    }

    handleNextClick() {
        const firstName = this.template.querySelector('lightning-input[label="First Name"]').value;
        const lastName = this.template.querySelector('lightning-input[label="Last Name"]').value;
        const email = this.template.querySelector('lightning-input[label="Email"]').value;
        const phoneNumber = this.template.querySelector('lightning-input[label="Phone Number"]').value;
        const preferredLanguage = this.value;
    
        // Create the lead record
        createLeadRecord({ firstName, lastName, email, phoneNumber, preferredLanguage })
          .then(result => {
            // Handle success
            console.log('Lead record created:', result);
            // Perform any additional actions or display success message
          })
          .catch(error => {
            // Handle error
            console.error('Error creating lead record:', error);
            // Perform error handling or display error message
          });
      }
}