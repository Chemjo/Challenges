import { LightningElement, track } from 'lwc';

export default class ChallengeAddButton extends LightningElement {
    
    @track
    listItems = new Array(0);
    input;

    handleInput(event){
        this.input = event.target.value;
        console.log(this.input);
    }

    addListItem(){
        let listItem = {
            id:this.listItems.length,
            text:this.input
        }
        this.listItems.push(listItem);
        console.log('The button has been clicked.')
    }

}