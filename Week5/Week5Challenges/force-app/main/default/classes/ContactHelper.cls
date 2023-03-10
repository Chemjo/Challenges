/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/10/2023
Description: Helper Class for Trigger on Contact for Coding Challenges
---------------------------------------------------------------------------------------------------------------------*/
public class ContactHelper {

    //Utility method to assign a default email to Contacts with none
    public static void populateContactsWithoutEmails(List<Contact> contacts){
        for(Contact c : contacts){
            if(!hasEmail(c)){
                c.Email = 'dummyaddress@placeholder.temp';
            }
        } 
    }

    //Private util method to verify that a Contact has an email
    private static Boolean hasEmail(Contact currentContact){
        return contact.Email != null;
    }

    //Util method to match Contact's phone to related Account after update
    public static void updateRelatedAccountPhone(List<Contact> relatedContacts){
        //Creating a Map to relate our Contact's Account Id and its phone and List to populate accounts
        Map <Id,String> accountIdsMappedByContactPhone = new Map<Id,String>();
        List<Account> accountsToUpdate = new List<Account>();
        
        for(Contact con : relatedContacts){
            if(con.AccountId != null && con.Phone != null){
                accountIdsMappedByContactPhone.put(con.AccountId,con.Phone);
            }
        }

        List<Account> possibleAccounts = [SELECT Phone FROM Account WHERE Id IN :accountIdsMappedByContactPhone.keySet()];

        //We need to make sure there are any possible accounts
        if(possibleAccounts.size() > 0){
            //If we do, iterate through our possible accounts and update them from our map
            for(Account acct : possibleAccounts){
                if(accountIdsMappedByContactPhone.containsKey(acct.Id)){
                    accountsToUpdate.add(new Account(Id = acct.Id, Phone = accountIdsMappedByContactPhone.get(acct.Id)));
                }
            }
        }
        //Only use DML if we actually will update
        if(accountsToUpdate.size()>0){
            update accountsToUpdate;
        }
    }

}