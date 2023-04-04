import { LightningElement } from 'lwc';

export default class ChallengeColorSquare extends LightningElement {
    iconClass = 'grey';

    setRed(){
        this.iconClass = 'red';
    }

    setBlue(){
        this.iconClass = 'blue';
    }

    setGreen(){
        this.iconClass = 'green';
    }
}