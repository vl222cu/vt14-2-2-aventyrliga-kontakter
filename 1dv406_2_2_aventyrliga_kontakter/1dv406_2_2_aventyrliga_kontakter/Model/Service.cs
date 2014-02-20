using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _1dv406_2_2_aventyrliga_kontakter.Model.DAL;

namespace _1dv406_2_2_aventyrliga_kontakter.Model
{
    public class Service
    {
        // Fält
        private ContactDAL _contactDAL;

        // Egenskap
        private ContactDAL CustomerDAL
        {
            get 
            { 
                return _contactDAL ?? (_contactDAL = new ContactDAL()); 
            }
        }

        // Hämtar vald kontakt ur databasen
        public Contact GetContact(int contactId)
        {
            return ContactDAL.GetContactById(contactId);
        }

        // Hämtar alla kontakter som finns lagrade i databasen
        public IEnumerable<Contact> GetContacts()
        {
            return ContactDAL.GetContacts();
        }

        // Sparar kontakt i databasen
        public void SaveContact(Contact contact)
        {
            if (contact.ContactID == 0)
            {
                ContactDAL.InsertContact(contact);
            }
            else
            {
                ContactDAL.UpdateContact(contact);
            } 
        }

        // Tar bort vald kontakt ur databasen
        public void DeleteContact(int contactId)
        {
            ContactDAL.DeleteContact(contactId);
        }
    }
}