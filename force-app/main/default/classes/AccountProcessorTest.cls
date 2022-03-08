@isTest
public class AccountProcessorTest {
    @isTest
   public static void test(){

    Account a = new Account();
    a.Name = 'JinnyCom2 ';

    insert a;

    Contact con = new Contact();
    con.LastName = 'test3';
    con.AccountId = a.Id;

    Contact con2 = new Contact();
    con2.LastName = 'test4';
    con2.AccountId = a.Id;

    insert con;
    insert con2;


    List<Id> acc_Id_List = new List<Id>();
    acc_Id_List.add(a.Id);
    Test.startTest();
    AccountProcessor.countContacts(acc_Id_List);
    Test.stopTest();

    List<Account> acc1 = new List<Account>([SELECT Number_Of_Contacts__c FROM Account WHERE id in : acc_Id_List]);
    System.assertEquals(2, acc1[0].Number_Of_Contacts__c);
   }
}
