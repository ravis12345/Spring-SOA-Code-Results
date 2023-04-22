trigger CountRelatedContact on Contact (after insert,after update,after delete) {
     if((trigger.IsAfter && trigger.IsInsert) || (trigger.IsAfter && trigger.IsUpdate) || (trigger.IsAfter && trigger.IsDelete)){
        CountContactHandler.CountContact(trigger.new, trigger.old);
    }

}