global class UpdateLeadBatch implements Database.Batchable<sObject>{

    global String query;
    
    global String country='US'; 

   global Database.QueryLocator start(Database.BatchableContext BC){
      
      query='select Id,Country from Lead where Country=:country';
       
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<Lead> scope){
     
     for(Lead s : scope){
       s.LeadSource='Web';
       s.Rating='Hot';
     }
     update scope;
    }

   global void finish(Database.BatchableContext BC){
   }
}