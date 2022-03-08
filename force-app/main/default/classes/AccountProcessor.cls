
public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> account_List){

        List<Account> isAccount = [SELECT Number_Of_Contacts__c FROM Account WHERE id in : account_List ];
        
        for(Account a : isAccount){

        a.Number_of_Contacts__c = a.Contacts.size();
    }
        insert isAccount;
    }

    
}
