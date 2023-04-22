public class CountContactHandler {
    public static void CountContact(List<contact> newConlist,List<contact> oldConlist){
        try{
            set<string> accisset = new set<string>();
            if(Newconlist!=null){
                for(Contact con:Newconlist){
                    if(con.AccountId!=null){
                        accisset.add(con.Accountid);
                    }
                }
            }
            if(oldconlist != null){
                for(Contact con : oldconlist){
                    accisset.add(con.accountid);
                } 
            }
            list<Contact> Conlist = [select id ,lastname,Accountid from Contact where Accountid IN:accisset];
            map<string,list<Contact>> accidVScontactmap = new map<string,list<Contact>>();
            for(Contact con:Conlist){
                if(accidVScontactmap.containskey(con.AccountId)){
                    list<Contact> nconList = new list<Contact>();
                    nconList= accidVScontactmap.get(con.Accountid);
                    nconList.add(con);
                    system.debug('nconList--->>> '+nconList);
                    accidVScontactmap.put(con.Accountid,nconList);
                }
                else{
                    accidVScontactmap.put(con.Accountid,new list<Contact>{con});
                    system.debug('accidVScontactmap---->>> '+accidVScontactmap);
                }
            }
            list<Account> acclist = new list<Account>();
            for(Account acc:([select id,name,Number_of_Contacts__c from Account where id IN:accidVScontactmap.keyset()])){
                if(accList!=null){
                    acc.Number_of_Contacts__c =accidVScontactmap.get(acc.id).size();
                    system.debug('acc::: '+acc.Number_of_Contacts__c); 
                    acclist.add(acc);
                }
                
            }
            if(!accList.isEmpty()){
                update accList;
            }
        }catch(Exception ex){
            system.debug('error message--->>>> '+ex.getMessage()+'at line ----->>>>>>> '+ex.getLineNumber());
        } 
    }
    
}