using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mail;
using BllNationalSymposium;
using ModelNationalSymposium;
using System.Configuration.Provider;
using System.Configuration;
using System.Security.Policy;


namespace NationalSymposium.ns
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }

        }

        public void BindData()
        {
            Utility.BindStates(ddlStates);
            Utility.BindDesignation(ddlDesignation);
            Utility.BindOrganisation(ddlOrganization);
            //Utility.BindtxtOtherOrganisation(ddlOrganization);

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            //string Organisation = txtOtherOrganisation.Text.Trim();
            //string Designation = txtOtherDesignation.Text.Trim();
            Registrations registrations = new Registrations();
            registrations.Name = txtName.Text;
            registrations.EmailId = txtemail.Text;
            registrations.HashPassword = txtpassword.Text;
            registrations.CreatedOn = DateTime.Now;
            registrations.CreatedBy = Utility.GetIpAddress();
            registrations.UpdatedOn = Utility.GetMinDate();
            registrations.MobileNo = Convert.ToInt64(txtMobile.Text);
            registrations.Participants = Convert.ToInt32(rdbParticipants.SelectedValue);
            registrations.Designation = Convert.ToInt32(ddlDesignation.SelectedValue);
            registrations.State = Convert.ToInt32(ddlStates.SelectedValue);
            registrations.Organization = Convert.ToInt32(ddlOrganization.SelectedValue);
            int radioButtonValue = registrations.Participants;
            if (flexCheckDefault.Checked == true)
            {
                if (radioButtonValue == ConstString.Speaker)
                {
                    try
                    {
                        Utility.SendHtmlFormattedEmail(txtemail.Text, "Registration Successful", PopulateBody(txtName.Text, txtemail.Text, txtpassword.Text));
                        int i = BllNS.SetUserRegistration(registrations);


                        if (i > 0)
                        {
                            if (ddlOrganization.SelectedValue == ConstString.OthersOrganisation)
                            {
                                BllNS.SetInsertOrganization(txtOtherOrganisation.Text, registrations.EmailId);
                            }
                            if (ddlDesignation.SelectedValue == ConstString.OthersDesignation)
                            {
                                BllNS.SetInsertDesignation(txtOtherDesignation.Text, registrations.EmailId);
                            }
                            Response.Redirect("Login.aspx");
                        }


                        else
                        {
                            Utility.ShowToastrError(this, "Register Not Success", "Error");
                        }
                    }
                    catch (Exception ex)
                    {
                        Utility.ShowToastrError(this, "Registration Not Successful. Please Try Again!!!", "Success");
                    }

                }
                else if (radioButtonValue == ConstString.Participants)
                {
                    int i = BllNS.SetUserRegistration(registrations);


                    if (i > 0)
                    {
                        if (ddlOrganization.SelectedValue == ConstString.OthersOrganisation)
                        {
                            BllNS.SetInsertOrganization(txtOtherOrganisation.Text, registrations.EmailId);
                        }
                        if (ddlDesignation.SelectedValue == ConstString.OthersDesignation)
                        {
                            BllNS.SetInsertDesignation(txtOtherDesignation.Text, registrations.EmailId);
                        }
                    }
                    else
                    {
                        Utility.ShowToastrError(this, "Register Not Success", "Error");
                    }
                    Response.Redirect("../index.aspx");
                }

                Clear();
            }
            else
            {
                Utility.ShowToastrError(this,"Please Check Terms and Conditions","Error");
            }

        }
        public void Clear()
        {
            txtName.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtpassword.Text = string.Empty;
            txtMobile.Text = string.Empty;
            ddlStates.SelectedIndex = -1;
            ddlOrganization.SelectedIndex = -1;
            ddlDesignation.SelectedIndex = -1;
            rdbParticipants.SelectedIndex = -1;
        }

        private string PopulateBody(string userName, string email, string password)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/register_success.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{UserName}", userName);
            body = body.Replace("{EmailId}", email);
            body = body.Replace("{Password}", password);
            return body;
        }

        private bool IsPasswordValid(string password)
        {
            // Password should be at least 8 characters long.
            if (password.Length < 8)
            {
                return false;
            }

            // Password should contain at least one uppercase letter.
            if (!password.Any(char.IsUpper))
            {
                return false;
            }

            // Password should contain at least one lowercase letter.
            if (!password.Any(char.IsLower))
            {
                return false;
            }

            // Password should contain at least one digit (number).
            if (!password.Any(char.IsDigit))
            {
                return false;
            }

            // Add more validation rules as needed.

            return true; // Password is valid.
        }

        protected void ddlOrganization_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddlOrganization.SelectedValue != null && ddlOrganization.SelectedValue.Equals(txtOtherOrganisation.Text, StringComparison.OrdinalIgnoreCase) && !string.IsNullOrEmpty(txtOtherOrganisation.Text))
            if (ddlOrganization.SelectedValue == ConstString.OthersOrganisation)
            {
                txtOtherOrganisation.Visible = true;
            }
            else
            {
                txtOtherOrganisation.Visible = false;
            }
        }

        protected void ddlDesignation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDesignation.SelectedValue == ConstString.OthersDesignation)
            {
                txtOtherDesignation.Visible = true;
            }
            else
            {
                txtOtherDesignation.Visible = false;
            }
        }
    }
}