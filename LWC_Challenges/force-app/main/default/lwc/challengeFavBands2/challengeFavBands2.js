import { LightningElement, track,wire } from 'lwc';

export default class ChallengeFavBands extends LightningElement {
    @track
    band = {
        label:'',
        value:''
    };
    bandChosen =  false;
    wantsToLearnMore = false;

    get bands(){
        return [
            {label: 'The Bloody Beetroots', value: 'beetroot'},
            {label: 'System of a Down', value: 'soad'},
            {label: 'Psychedelic P*rn Crumpets', value: 'ppc'},
            {label: 'Caravan Palace', value: 'caravan'},
            {label: 'Scythelord', value: 'scythe'},
            {label: 'Salvatore Ganacci', value: 'salvatore'}
        ];
    }

    handleChange(event){
        this.bandChosen = true;
        this.band.value = event.detail.value;

    }

    refreshBand(){
        this.bandChosen = false;
        wantsToLearnMore = false;
    }

    handleLearn(){
        this.wantsToLearnMore = !this.wantsToLearnMore;
        console.log(this.wantsToLearnMore);
    }
}