public class AccountsController  {
    @AuraEnabled(cacheable=true)
    public static list<AccountWrapperClass> fetchAccountData(){
        List<AccountWrapperClass> wrapperList = new List<AccountWrapperClass>();
   list<Account> acclist =[Select id ,
                         name,
                         AccountNumber,
                         CreatedDate,
                         AccountSource,Type,(Select id,lastName From Contacts)
                          from Account order by CreatedDate  desc  limit 10
                 ];
                 for(Account acc:acclist){
                    wrapperList.add(new AccountWrapperClass(acc,acc.Contacts.size()));
                 }
                 system.debug('wrapperList::::: '+wrapperList);
                 system.debug('wrapperList::::: '+wrapperList.size());
                 return wrapperList;
    }
}