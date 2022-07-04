trigger contacttrigger on Contact (after update) 
{
    if(trigger.isafter && trigger.isupdate)
    {
        Contacttrigger.contactupdate(trigger.newmap, trigger.oldmap);
    }

}