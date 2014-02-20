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

        public IEnumerable<Contact> GetContacts()
        {
            return ContactDAL.GetContacts();
        }
    }
}