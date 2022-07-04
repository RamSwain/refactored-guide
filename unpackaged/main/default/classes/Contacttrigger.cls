public class Contacttrigger 
{
    public static void contactupdate(map<id,contact> newcontact, map<id,contact> oldcontact)
    {
        if(flag.flag == true)
        {flag.flag = false;
         set<id> contactid = new set<id>(); 
         system.debug('id');
        for(id eid:newcontact.keyset())
        {
            if( newcontact.get(eid).Address_Type__c != null)
            {
                contactid.add(eid);
                system.debug('id'+ eid);
            }
            
        }
        list<account> acclist  = new list<Account>();
        for(account ea:[select id, billing_contact__c, shipping_contact__c from account where billing_contact__c in:contactid or  shipping_contact__c in:contactid])
        {
            system.debug('id'+ ea.id);
            account obj = new account();
            if(ea.Billing_Contact__c == ea.Shipping_Contact__c )
            {
                obj.id = ea.id;
                obj.BillingCity = newcontact.get(ea.Billing_Contact__c).mailingcity;
                obj.BillingCountry = newcontact.get(ea.Billing_Contact__c).mailingcountry;
                obj.BillingPostalCode = newcontact.get(ea.Billing_Contact__c).mailingpostalcode;
                obj.BillingState = newcontact.get(ea.Billing_Contact__c).mailingstate;
                obj.BillingStreet = newcontact.get(ea.Billing_Contact__c).mailingStreet;
                
                obj.ShippingCity = newcontact.get(ea.Billing_Contact__c).mailingcity;
                obj.ShippingCountry = newcontact.get(ea.Billing_Contact__c).mailingcountry;
                obj.ShippingPostalCode = newcontact.get(ea.Billing_Contact__c).mailingpostalcode;
                obj.ShippingState = newcontact.get(ea.Billing_Contact__c).mailingstate;
                obj.ShippingStreet = newcontact.get(ea.Billing_Contact__c).mailingStreet;
                acclist.add(obj);
                system.debug('id'+ ea.id);
                
            }
            else if(ea.Billing_Contact__c != ea.Shipping_Contact__c)
            {
                if(ea.Billing_Contact__c == null)
                {
                    obj.id = ea.id;
                    obj.ShippingCity = newcontact.get(ea.Shipping_Contact__c).mailingcity;
                obj.ShippingCountry = newcontact.get(ea.Shipping_Contact__c).mailingcountry;
                obj.ShippingPostalCode = newcontact.get(ea.Shipping_Contact__c).mailingpostalcode;
                obj.ShippingState = newcontact.get(ea.Shipping_Contact__c).mailingstate;
                obj.ShippingStreet = newcontact.get(ea.Shipping_Contact__c).mailingStreet;
                acclist.add(obj);
                }
                else if(ea.Shipping_Contact__c == null)
                {
                    obj.id = ea.id;
                obj.BillingCity = newcontact.get(ea.Billing_Contact__c).mailingcity;
                obj.BillingCountry = newcontact.get(ea.Billing_Contact__c).mailingcountry;
                obj.BillingPostalCode = newcontact.get(ea.Billing_Contact__c).mailingpostalcode;
                obj.BillingState = newcontact.get(ea.Billing_Contact__c).mailingstate;
                obj.BillingStreet = newcontact.get(ea.Billing_Contact__c).mailingStreet;
                     acclist.add(obj);
                }
                else
                {
                    
                     obj.id = ea.id;
                obj.BillingCity = newcontact.get(ea.Billing_Contact__c).mailingcity;
                obj.BillingCountry = newcontact.get(ea.Billing_Contact__c).mailingcountry;
                obj.BillingPostalCode = newcontact.get(ea.Billing_Contact__c).mailingpostalcode;
                obj.BillingState = newcontact.get(ea.Billing_Contact__c).mailingstate;
                obj.BillingStreet = newcontact.get(ea.Billing_Contact__c).mailingStreet;
                
                obj.ShippingCity = newcontact.get(ea.Shipping_Contact__c).mailingcity;
                obj.ShippingCountry = newcontact.get(ea.Shipping_Contact__c).mailingcountry;
                obj.ShippingPostalCode = newcontact.get(ea.Shipping_Contact__c).mailingpostalcode;
                obj.ShippingState = newcontact.get(ea.Shipping_Contact__c).mailingstate;
                obj.ShippingStreet = newcontact.get(ea.Shipping_Contact__c).mailingStreet;
                acclist.add(obj);
                    
                }
                
            }
        }
         update acclist;
        }
    }

}