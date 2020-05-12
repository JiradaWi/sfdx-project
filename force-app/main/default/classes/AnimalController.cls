public with sharing class AnimalController {
    public AnimalController() {

    }

    @AuraEnabled
    public static Map<String, Object> fetchData(){
        Map<String, Object> response = new Map<String, Object>();
        try{
            List<Animal__c> animalList = [SELECT Id, Name, Food__c FROM Animal__c ORDER BY CreatedDate];
            response.put('success', true);
            response.put('data', animalList);
        }catch(Exception ex){
            response.put('success', false);
            response.put('message', ex.getMessage());
        }
        return response;
    }
   
}
