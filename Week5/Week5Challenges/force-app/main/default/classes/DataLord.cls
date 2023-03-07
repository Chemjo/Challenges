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

}