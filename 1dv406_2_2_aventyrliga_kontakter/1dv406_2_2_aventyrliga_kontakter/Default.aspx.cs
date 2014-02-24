using _1dv406_2_2_aventyrliga_kontakter.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _1dv406_2_2_aventyrliga_kontakter
{
    public partial class Default : System.Web.UI.Page
    {
        // Fält
        private Service _service;

        // Egenskap
        private Service Service
        {
            get
            {
                return _service ?? (_service = new Service());
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
       
        }

        // Hämtar alla kontakter som finns lagrade i databasen
        public IEnumerable<Contact> ContactListView_GetDataPageWise(int maximumRows, int startRowIndex, out int totalRowCount)
        {
            return Service.GetContactPageWise(maximumRows, startRowIndex, out totalRowCount);
        }

        // Sparar kontakt i databasen
        public void ContactListView_InsertItem(Contact contact)
        {
            try
            {
                Service.SaveContact(contact);
                StatusLabel.Visible = true;
                StatusLabel.Text = String.Format("<img src='Images/ok.png' /> Kontakten har lagts till.");
            
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Ett oväntat fel inträffade då kontaktuppgiften skulle läggas till.");
            }
        }

        // Uppdaterar kontakt i databasen
        public void ContactListView_UpdateItem(int contactId)
        {
            try
            {
                var contact = Service.GetContact(contactId);

                if (contact == null)
                {
                    ModelState.AddModelError(String.Empty,
                        String.Format("Kontakten med kontaktnummer {0} hittades inte", contactId));
                    return;
                }

                if (TryUpdateModel(contact))
                {
                    Service.SaveContact(contact);
                    StatusLabel.Visible = true;
                    StatusLabel.Text = String.Format("<img src='Images/ok.png' /> Kontakten är uppdaterad.");

                }
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Ett oväntat fel inträffade då kontaktuppgiften skulle uppdateras.");
            }
        }

        // Raderar kontakt i databasen
        public void ContactListView_DeleteItem(int contactId)
        {
            try
            {
                Service.DeleteContact(contactId);
                StatusLabel.Visible = true;
                StatusLabel.Text = String.Format("<img src='Images/ok.png' /> Kontakten är borttagen.");
            }
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Ett oväntat fel inträffade då kontaktuppgiften skulle tas bort.");
            }
        }
    }
}