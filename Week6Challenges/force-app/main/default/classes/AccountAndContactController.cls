public class AccountAndContactController {
    
    public Map<String,Account> nameToAcc {get; set;}
    public Map<String,Contact> nameToCon {get; set;}
    
    public String chosenAcc {get; set;}
    public String chosenCon {get; set;}
    public Boolean isAccountSelected {get; set;}
    public String buttonText {get; set;}
    
    public AccountAndContactController(){
        buttonText = 'Display Account Information';
        nameToAcc = new Map<String,Account>();
        nameToCon = new Map<String,Contact>();
        isAccountSelected = false;
        
    	List<Account> accChoices = [
            SELECT Name,Phone,BillingCity,Rating,NumberOfEmployees,AnnualRevenue,BillingState,BillingCountry,
            (SELECT Name FROM Contacts) 
            FROM Account 
            WHERE Id In (SELECT AccountId FROM Contact)
        ];
        for(Account acc : accChoices){
            nameToAcc.put(acc.Name, acc);
            for(Contact con : acc.Contacts){
                nameToCon.put(con.Name, con);
            }
        }
    }

    public List<SelectOption> getAccChoices(){
        List<SelectOption> choices = new List<SelectOption>();
        for(String name : nameToAcc.keySet()){
            choices.add(new SelectOption(name,name));
        }
        return choices;
    }

    public void displayAccount(){
        if(isAccountSelected){
            isAccountSelected = false;
            buttonText = 'Display Account Information';
        }
        else{
            isAccountSelected = true;
            buttonText = 'Clear Account Information';
        }
    }

    public Account getAccount(){
        return nameToAcc.get(chosenAcc);
    }

    public List<Contact> getRelatedContacts(){
        List<Contact> relatedContacts = new List<Contact>();
        for(Contact con : getAccount().Contacts){
            relatedContacts.add(con);
        }
        return relatedContacts;
    }

}