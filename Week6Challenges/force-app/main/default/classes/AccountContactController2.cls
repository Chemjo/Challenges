public with sharing class AccountContactController2 {
    
    public List<Wrapper> myVals {get; set;}
    public Map<String,Account> nameToAccount {get; set;}
    
    public AccountContactController2() {
        List<Account> systemAccounts = [SELECT Name, (SELECT Name FROM Contacts) FROM Account WHERE Id In (SELECT AccountId FROM Contact)];
        nameToAccount = new Map<String,Account>();
        myVals = new List<Wrapper>();
        for(Account a : systemAccounts){
            Wrapper wrapToAdd = new Wrapper(a.Name,'',a);
            wrapToAdd.conField = wrapToAdd.getConField();
            myVals.add(wrapToAdd);
            nameToAccount.put(a.Name, a);
        }
    }

    private class Wrapper{
        Account acc;

        String accField {get; set;}
        String conField {get; set;}

        public Wrapper(String accField, String conField, Account acc){
            this.accField = accField;
            this.conField = conField;
            this.acc = acc;
        }

        public String getAccField(){
            return acc.Name;
        }

        public String getConField(){
            String returnedNames = '';
            for(Integer i = 0; i < acc.Contacts.size(); i++){
                returnedNames += acc.Contacts[i].Name;
                if(i < acc.Contacts.size()-1){
                    returnedNames += ', ';
                }
            }
            return returnedNames;
        }

    }

}