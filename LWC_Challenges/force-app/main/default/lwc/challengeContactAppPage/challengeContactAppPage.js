import { LightningElement,wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';



export default class ChallengeContactAppPage extends LightningElement {

    @wire(getRecord,{ recordId: '0038b0000344az1AAA', fields: [FIRSTNAME_FIELD, LASTNAME_FIELD]})
    contact;

    get firstName(){
        return getFieldValue(this.contact.data, FIRSTNAME_FIELD);
    }

    get lastName(){
        return getFieldValue(this.contact.data, LASTNAME_FIELD);
    }

}