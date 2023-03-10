/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/10/2023
Description: Trigger on Contact for Coding Challenges
---------------------------------------------------------------------------------------------------------------------*/
trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType{
        when BEFORE_INSERT {
            //Challenge 2: Setting a default value for an Email on Contacts that do not have one
            ContactHelper.populateContactsWithoutEmails(Trigger.new);
        }
          when BEFORE_UPDATE {}
          when BEFORE_DELETE {}
          when AFTER_INSERT {}
          when AFTER_UPDATE {}
          when AFTER_DELETE {}
          when AFTER_UNDELETE {}
    }
}