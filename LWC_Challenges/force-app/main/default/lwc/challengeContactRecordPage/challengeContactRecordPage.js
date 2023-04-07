import { LightningElement, wire, api } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const FIELDS = ['Contact.FirstName','Contact.LastName'];

export default class ChallengeContactRecordPage extends LightningElement {
    @api 
    recordId;

    contact;
    firstName;
    lastName;
    
    @wire(getRecord,{ recordId: '$recordId', fields: FIELDS})
    contact({error, data}){
        if(error){
            let message = 'Error';
            if(Array.isArray(error.body)){
                message.error.body.map(e => e.message).join(', ');
            }
            else if(typeof error.body.message === 'string'){
                message = error.body.message;
            }
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Couldn\' load Contact',
                    message,
                    variant: 'error'
                })
            );
        }
        else if(data){
            this.contact = data;
            this.firstName = this.contact.fields.FirstName.value;
            this.lastName = this.contact.fields.LastName.value;
        }
    }

}