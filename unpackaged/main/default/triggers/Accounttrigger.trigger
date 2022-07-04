trigger Accounttrigger on Account (after insert,after update) 
{
    if(trigger.isafter && trigger.isupdate)
    {
      accounttrigger.methodupdate(trigger.oldmap, trigger.newmap);
    }
    
    else if(trigger.isafter && trigger.isinsert)
    {
        accounttrigger.accinsert(trigger.newmap);
    }
}