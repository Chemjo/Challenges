import { createElement } from 'lwc';
import ChallengeContactAppPage from 'c/challengeContactAppPage';
import { getRecord } from 'lightning/uiRecordApi';

const mockGetRecord = require('./data/getRecord.json');


describe('c-challenge-contact-app-page', () => {

    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('able to wire contact data', async () => {
        const element = createElement('c-challenge-contact-app-page', {
            is: ChallengeContactAppPage
        });

        document.body.appendChild(element);

        getRecord.emit(mockGetRecord);

        await Promise.resolve();

        const names = element.shadowRoot.querySelector('lightning-formatted-name');
        expect(names).toBeDefined(mockGetRecord);
    });

    it('gets correct names', async () => {
        const element = createElement('c-challenge-contact-app-page', {
            is: ChallengeContactAppPage
        });

        document.body.appendChild(element);

        getRecord.emit(mockGetRecord);

        await Promise.resolve();

        const names = element.shadowRoot.querySelector('lightning-formatted-name');
        expect(names).toHaveProperty('Lisa','Jones');
    });

});

