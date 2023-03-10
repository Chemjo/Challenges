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


}