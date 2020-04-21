@isTest
global class UpdateLeadBatchTest {

    @isTest
    global static void CreateLeads()
    {
        List<Lead> leadrecords=new List<Lead>();
        
        for(Integer i=1;i<=10;i++)
        {
            Lead l=new Lead(LastName='Test lead '+i,Company='ABC',Description='Test lead '+i,Country='US');
            
            System.debug('l::'+l);
            
            leadrecords.add(l);
           
            System.debug('leadrecords::'+leadrecords);
        }
        
        insert leadrecords;
        
         Test.startTest();

            UpdateLeadBatch ob = new UpdateLeadBatch();

            Database.executeBatch(ob);
       
        Test.stopTest();
    }
    
}