trigger animalTrigger on Animal__c (before insert) {

    if(trigger.isBefore && trigger.isInsert){
        List<Animal__c> animalList = Trigger.New;
        for(Animal__c animal: animalList){
            if(!animal.name.contains(animal.Continent__c	)){
                animal.addError('NO NO NO!');
            }
        }
    }
}