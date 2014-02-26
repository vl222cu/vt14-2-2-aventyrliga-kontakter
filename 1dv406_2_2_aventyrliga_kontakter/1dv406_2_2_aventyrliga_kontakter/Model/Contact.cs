using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace _1dv406_2_2_aventyrliga_kontakter.Model
{
    // Klass för hantering av kontaktuppgifter
    public class Contact
    {
        // Egenskapernas namn och typ ges av tabellen
        // Contact(Person) i databasen
        public int ContactID { get; set; }

        [Required(ErrorMessage="Ett förnamn måste anges.")]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required(ErrorMessage="Ett efternamn måste anges.")]
        [StringLength(50)]
        public string LastName { get; set; }

        [Required(ErrorMessage ="En epostadress måste anges.")]
        [MaxLength(50)]
        [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$", ErrorMessage = "E-postadressen är inte giltig.")]
        public string EmailAddress { get; set; }
    }
}