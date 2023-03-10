/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/10/2023
Description: Trigger on Account for Coding Challenges
---------------------------------------------------------------------------------------------------------------------*/

trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    switch on Trigger.operationType{
        when BEFORE_INSERT {}
        when BEFORE_UPDATE {}
        when BEFORE_DELETE {
          //Challenge 1: Prevent Accounts with Contacts from being deleted
          AccountHelper.preventDeleteOnAccountsWithContacts(Trigger.old);
        }
        when AFTER_INSERT {
          /*Challenge 3: When a new Account is going to be inserted, make a new related Contact
            Must be after insert since we need our Account Id's to relate Contacts to*/
          AccountHelper.generateRelatedContacts(this.new);
        }
        when AFTER_UPDATE {}
        when AFTER_DELETE {}
        when AFTER_UNDELETE {}
    }

}