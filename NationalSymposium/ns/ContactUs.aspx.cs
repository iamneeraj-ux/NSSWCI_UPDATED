using BllNationalSymposium;
using ModelNationalSymposium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NationalSymposium.ns
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Contact contact = new Contact();
            contact.EmailId = txtEmail.Value;
            contact.MobileNo = Convert.ToInt64(txtPhone.Value);
            contact.Name = txtName.Value;
            contact.Subject = txtSubject.Value;
            contact.Message = txtMessage.Value;
            contact.CreatedBy = Utility.GetIpAddress();
            BllNS.SetContactInfo(contact);
            Utility.ShowToastrSuccess(this, "Your query has been submitted. Thank You for contacting us. ", "Success");
        }
    }
}