/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/7/2023
Description: Data handler class utilized in Coding Challenges
---------------------------------------------------------------------------------------------------------------------*/

public without sharing class  DataLord {
    
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

}