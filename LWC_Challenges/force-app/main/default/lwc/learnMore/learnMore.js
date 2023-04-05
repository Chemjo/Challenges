import { LightningElement, api } from 'lwc';

export default class LearnMore extends LightningElement {
    @api
    band;

    description = '';

    connectedCallback(){
        this.changeBand();
    }

    disconnectedCallback(){
        this.band = null;
        this.description = '';
    }

    changeBand(){
        switch (this.band){
            case 'beetroot': 
                this.description = 'The Bloody Beetroots is an Italian electronic music project of muscian and producer Bob Rifo (aka Sir Bob Cornelius Rifo or SBCR). '
                                    +'The project\'s sound could be described under electro house, dance-punk, and dubstep genres. '
                                    +'The Bloody Beetroots have been known to collaborate with many other artists, notably Steve Aoki (e.g. Warp 1.9) and Tom Morello (e.g. Lightning Over Mexico). '
                                    +'Other notable songs of theirs include Heavy, My Name is Thunder, and Crash.';
                break;
            case 'soad':
                this.description = 'System of a Down (also referred to as SOAD or just System) is an American heavy metal band formed in Glendale, California. '
                                    +'All of their members are of Armenian descent, either being Armenian immigrants or born to immigrants. '
                                    +'Notable songs of theirs include Chop Suey and Hypnotize, though my personal favorite is Soil off their self-titled album.';
                break;
            case 'ppc':
                this.description = 'Psychedlic P*rn Crumpets is an Australian psychedelic rock band founded in Perth. '
                                    +'Their styling have been compared to other popular Australian groups such as King Gizzard & the Lizard Wizard and Tame Impala. '
                                    +'By their own words, they describe their sound as \"an energetic mess of colour and tone\". '
                                    +'Notable songs include Mr Prism, Social Candy, and Mundungus.';
                break;
            case 'caravan':
                this.description = 'Caravan Palace is a Parsian electroswing band. Their style strikes a balance between lighter electronica and traditional jazz. '
                                    +'Notable influences of theirs include Django Reinhardt, Vitalic, Lionel Hampton, and Daft Punk. '
                                    +'Notable songs include Lone Digger, Jolie Coquine, Dramophone, and a cover of Black Betty.';
                break;
            case 'scythe':
                this.description = 'Scythelord is an international death/thrash metal band.Their current members consist of Frank Hernandez '
                                    +'(Lead Guitar/Bass) from Florida, USA, and Joel [aka Vargskelethor] (Guitar/Vocals) from Skellefteå, Sweden. '
                                    +'Notable songs include Earth Boiling Dystopia, Toxic Minds, and Masquerade of Hate.'
                break;
            case 'salvatore':
                this.description = 'Emir Kobilić [Stage Name: Salvatore Ganacci] is a Bosnian-Swedish DJ and record producer. '
                                    +'His musical style can be categorized under EDM, Moombahton, and trap genres. '
                                    +'Notable songs include Horse, Fight Dirty, and New Generation.';
                break;
            default: 
                this.description = '';
                break;
        }
    }
}