import { LightningElement, api } from 'lwc';

export default class FavBand extends LightningElement {
    
    name = '';
    description = '';
    imageRef = '';
    altText = '';

    @api
    band;

    connectedCallback(){
        this.changeBand();
    }

    disconnectedCallback(){
        this.band = null;
        this.name = '';
        this.description = '';
        this.imageRef = '';
        this.altText = '';
    }

    changeBand(){
        switch (this.band){
            case 'beetroot':
                this.name = 'The Bloody Beetroots';
                this.altText = 'Image of '+this.name;  
                this.description = 'The Bloody Beetroots is an Italian electronic music project of muscian and producer Bob Rifo (aka Sir Bob Cornelius Rifo or SBCR). '
                                    +'The project\'s sound could be described under electro house, dance-punk, and dubstep genres. '
                                    +'The Bloody Beetroots have been known to collaborate with many other artists, notably Steve Aoki (e.g. Warp 1.9) and Tom Morello (e.g. Lightning Over Mexico). '
                                    +'Other notable songs of theirs include Heavy, My Name is Thunder, and Crash.';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.h6tQSINXgKLo8UR2M9lgeAHaGk%26pid%3DApi&f=1&ipt=e63ae723f3a73d34c33a051f89d5a54572b742862738f5b6ff22c09e61693908&ipo=images';
                break;
            case 'soad':
                this.name = 'System of a Down';
                this.altText = 'Image of '+this.name; 
                this.description = 'System of a Down (also referred to as SOAD or just System) is an American heavy metal band formed in Glendale, California. '
                                    +'All of their members are of Armenian descent, either being Armenian immigrants or born to immigrants. '
                                    +'Notable songs of theirs include Chop Suey and Hypnotize, though my personal favorite is Soil off their self-titled album.';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F4.bp.blogspot.com%2F-WNHNK33E8Pg%2FTtxmNk0fn5I%2FAAAAAAAAAns%2FnkLLFRmtLaw%2Fs1600%2Fsystem-of-a-down-hd-4-733994.jpg&f=1&nofb=1&ipt=7d241212f87d718a5dd4cf8f93d520b4dbc8a97449f9e0cb1b207a1f8db28f8d&ipo=images';
                break;
            case 'ppc':
                this.name = 'Psychedelic P*rn Crumpets';
                this.altText = 'Image of '+this.name; 
                this.description = 'Psychedlic P*rn Crumpets is an Australian psychedelic rock band founded in Perth. '
                                    +'Their styling have been compared to other popular Australian groups such as King Gizzard & the Lizard Wizard and Tame Impala. '
                                    +'By their own words, they describe their sound as \"an energetic mess of colour and tone\". '
                                    +'Notable songs include Mr Prism, Social Candy, and Mundungus.';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F81wL9y0bYTL._SS500_.jpg&f=1&nofb=1&ipt=8d7b5f7f1248f0817b42b8237a680de322e74bcfc0ad220fca101e2abff88b09&ipo=images';
                break;
            case 'caravan':
                this.name = 'Caravan Palace';
                this.altText = 'Image of '+this.name; 
                this.description = 'Caravan Palace is a Parsian electroswing band. Their style strikes a balance between lighter electronica and traditional jazz. '
                                    +'Notable influences of theirs include Django Reinhardt, Vitalic, Lionel Hampton, and Daft Punk. '
                                    +'Notable songs include Lone Digger, Jolie Coquine, Dramophone, and a cover of Black Betty.';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fstatic.independent.co.uk%2Fs3fs-public%2Fthumbnails%2Fimage%2F2015%2F12%2F13%2F14%2FCaravan-Palace.jpg&f=1&nofb=1&ipt=6ad2b3875f3d2d6e0c611136867c6759789a99361a7a0bdb4bc8945ca34387a0&ipo=images';
                break;
            case 'scythe':
                this.name = 'Scythelord';
                this.altText = 'Image of '+this.name; 
                this.description = 'Scythelord is an international death/thrash metal band.Their current members consist of Frank Hernandez '
                                    +'(Lead Guitar/Bass) from Florida, USA, and Joel [aka Vargskelethor] (Guitar/Vocals) from Skellefteå, Sweden. '
                                    +'Notable songs include Earth Boiling Dystopia, Toxic Minds, and Masquerade of Hate.'
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.genius.com%2F1235c1b3e6f8220f317a9afd85a79a85.1000x1000x1.jpg&f=1&nofb=1&ipt=948d39d4e485a9ad5503706c76c39b448842cdf11ed89265170537acfc8d8360&ipo=images';
                break;
            case 'salvatore':
                this.name = 'Salvatore Ganacci';
                this.altText = 'Image of '+this.name; 
                this.description = 'Emir Kobilić [Stage Name: Salvatore Ganacci] is a Bosnian-Swedish DJ and record producer. '
                                    +'His musical style can be categorized under EDM, Moombahton, and trap genres. '
                                    +'Notable songs include Horse, Fight Dirty, and New Generation.';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi1.sndcdn.com%2Fartworks-9bcbadb7-720e-441b-bcc0-2917f6b74540-0-t500x500.jpg&f=1&nofb=1&ipt=b5cb2d0f1687c036f6a50a4ca8c1d2e70fc1eaa0845a1551105a82f602bce72e&ipo=images';
                break;
            default: 
                this.name = '';
                this.description = '';
                this.imageRef = '';
                this.altText = '';
                break;
        }
    }
    
