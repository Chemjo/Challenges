public with sharing class AccountContactController2 {
    
    public List<Wrapper> myVals {get; set;}
    public List<Wrapper> myStartingVals {get; set;}
    public List<Account> selectedAccounts {get; set;}
    public List<Account> systemAccounts {get; set;}

    public String ratingFilter {get; set;}
    public String searchTerm {get; set;}
    
    public AccountContactController2() {
        systemAccounts = [SELECT Name, Rating, (SELECT Name FROM Contacts) FROM Account WHERE Id In (SELECT AccountId FROM Contact)];
        selectedAccounts = new List<Account>();
        myVals = new List<Wrapper>();
        myStartingVals = new List<Wrapper>();
        for(Account a : systemAccounts){
            Wrapper wrapToAdd = new Wrapper(a.Name,'',a);
            wrapToAdd.conField = wrapToAdd.getConField();
            myVals.add(wrapToAdd);
            selectedAccounts.add(a);
        }
        ratingFilter = 'All Accounts';
        searchTerm = '';
        for(Wrapper w : myVals){
            myStartingVals.add(w);
        }
    }

    public PageReference displayPage(){
        PageReference displayPage = Page.AccountContact2;
        filterAccounts();
        return displayPage;
    }

    public PageReference filterPage(){
        PageReference filterPage = Page.AccountContact2Filter;
        resetAccounts();
        return filterPage;
    }

    public void filterAccounts(){
        if(ratingFilter != 'All Accounts'){
            List<Account> filteredAccounts = new List<Account>();
            for(Account a : selectedAccounts){
                if(a.Rating == ratingFilter){
                    filteredAccounts.add(a);
                }
            }
            selectedAccounts.clear();
            myVals.clear();
            for(Account a : filteredAccounts){
                selectedAccounts.add(a);
                Wrapper wrapToAdd = new Wrapper(a.Name,'',a);
                wrapToAdd.conField = wrapToAdd.getConField();
                myVals.add(wrapToAdd);
            }
        }
        else{
            resetAccounts();
        }

    }

    public void resetAccounts(){
        selectedAccounts.clear();
        myVals.clear();
        for(Account a : systemAccounts){
            selectedAccounts.add(a);
            Wrapper wrapToAdd = new Wrapper(a.Name,'',a);
            wrapToAdd.conField = wrapToAdd.getConField();
            myVals.add(wrapToAdd);
        }
    }

    public List<SelectOption> getRatingChoices(){
        List<SelectOption> ratingChoices = new List<SelectOption>();
        ratingChoices.add(new SelectOption('','No Rating Given'));
        ratingChoices.add(new SelectOption('Cold','Cold'));
        ratingChoices.add(new SelectOption('Warm','Warm'));
        ratingChoices.add(new SelectOption('Hot','Hot'));
        ratingChoices.add(new SelectOption('All Accounts','All Accounts'));
        return ratingChoices;
    }

    public String getFilterType(){
        String filterDisplay = '';
        switch on ratingFilter{
            when 'Cold','Warm','Hot'{
                filterDisplay = 'Currently Displaying All Accounts Rated ' + ratingFilter +':';
            }
            when 'All Accounts'{
                filterDisplay = 'Currently Displaying All Accounts:';
            }
            when else{
                filterDisplay = 'Currently Displaying Unrated Accounts:';
            }
        }
        return filterDisplay;
    }

    public void executeSearch(){
        myVals.clear();
        searchTerm = searchTerm.toLowerCase();
        for(Wrapper w : myStartingVals){
            String nameToLowercase = w.getAccField().toLowerCase();
            if(nameToLowercase.contains(searchTerm)){
                myVals.add(w);
            }
        }
        if(myVals.size() == 0){
            for(Wrapper w : myStartingVals){
                myVals.add(w);
            }
        }
    }



    //------------------------------------------------------------------------------------------------------------------------------------------------

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