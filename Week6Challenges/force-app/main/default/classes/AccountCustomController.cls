public class AccountCustomController {
    
    public Account sintracorp {get; set;}
    
    public AccountCustomController(){
        sintracorp = [SELECT Name, Rating, NumberOfEmployees, AnnualRevenue, BillingCity, Phone FROM Account WHERE Name = 'Sintracorp' LIMIT 1];
    }
    

}