    /*set band(value){
        switch (value){
            case 'beetroot':
                this.name = 'The Bloody Beetroots';
                this.altText = 'Image of '+this.name;  
                this.description = 'The Bloody Beetroots is an Italian electronic music project of muscian and producer Bob Rifo (aka Sir Bob Cornelius Rifo or SBCR).\n'
                                    +'The project\'s sound could be described under electro house, dance-punk, and dubstep genres.\n'
                                    +'The Bloody Beetroots have been known to collaborate with many other artists, notably Steve Aoki (e.g. Warp 1.9) and Tom Morello (e.g. Lightning Over Mexico)\n.'
                                    +'Other notable songs of theirs include Heavy, My Name is Thunder, and Crash';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.h6tQSINXgKLo8UR2M9lgeAHaGk%26pid%3DApi&f=1&ipt=e63ae723f3a73d34c33a051f89d5a54572b742862738f5b6ff22c09e61693908&ipo=images';
            case 'soad':
                this.name = 'System of a Down';
                this.altText = 'Image of '+this.name; 
                this.description = 'System of a Down (also referred to as SOAD or just System) is an American heavy metal band formed in Glendale, California.\n'
                                    +'All of their members are of Armenian descent, either being Armenian immigrants or born to immigrants.\n'
                                    +'Notable songs of theirs include Chop Suey and Hypnotize, though my personal favorite is Soil off their self-titled album.';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2F4.bp.blogspot.com%2F-WNHNK33E8Pg%2FTtxmNk0fn5I%2FAAAAAAAAAns%2FnkLLFRmtLaw%2Fs1600%2Fsystem-of-a-down-hd-4-733994.jpg&f=1&nofb=1&ipt=7d241212f87d718a5dd4cf8f93d520b4dbc8a97449f9e0cb1b207a1f8db28f8d&ipo=images';
                break;
            case 'ppc':
                this.name = 'Psychedelic P*rn Crumpets';
                this.altText = 'Image of '+this.name; 
                this.description = 'Psychedlic P*rn Crumpets is an Australian psychedelic rock band founded in Perth.\n'
                                    +'Their styling have been compared to other popular Australian groups such as King Gizzard & the Lizard Wizard and Tame Impala.\n'
                                    +'By their own words, they describe their sound as \"an energetic mess of colour and tone\".\n'
                                    +'Notable songs include Mr Prism, Social Candy, and Mundungus.';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F81wL9y0bYTL._SS500_.jpg&f=1&nofb=1&ipt=8d7b5f7f1248f0817b42b8237a680de322e74bcfc0ad220fca101e2abff88b09&ipo=images';
                break;
            case 'caravan':
                this.name = 'Caravan Palace';
                this.altText = 'Image of '+this.name; 
                this.description = 'Caravan Palace is a Parsian electroswing band.\n Their style strikes a balance between lighter electronica and traditional jazz.\n'
                                    +'Notable influences of theirs include Django Reinhardt, Vitalic, Lionel Hampton, and Daft Punk.\n'
                                    +'Notable songs include Lone Digger, Jolie Coquine, Dramophone, and a cover of Black Betty';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fstatic.independent.co.uk%2Fs3fs-public%2Fthumbnails%2Fimage%2F2015%2F12%2F13%2F14%2FCaravan-Palace.jpg&f=1&nofb=1&ipt=6ad2b3875f3d2d6e0c611136867c6759789a99361a7a0bdb4bc8945ca34387a0&ipo=images';
                break;
            case 'scythe':
                this.name = 'Scythelord';
                this.altText = 'Image of '+this.name; 
                this.description = 'Scythelord is an international death/thrash metal band.\n Their current members consist of Frank Hernandez'
                                    +'(Lead Guitar/Bass) from Florida, USA, and Joel [aka Vargskelethor] (Guitar/Vocals) from Skellefteå, Sweden.\n'
                                    +'Notable songs include Earth Boiling Dystopia, Toxic Minds, and Masquerade of Hate.'
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.genius.com%2F1235c1b3e6f8220f317a9afd85a79a85.1000x1000x1.jpg&f=1&nofb=1&ipt=948d39d4e485a9ad5503706c76c39b448842cdf11ed89265170537acfc8d8360&ipo=images';
                break;
            case 'salvatore':
                this.name = 'Salvatore Ganacci';
                this.altText = 'Image of '+this.name; 
                this.description = 'Emir Kobilić [Stage Name: Salvatore Ganacci] is a Bosnian-Swedish DJ and record producer.\n'
                                    +'His musical style can be categorized under EDM, Moombahton, and trap genres.\n'
                                    +'Notable songs include Horse, Fight Dirty, and New Generation.';
                this.imageRef = 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi1.sndcdn.com%2Fartworks-9bcbadb7-720e-441b-bcc0-2917f6b74540-0-t500x500.jpg&f=1&nofb=1&ipt=b5cb2d0f1687c036f6a50a4ca8c1d2e70fc1eaa0845a1551105a82f602bce72e&ipo=images';
                break;
            default: 
                break;
        }
    }*/
}