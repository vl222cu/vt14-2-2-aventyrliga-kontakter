using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _1dv406_2_2_aventyrliga_kontakter.Model
{
    public class Contact
    {
        // Egenskapernas namn och typ ges av tabellen
        // Contact(Person) i databasen
        public int ContactID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAdress { get; set; }
    }
}