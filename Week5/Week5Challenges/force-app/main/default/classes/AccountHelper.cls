/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/9/2023
Description: Helper Class for Trigger on Account for Coding Challenges
---------------------------------------------------------------------------------------------------------------------*/

public class AccountHelper {

    //Utility method to prevent deletion of Accounts with Contacts
    public static void preventDeleteOnAccountsWithContacts(List<Account> accts){
        //Enhanced for-loop to iterate through Account List
        for(Account acct : accts){
            //Verify if Contacts is null
            if(hasContacts(acct)){
                //Attach an error and message and exit the loop
                acct.addError('Account cannot be deleted; has related contacts');
                continue;
            }
        }
    }

    //Utility Method to Verify if Contacts is not null
    private static Boolean hasContacts(Account acct){
        return acct.Contacts != null;
    }

}