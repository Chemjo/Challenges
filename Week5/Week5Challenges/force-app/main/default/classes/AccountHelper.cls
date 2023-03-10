/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/10/2023
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

    //Utility method to create a related Contact to our Account(s)
    public static void generateRelatedContacts(List<Account> accountsToRelate){
        /*NOTE: Since we have a trigger auto-assigning a default email to new Contacts 
                without one, we should absolutely bulkify to minimize recussion*/
        List<Contact> contactsToAdd = new List<Contact>();
        for(Integer i = 0; i < accountsToRelate.size(); i++){
            Contact relatedContact = new Contact(
                FirstName = 'Jane' + i,
                LastName = 'Doe' + i,
                Email = 'janedoe'+ i +'@coldfax.com',
                AccountId = accountsToRelate[i].Id
            );
            contactsToAdd.add(relatedContact);
        }
        insert contactsToAdd;
    }
}