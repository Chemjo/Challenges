import { LightningElement } from 'lwc';

export default class ChallengeToggleHeader extends LightningElement {

    headerText = 'Toggleable Header Component';
    isVisible = false;

    toggleInputBox(){
        this.isVisible = !this.isVisible;
        console.log(this.isVisible);
    }

    handleChange(event){
        this.headerText = event.target.value;
        console.log(this.headerText);
    }

}