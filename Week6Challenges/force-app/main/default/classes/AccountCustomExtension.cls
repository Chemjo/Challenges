public class AccountCustomExtension {
    
    private AccountCustomController pageController;
    private Id recordId;
    
    public AccountCustomExtension(AccountCustomController controller){
        pageController = controller;
        PageReference currentPage = ApexPages.currentPage();
        Map<String,String> parameters = currentPage.getParameters();
        recordId = parameters.get('id');
        pageController.idFromURL = recordId;
    }
    

}