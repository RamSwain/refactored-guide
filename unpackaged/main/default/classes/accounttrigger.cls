public class accounttrigger
{
    public static void methodupdate(map<id,Account>oldAccount,map<id,Account>latestAccount)
{
    if(flag.flag == true)
    {
        flag.flag = false;
    list<contact>contactList = new list<contact>();
    list<Account>accountList = new list<Account>();
    for(id eid:latestAccount.keyset())
    {
      
             contact ship = new contact();
            contact bill = new contact();
            contact oship = new contact();
            contact obill = new contact();
            account obj2 = new account();
        if(oldAccount.get(eid).billing_contact__c != latestAccount.get(eid).Billing_contact__c || oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).Shipping_contact__c )
        {//billing contact changed or shipping contact changed
            if(oldAccount.get(eid).billing_contact__c == null && oldAccount.get(eid).shipping_contact__c != null)
            {//c1
                if(latestAccount.get(eid).billing_contact__c == latestAccount.get(eid).shipping_contact__c && latestAccount.get(eid).billing_contact__c != null)
                {//bill==shipp not null
                    ship.id = latestAccount.get(eid).Shipping_contact__c;
                    ship.Address_Type__c = 'Both Billing and Shipping';
                    ship.MailingCity = latestAccount.get(eid).billingCity;
                    ship.MailingCountry = latestAccount.get(eid).BillingCountry;
                    ship.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    ship.MailingState = latestAccount.get(eid).BillingState;
                    ship.MailingStreet = latestAccount.get(eid).BillingStreet;
                    contactList.add(ship);
                    obj2.id = eid;
                    obj2.ShippingCity = latestAccount.get(eid).BillingCity;
                    obj2.ShippingCountry = latestAccount.get(eid).BillingCountry;
                    obj2.ShippingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    obj2.ShippingState = latestAccount.get(eid).BillingState;
                    obj2.ShippingStreet = latestAccount.get(eid).BillingStreet;
                    accountList.add(obj2);
                  
                    //old values
                    if(oldAccount.get(eid).shipping_contact__c != latestAccount.get(eid).Shipping_contact__c  )
                    {
                        oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                    }
                }
                else if(latestAccount.get(eid).billing_contact__c == latestAccount.get(eid).shipping_contact__c && latestAccount.get(eid).billing_contact__c == null)
                {//bill==shipp equals null
                    oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                }
                else if(latestAccount.get(eid).billing_contact__c != latestAccount.get(eid).shipping_contact__c)
                {//bill !=shipp
                    if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c == null)
                    {
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState =  latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                        //old values
                       if(oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).billing_contact__c)
                       {
                           oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                       }

                    }
                    else if(latestAccount.get(eid).billing_contact__c == null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                        ship.id = latestAccount.get(eid).Shipping_contact__c;
                    ship.Address_Type__c = 'Shipping';
                    ship.MailingCity = latestAccount.get(eid).ShippingCity;
                    ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                    ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                    ship.MailingState = latestAccount.get(eid).ShippingState;
                    ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                    contactList.add(ship);
                        //old Values
                        if(latestAccount.get(eid).shipping_contact__c != oldAccount.get(eid).Shipping_contact__c )
                        {
                         
                        oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                            
                        }
                    }
                    else if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState = latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                        ship.id = latestAccount.get(eid).Shipping_contact__c;
                        ship.Address_Type__c = 'Shipping';
                        ship.MailingCity = latestAccount.get(eid).ShippingCity;
                        ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                        ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                        ship.MailingState = latestAccount.get(eid).ShippingState;
                        ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                        contactList.add(ship);
                        //old values
                        if(oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).billing_contact__c && oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).Shipping_contact__c )
                        {
                            oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                        }
                    }
                    
                }
                
            }
            else if(oldAccount.get(eid).shipping_contact__c == null && oldAccount.get(eid).billing_contact__c != null)
            {//c2
                
                if(latestAccount.get(eid).billing_contact__c == latestAccount.get(eid).shipping_contact__c && latestAccount.get(eid).billing_contact__c != null)
                {//bill==shipp not null
                    ship.id = latestAccount.get(eid).Shipping_contact__c;
                    ship.Address_Type__c = 'Both Billing and Shipping';
                    ship.MailingCity = latestAccount.get(eid).billingCity;
                    ship.MailingCountry = latestAccount.get(eid).BillingCountry;
                    ship.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    ship.MailingState = latestAccount.get(eid).BillingState;
                    ship.MailingStreet = latestAccount.get(eid).BillingStreet;
                    contactList.add(ship);
                    obj2.id = eid;
                    obj2.ShippingCity = latestAccount.get(eid).BillingCity;
                    obj2.ShippingCountry = latestAccount.get(eid).BillingCountry;
                    obj2.ShippingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    obj2.ShippingState = latestAccount.get(eid).BillingState;
                    obj2.ShippingStreet = latestAccount.get(eid).BillingStreet;
                    accountList.add(obj2);
                  
                    //old values
                    if(oldAccount.get(eid).Billing_contact__c != latestAccount.get(eid).Shipping_contact__c  )
                    {
                        obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                    }
                    
                }
                else if(latestAccount.get(eid).billing_contact__c == latestAccount.get(eid).shipping_contact__c && latestAccount.get(eid).billing_contact__c == null)
                {//bill==shipp equals null
                        obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                }
                else if(latestAccount.get(eid).billing_contact__c != latestAccount.get(eid).shipping_contact__c)
                {//bill !=shipp
                    if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c == null)
                    {
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState =  latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                        //old Values
                        if(latestAccount.get(eid).billing_contact__c != oldAccount.get(eid).Billing_Contact__c )
                        {
                        obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                        }
                    }
                    else if(latestAccount.get(eid).billing_contact__c == null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                        ship.id = latestAccount.get(eid).Shipping_contact__c;
                    ship.Address_Type__c = 'Shipping';
                    ship.MailingCity = latestAccount.get(eid).ShippingCity;
                    ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                    ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                    ship.MailingState = latestAccount.get(eid).ShippingState;
                    ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                    contactList.add(ship);
                        //old values
                        if(latestAccount.get(eid).Shipping_contact__c != oldAccount.get(eid).Billing_Contact__c)
                        {
                        obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                        }
                        
                    }
                    else if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                        
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState = latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                        ship.id = latestAccount.get(eid).Shipping_contact__c;
                        ship.Address_Type__c = 'Shipping';
                        ship.MailingCity = latestAccount.get(eid).ShippingCity;
                        ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                        ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                        ship.MailingState = latestAccount.get(eid).ShippingState;
                        ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                        contactList.add(ship);
                        //old values
                        if(oldAccount.get(eid).Billing_Contact__c != latestAccount.get(eid).Shipping_contact__c && oldAccount.get(eid).Billing_Contact__c != latestAccount.get(eid).billing_contact__c)
                        {
                        obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                        }
                        
                    }
                    
                }
                
            }
            else if(oldAccount.get(eid).billing_contact__c == null && oldAccount.get(eid).shipping_contact__c == null)
            {//c3
                
                if(latestAccount.get(eid).billing_contact__c == latestAccount.get(eid).shipping_contact__c && latestAccount.get(eid).billing_contact__c != null)
                {//bill==shipp not null
                    
                    ship.id = latestAccount.get(eid).Shipping_contact__c;
                    ship.Address_Type__c = 'Both Billing and Shipping';
                    ship.MailingCity = latestAccount.get(eid).billingCity;
                    ship.MailingCountry = latestAccount.get(eid).BillingCountry;
                    ship.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    ship.MailingState = latestAccount.get(eid).BillingState;
                    ship.MailingStreet = latestAccount.get(eid).BillingStreet;
                    contactList.add(ship);
                    obj2.id = eid;
                    obj2.ShippingCity = latestAccount.get(eid).BillingCity;
                    obj2.ShippingCountry = latestAccount.get(eid).BillingCountry;
                    obj2.ShippingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    obj2.ShippingState = latestAccount.get(eid).BillingState;
                    obj2.ShippingStreet = latestAccount.get(eid).BillingStreet;
                    accountList.add(obj2);
                    
                }
                else if(latestAccount.get(eid).billing_contact__c == latestAccount.get(eid).shipping_contact__c && latestAccount.get(eid).billing_contact__c == null)
                {//bill==shipp equals null
                    
                }
                else if(latestAccount.get(eid).billing_contact__c != latestAccount.get(eid).shipping_contact__c)
                {//bill !=shipp
                    if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c == null)
                    {
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState =  latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                        
                    }
                    else if(latestAccount.get(eid).billing_contact__c == null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                    ship.id = latestAccount.get(eid).Shipping_contact__c;
                    ship.Address_Type__c = 'Shipping';
                    ship.MailingCity = latestAccount.get(eid).ShippingCity;
                    ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                    ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                    ship.MailingState = latestAccount.get(eid).ShippingState;
                    ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                    contactList.add(ship);
                    }
                    else if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                        
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState = latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                        ship.id = latestAccount.get(eid).Shipping_contact__c;
                        ship.Address_Type__c = 'Shipping';
                        ship.MailingCity = latestAccount.get(eid).ShippingCity;
                        ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                        ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                        ship.MailingState = latestAccount.get(eid).ShippingState;
                        ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                        contactList.add(ship);
                    }
                    
                }
                
            }
            else if(oldAccount.get(eid).billing_contact__c != null && oldAccount.get(eid).shipping_contact__c != null)
            {//c4
                
                if(latestAccount.get(eid).billing_contact__c == latestAccount.get(eid).shipping_contact__c && latestAccount.get(eid).billing_contact__c != null)
                {//bill==shipp not null
                    ship.id = latestAccount.get(eid).Shipping_contact__c;
                    ship.Address_Type__c = 'Both Billing and Shipping';
                    ship.MailingCity = latestAccount.get(eid).billingCity;
                    ship.MailingCountry = latestAccount.get(eid).BillingCountry;
                    ship.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    ship.MailingState = latestAccount.get(eid).BillingState;
                    ship.MailingStreet = latestAccount.get(eid).BillingStreet;
                    contactList.add(ship);
                    obj2.id = eid;
                    obj2.ShippingCity = latestAccount.get(eid).BillingCity;
                    obj2.ShippingCountry = latestAccount.get(eid).BillingCountry;
                    obj2.ShippingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    obj2.ShippingState = latestAccount.get(eid).BillingState;
                    obj2.ShippingStreet = latestAccount.get(eid).BillingStreet;
                    accountList.add(obj2);
                    //old values
                    if(oldAccount.get(eid).Billing_contact__c == oldAccount.get(eid).Shipping_contact__c)
                    {//old values same
                        if(oldAccount.get(eid).Billing_contact__c != latestAccount.get(eid).Shipping_contact__c)
                        {
                            obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                        }
                        
                    }
                    else if(oldAccount.get(eid).Billing_contact__c != oldAccount.get(eid).Shipping_contact__c)
                    {//old values not same
                        if(oldAccount.get(eid).Billing_contact__c != latestAccount.get(eid).Billing_contact__c && oldAccount.get(eid).Billing_contact__c != latestAccount.get(eid).Shipping_contact__c )
                        {//old bill
                            obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                        }
                        if(oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).Billing_contact__c && oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).Shipping_contact__c)
                        {//old ship
                            oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                        }
                        
                    }
                }
                else if(latestAccount.get(eid).billing_contact__c == latestAccount.get(eid).shipping_contact__c && latestAccount.get(eid).billing_contact__c == null)
                {//bill==shipp equals null
                    obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                    
                    oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);

                }
                else if(latestAccount.get(eid).billing_contact__c != latestAccount.get(eid).shipping_contact__c)
                {//bill !=shipp
                    if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c == null)
                    {
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState =  latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                        //old values
                        if(oldAccount.get(eid).Billing_contact__c == oldAccount.get(eid).Shipping_contact__c)
                        {//old values same
                            if(latestAccount.get(eid).billing_contact__c != oldAccount.get(eid).Billing_contact__c)
                            {
                                oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                                
                            }
                        }
                        else if(oldAccount.get(eid).Billing_contact__c != oldAccount.get(eid).Shipping_contact__c)
                        {//old values not same
                            if(oldAccount.get(eid).Billing_contact__c != latestAccount.get(eid).billing_contact__c )
                            { //obill
                                obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                            }
                            if(oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).billing_contact__c  )
                            { //oship
                                oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                                
                            }
                            
                        }
                        
                    }
                    else if(latestAccount.get(eid).billing_contact__c == null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                        ship.id = latestAccount.get(eid).Shipping_contact__c;
                    ship.Address_Type__c = 'Shipping';
                    ship.MailingCity = latestAccount.get(eid).ShippingCity;
                    ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                    ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                    ship.MailingState = latestAccount.get(eid).ShippingState;
                    ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                    contactList.add(ship);
                        //old values
                        if(oldAccount.get(eid).Billing_contact__c == oldAccount.get(eid).Shipping_contact__c)
                        {//old values same
                            if(latestAccount.get(eid).Shipping_contact__c != oldAccount.get(eid).Billing_contact__c)
                            {
                                oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                                
                            }
                        }
                        else if(oldAccount.get(eid).Billing_contact__c != oldAccount.get(eid).Shipping_contact__c)
                        {//old values not same
                            if(oldAccount.get(eid).Billing_contact__c != latestAccount.get(eid).Shipping_contact__c )
                            { //obill
                                obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                            }
                            if(oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).Shipping_contact__c  )
                            { //oship
                                oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                                
                            }
                            
                        }
                        
                    }
                    else if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState = latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                        ship.id = latestAccount.get(eid).Shipping_contact__c;
                        ship.Address_Type__c = 'Shipping';
                        ship.MailingCity = latestAccount.get(eid).ShippingCity;
                        ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                        ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                        ship.MailingState = latestAccount.get(eid).ShippingState;
                        ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                        contactList.add(ship);
                        //old values
                        if(oldAccount.get(eid).Billing_contact__c == oldAccount.get(eid).Shipping_contact__c)
                        {//old values same
                            if(latestAccount.get(eid).Shipping_contact__c != oldAccount.get(eid).Billing_contact__c && oldAccount.get(eid).Billing_contact__c != latestAccount.get(eid).billing_contact__c  )
                            {
                                oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                                
                            }
                        }
                        else if(oldAccount.get(eid).Billing_contact__c != oldAccount.get(eid).Shipping_contact__c)
                        {//old values not same
                            if(oldAccount.get(eid).Billing_contact__c != latestAccount.get(eid).Shipping_contact__c && oldAccount.get(eid).Billing_contact__c != latestAccount.get(eid).Billing_contact__c )
                            { //obill
                                obill.id = oldAccount.get(eid).Billing_Contact__c;
                        obill.Address_Type__c = null;
                        obill.MailingCity = null;
                        obill.MailingCountry = null;
                        obill.MailingPostalCode = null;
                        obill.MailingState = null;
                        obill.MailingStreet = null;
                        ContactList.add(obill);
                            }
                            if(oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).Shipping_contact__c && oldAccount.get(eid).Shipping_contact__c != latestAccount.get(eid).billing_contact__c  )
                            { //oship
                                oship.id = oldAccount.get(eid).Shipping_Contact__c;
                        oship.Address_Type__c = null;
                        oship.MailingCity = null;
                        oship.MailingCountry = null;
                        oship.MailingPostalCode = null;
                        oship.MailingState = null;
                        oship.MailingStreet = null;
                        ContactList.add(oship);
                                
                            }
                            
                        }
                        
                        
                    }
                    
                }
                
            }
            
        }
        
        else if(oldAccount.get(eid).BillingCity != latestAccount.get(eid).BillingCity ||oldAccount.get(eid).BillingCountry != latestAccount.get(eid).BillingCountry || oldAccount.get(eid).BillingState != latestAccount.get(eid).BillingState  )
        {//billingaddress changed or shippingaddress changed
             if(latestAccount.get(eid).billing_contact__c == latestAccount.get(eid).shipping_contact__c && latestAccount.get(eid).billing_contact__c != null)
                {//bill==shipp not null
                    bill.id = latestAccount.get(eid).billing_contact__c;
                        //bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState = latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                    obj2.id = eid;
                    obj2.ShippingCity = latestAccount.get(eid).BillingCity;
                    obj2.ShippingCountry = latestAccount.get(eid).BillingCountry;
                    obj2.ShippingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    obj2.ShippingState = latestAccount.get(eid).BillingState;
                    obj2.ShippingStreet = latestAccount.get(eid).BillingStreet;
                    accountList.add(obj2);
                    
                    
                }
            
            else if(latestAccount.get(eid).billing_contact__c != latestAccount.get(eid).shipping_contact__c)
                {//bill !=shipp
                    if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c == null)
                    {
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        //bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState = latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                    }
                    else if(latestAccount.get(eid).billing_contact__c == null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                        ship.id = latestAccount.get(eid).Shipping_contact__c;
                        //ship.Address_Type__c = 'Shipping';
                        ship.MailingCity = latestAccount.get(eid).ShippingCity;
                        ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                        ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                        ship.MailingState = latestAccount.get(eid).ShippingState;
                        ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                        contactList.add(ship);
                    }
                    else if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                         bill.id = latestAccount.get(eid).billing_contact__c;
                        //bill.Address_Type__c = 'Billing';
                        bill.MailingCity = latestAccount.get(eid).BillingCity;
                        bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                        bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                        bill.MailingState = latestAccount.get(eid).BillingState;
                        bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                        contactList.add(bill);
                        ship.id = latestAccount.get(eid).Shipping_contact__c;
                        //ship.Address_Type__c = 'Shipping';
                        ship.MailingCity = latestAccount.get(eid).ShippingCity;
                        ship.MailingCountry = latestAccount.get(eid).ShippingCountry;
                        ship.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                        ship.MailingState = latestAccount.get(eid).ShippingState;
                        ship.MailingStreet = latestAccount.get(eid).ShippingStreet;
                        contactList.add(ship);

                    }
                    
                }
            
            
        }
        
        
    }
        update contactList;
        update accountList;
    }
           
}
    public static void accinsert(map<id,Account> latestAccount)
    {
        if(flag.flag == true)
        {
            flag.flag = false;
            set<id>accid = latestAccount.keyset();
            contact bill = new contact();
            contact ship = new contact();
            account obj2 = new account();
            list<contact>contactList = new list<contact>();
            list<account>accountList = new list<account>();
            for(id eid:accid)
            {
                if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c != null && latestAccount.get(eid).billing_contact__c ==latestAccount.get(eid).shipping_contact__c )
                {
                    bill.id = latestAccount.get(eid).billing_contact__c;
                    bill.Address_Type__c = 'Both Billing and Shipping';
                    bill.MailingCity = latestAccount.get(eid).BillingCity;
                    bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    bill.MailingState = latestAccount.get(eid).BillingState;
                bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                    contactList.add(bill);
                    
                    //
                    obj2.id = eid;
                obj2.BillingCity = latestAccount.get(eid).BillingCity;
                obj2.BillingCountry = latestAccount.get(eid).BillingCountry;
                obj2.BillingPostalCode = latestAccount.get(eid).BillingPostalCode;
                obj2.BillingState = latestAccount.get(eid).BillingState;
                obj2.BillingStreet = latestAccount.get(eid).BillingStreet;
                obj2.ShippingCity = latestAccount.get(eid).BillingCity;
                obj2.ShippingCountry = latestAccount.get(eid).BillingCountry;
                obj2.ShippingPostalCode = latestAccount.get(eid).BillingPostalCode;
                obj2.ShippingState = latestAccount.get(eid).BillingState;
                obj2.ShippingStreet = latestAccount.get(eid).BillingStreet;
                accountList.add(obj2);
                    
                    
                }
                else if(latestAccount.get(eid).billing_contact__c != latestAccount.get(eid).Shipping_contact__c)
                {
                    if(latestAccount.get(eid).billing_contact__c != null && latestAccount.get(eid).shipping_contact__c != null)
                    {
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                    bill.MailingCity = latestAccount.get(eid).BillingCity;
                    bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    bill.MailingState = latestAccount.get(eid).BillingState;
                bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                    contactList.add(bill);
                        
                        //
                        Ship.id = latestAccount.get(eid).Shipping_contact__c;
                        ship.Address_Type__c = 'Shipping';
                    bill.MailingCity = latestAccount.get(eid).ShippingCity;
                    bill.MailingCountry = latestAccount.get(eid).ShippingCountry;
                bill.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                    bill.MailingState = latestAccount.get(eid).ShippingState;
                bill.MailingStreet = latestAccount.get(eid).ShippingStreet;
                    contactList.add(Ship);
                        
                    }
                    else if(latestAccount.get(eid).billing_contact__c == null)
                    {
                        Ship.id = latestAccount.get(eid).Shipping_contact__c;
                        ship.Address_Type__c = 'Shipping';
                    bill.MailingCity = latestAccount.get(eid).ShippingCity;
                    bill.MailingCountry = latestAccount.get(eid).ShippingCountry;
                bill.MailingPostalCode = latestAccount.get(eid).ShippingPostalCode;
                    bill.MailingState = latestAccount.get(eid).ShippingState;
                bill.MailingStreet = latestAccount.get(eid).ShippingStreet;
                    contactList.add(Ship);
                    }
                    else if(latestAccount.get(eid).shipping_contact__c == null)
                    {
                        
                        bill.id = latestAccount.get(eid).billing_contact__c;
                        bill.Address_Type__c = 'Billing';
                    bill.MailingCity = latestAccount.get(eid).BillingCity;
                    bill.MailingCountry = latestAccount.get(eid).BillingCountry;
                bill.MailingPostalCode = latestAccount.get(eid).BillingPostalCode;
                    bill.MailingState = latestAccount.get(eid).BillingState;
                bill.MailingStreet = latestAccount.get(eid).BillingStreet;
                    contactList.add(bill);
                    }
                }
                
            }
            
            update contactList;
            update accountList;
            
        }
    }
}