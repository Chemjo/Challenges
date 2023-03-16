public class AccountCustomController {
    
    public Account sintracorp {get; set;}
    public Boolean buttonClicked {get; set;}
    public Id idFromURL {get; set;}
     
    public AccountCustomController(){
        sintracorp = [SELECT Name, Rating, NumberOfEmployees, AnnualRevenue, BillingCity, Phone FROM Account WHERE Name = 'Sintracorp' LIMIT 1];
        buttonClicked = false;
        idFromURL = null;
    }
    
    public void buttonClick(){
        if(!buttonClicked){
            buttonClicked = true;
        }
        else{
            buttonClicked = false;
        }
    }
    
    public String getGreeting(){
        Account urlAccount = [SELECT Name FROM Account WHERE Id = :idFromURL];
        return 'Greetings, ' + urlAccount.Name + ' Employee.\nWelcome to the Sintranet.\nHere is the Account Information for Sintracorp:';
    }

}