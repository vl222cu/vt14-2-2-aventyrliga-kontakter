using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using _1dv406_2_2_aventyrliga_kontakter.Model.DAL;
using System.ComponentModel.DataAnnotations;

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

        // Hämtar kontakter en sida i taget om 20 kontakter 
        public IEnumerable<Contact> GetContactPageWise(int maximumRows, int startRowIndex, out int totalRowCount)
        {
            return ContactDAL.GetContactPageWise(maximumRows, startRowIndex, out totalRowCount);
        }

        // Sparar kontakt i databasen
        public void SaveContact(Contact contact)
        {
            // Validering
            ICollection<ValidationResult> validationResults;
            if (!contact.Validate(out validationResults))
            {
                var ex = new ValidationException("Objektet klarade inte valideringen.");
                ex.Data.Add("ValidationResults", validationResults);
                throw ex;
            }

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