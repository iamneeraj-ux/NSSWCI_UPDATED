using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ModelNationalSymposium;

namespace NationalSymposium.ns
{
    public partial class FAQ : System.Web.UI.Page
    {
        UserLogin ul;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ul = (UserLogin)Session[ConstString.SessionUser];
                if (ul == null)
                {
                    Response.Redirect(ConstString.LoginPage);
                    throw new NullReferenceException();
                }
                else
                {
                    if (ul.RoleId != ConstString.User)
                    {
                        Response.Redirect(ConstString.LoginPage);
                        throw new NullReferenceException();
                    }
                }
                if (!IsPostBack)
                {
                    // Call the method to fetch data from the database
                    BindData();
                }
                if (CheckAuthentication())
                {
                    sUser.InnerText = ul.Name;


                }
            }
            catch (Exception ex)
            {
                Response.Redirect(ConstString.LoginPage);
            }
        }
        public void BindData()
        {
        }

        public bool CheckAuthentication()
        {
            if (ul != null)
            {
                return true;
            }
            else
            {
                FormsAuthentication.SignOut();
                Response.Redirect("Login.aspx");
                return false;
            }

        }
    }
}