/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/9/2023
Description: Data handler class utilized in Coding Challenges
---------------------------------------------------------------------------------------------------------------------*/

public without sharing class  DataLord {
    
    /*---------------------------------------------------------------------------------------------------------------------
                                                     SOQL METHODS
    ---------------------------------------------------------------------------------------------------------------------*/
    public Integer numAccounts(){
        List<Account> allAccounts = [SELECT Id FROM Account];
        return allAccounts.size();
    }

    //Challenge 2: Number of Hot Rated Accounts to be Returned
    public Integer numHot(){
        //Declare and query for our list of Hot Rated Accounts
        List<Account> hotAccounts = [SELECT Rating FROM Account WHERE Rating='Hot'];
        //Return the size
        return hotAccounts.size();
    }

    //Challenge 3: Returning the number of Accounts that contain an Ampersand in their name
    public Integer numComplex(){
        //Querying for our relevant accounts using two % wildcards to operate like a 'contains'
        List<Account> complexAccounts = [SELECT Name FROM Account WHERE Name LIKE '%&%'];
        //Return the size
        return complexAccounts.size();
    }

    //Challenge 4: Returning the Big 5 in a single line filtering out nulls sorting from most to least
    public List<Account> bigFive(){
        return [
            SELECT AnnualRevenue
            FROM Account
            ORDER BY AnnualRevenue DESC NULLS LAST
            LIMIT 5
            ];
    }

    //Challenge 5: Returning the most recent Opportunity with an amount over $100,000
    public List<Opportunity> lastBigOpportunity(){
        return [
            SELECT CloseDate, Amount
            FROM Opportunity
            WHERE Amount > 100000
            ORDER BY CloseDate DESC
            LIMIT 1
            ];
    }

    //Challenge 6: Returning all Contacts associated with Hot Rated Accounts (Querying the child for parent fields)
    public List<Contact> majorPlayers(){
        return [
            SELECT Name, Account.Name, Account.Rating
            FROM Contact
            WHERE Account.Rating = 'Hot'
            ];
    }

    /*Challenge 7: Returning the Account Name of the Account with the most associated contacts
     NOTE: WE CANNOT USE AN AGGREGATE FUNCTION WITHIN OUR SUBQUERY*/
    public String mostPopularAccount(){
        //Declaring our return name String and Integer to track greatest amount of Contacts out of our Accounts
        String mostPopularAccountName = '';
        Integer largestCount = 0;
        //SOQL For-Loop to iterate over our Accounts with related Contacts
        for(Account acct : [SELECT Name, (SELECT Name FROM Contacts) FROM Account]){
            //If-statement to check if our current Account
            if(acct.Contacts.size() > largestCount){
                //If we find an Account with more Contacts than the previous most, assign the size and name
                largestCount = acct.Contacts.size();
                mostPopularAccountName = acct.Name;
            }
        } 
        //Return our most popular account
        return mostPopularAccountName;
    }

    /*---------------------------------------------------------------------------------------------------------------------
                                                     SOSL METHODS
    ---------------------------------------------------------------------------------------------------------------------*/

    //SOSL Challenge 1: Find all Contacts and Leads named Tom
    public List<List<SObject>> tomSearcher(){
        return [FIND 'Tom' IN Name FIELDS RETURNING Contact(FirstName), Lead(FirstName)];
    }

    //SOSL Challenge 2: Find all Accounts that contain an 'a' and an 'o' in any field
    public List<Account> accountsWithAO(){
        //Declare and assign an Account List List with any fields containing an a followed by an o
        List<List<Account>> aoAccounts = [FIND '*a*o*' IN All FIELDS RETURNING Account(Name)];
        //Declare and assign an Account List List with any fields containing an o followed by an a
        List<List<Account>> oaAccounts = [FIND '*o*a*' IN All FIELDS RETURNING Account(Name)];
        //Declare an Account List to be returned and assign our first list
        List<Account> allAccounts = aoAccounts[0];
        //Iterate over our second list to add their Accounts
        for(Account acct : oaAccounts[0]){
            allAccounts.add(acct);
        }
        //Return all relevant accounts
        return allAccounts;
    }

    /*---------------------------------------------------------------------------------------------------------------------
                                                     DML METHODS
    ---------------------------------------------------------------------------------------------------------------------*/
    //DML Challenge 1: Create and insert 200 uniquely named Contacts
    public void spawnContacts(){
        //Initializing a List of Contacts
        List<Contact> joebotsForInsertion = new List<Contact>();
        //For-Loop to iterate 200 times and add 200 unique Joebots
        for(Integer i = 0; i < 200; i++){
            //Declaring and assigning our Joebot's unique name
            String joebotUnique = 'Joebot MK' + Math.random();
            //Declaring and assigning our Joebot's number
            String joebotUnitNumber = 'UN_' + i;
            //Initializing our current Joebot and giving it its name
            Contact joebot = new Contact(FirstName = joebotUnique, LastName = joebotUnitNumber);
            //Adding our Joebot to the Contact List
            joebotsForInsertion.add(joebot);
        }
        //DML to add Entire List
        insert joebotsForInsertion;
    }

    //DML Challenge 2: Creating and inserting 3 uniquely named Accounts
    public void createHomes(){
        insert new List<Account>{
            new Account(Name = 'Sintracorp'),
            new Account(Name = 'Umbrella Corporation'),
            new Account(Name = 'Okumura Foods')
        };
    }

    //DML Challenge 3: Deletes the 50 most recent Contacts
    public void relocate(){
        //SOQL Query for a List of our 50 most recent Contacts and its assignment
        List<Contact> contactsToBeRelocated = [
            SELECT CreatedDate, Name
            FROM Contact
            ORDER BY CreatedDate DESC
            LIMIT 50
        ];
        delete contactsToBeRelocated;

    }

    //DML Challenge 4: Relates all Joebots to the 3 Accounts Randomly
    public void assignHomes(){
        //Querying for the Accounts we made previously and assigning them to a List
        List<Account> ourAccounts = [SELECT Name FROM Account WHERE Name = 'Sintracorp' OR Name = 'Umbrella Corporation' OR Name = 'Okumura Foods'];
        //Querying for the Contacts we made previously and assigning them to a List
        List<Contact> ourJoebots = [SELECT FirstName, LastName FROM Contact WHERE FirstName LIKE 'Joebot MK%' AND LastName LIKE 'UN_%'];
        //For-each loop to iterate through our Contacts
        for(Contact joebot : ourJoebots){
            //Generate a random number to pick to which Account our Joebot will be assigned that is refreshed on each loop iteration
            Double randAccount = Math.random();
            /*If-else chain verifying what range the random number falls into and assigns a Joebot accordingly
              1/3 chance for each of our 3 Accounts*/
            if(randAccount <= 0.33){
                joebot.AccountId = ourAccounts[0].Id;
            }else if(randAccount <= 0.66){
                joebot.AccountId = ourAccounts[1].Id;
            }else{
                joebot.AccountId = ourAccounts[2].Id;
            }
        }
        //Updating our records
        update ourJoebots;
    }

}