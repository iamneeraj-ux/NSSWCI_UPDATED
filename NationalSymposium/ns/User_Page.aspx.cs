using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Reflection;
using ModelNationalSymposium;
using NationalSymposium;

namespace NSSWC
{   
    public partial class User_Page : System.Web.UI.Page
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
            Utility.BindStates(ddlStates);
            Utility.BindDesignation(ddlDesignation);
            Utility.BindOrganisation(ddlOrganization);
            FetchDataFromDatabase();
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

        private void FetchDataFromDatabase()
        {
            // Connection string
            string connectionString = ConfigurationManager.ConnectionStrings["NSSWCIConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Sp_ViewUserDetails", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Open the connection
                    connection.Open();
                    command.Parameters.AddWithValue("@pEmailId", ul.EmailId);

                    // Execute the command and read data
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        // Populate TextBox
                        txtName.Text = reader["Name"].ToString();
                        //string filepath = reader["FilePath"].ToString();


                        // Populate DropDownList
                        ddlDesignation.SelectedValue = reader["Designation"].ToString();
                        ddlStates.SelectedValue = reader["State"].ToString();
                        ddlOrganization.SelectedValue = reader["Organization"].ToString();
                        txtMobile.Text = reader["MobileNo"].ToString();
                        //dViewFile.InnerHtml = $"<a href=\"../Upload/{FileUpload1.FileName}\">View File</a>";
                    }
                    txtemail.Text = ul.EmailId;
                    // Close the reader and connection
                    reader.Close();
                    connection.Close();
                }
            }

            // Freeze DropDownList values
            ddlOrganization.Enabled = false;
            ddlStates.Enabled = false;
            txtemail.Enabled = false;
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("Login.aspx");

        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            //File to be downloaded.
            string fileName = "JJM_Template.pptx";

            //Path of the File to be downloaded.
            string filePath = Server.MapPath(string.Format("~/Download/JJM_Template.pptx", fileName));

            //Content Type and Header.
            Response.ContentType = "application/pptx";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));

            //Writing the File to Response Stream.
            Response.WriteFile(filePath);

            //Flushing the Response.
            Response.Flush();
            Response.End();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //SqlConnection conn = new SqlConnection("Data Source=10.22.3.161;User Id=adg;Password=adg;Initial Catalog=NSSWCI;Integrated Security=false;");
            string connectionString = ConfigurationManager.ConnectionStrings["NSSWCIConnectionString"].ConnectionString;

            
                if (fuUpload.HasFile)
                {
                int maxFileSize = 5 * 1024 * 1024; // 5MB in bytes
                // Get the file extension
                string fileExtension = Path.GetExtension(fuUpload.FileName).ToLower();

                // Get the MIME type based on the file extension
                //string mimeType = MimeMapping.GetMimeMapping(FileUpload1.FileName);

                // Specify allowed MIME types (e.g., "image/jpeg", "image/png", "application/pdf")
                string[] allowedMimeTypes = { ".pptx", ".pptm", ".ppt" };

                HttpPostedFile uploadedFile = fuUpload.PostedFile;

                // Check if the MIME type is allowed
                if (Array.IndexOf(allowedMimeTypes, fileExtension) != -1 && uploadedFile.ContentLength <= maxFileSize)
                {
                    // Process the file (e.g., save it to the server)
                    string filePath = Server.MapPath("~/Upload") + "/" + fuUpload.FileName;
                    fuUpload.SaveAs(filePath);
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    { 
                        conn.Open();
                    SqlCommand command = new SqlCommand("Sp_FileDetails", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@pEmailId", ul.EmailId);
                    command.Parameters.AddWithValue("@pFileName", fuUpload.FileName);
                    command.Parameters.AddWithValue("@pFilePath", filePath);
                    command.Parameters.AddWithValue("@pName", txtName.Text);
                    command.Parameters.AddWithValue("@pState", ddlStates.SelectedValue);
                    command.Parameters.AddWithValue("@pDesignation", ddlDesignation.SelectedValue);
                    command.Parameters.AddWithValue("@pOrganization", ddlOrganization.SelectedValue);
                    command.Parameters.AddWithValue("@pMobileNo", txtMobile.Text);
                    command.Parameters.AddWithValue("@pCreatedBy", Utility.GetIpAddress());
                    command.ExecuteNonQuery();
                        dViewFile.InnerHtml = $"<a href=\"../Upload/{fuUpload.FileName}\">View File</a>";
                        //hypDownload.NavigateUrl = "" + FileUpload1.FileName;
                        //hypDownload.Visible = true;

                        // Show file in iframe
                        //I1.Attributes["src"] = ResolveUrl("~/Upload/") + FileUpload1.FileName;

                    }

                    // Display a success message
                    // lblmessage.Text = "File uploaded successfully!";
                    Utility.ShowToastrSuccess(this, "File uploaded successfully!", "Success");
                }
                else
                {
                    // Display an error message for unsupported MIME type
                    // lblmessage.Text = "Unsupported file format. Please upload a file with ppt format";
                    Utility.ShowToastrError(this, "Unsupported file format. Please upload a file with ppt format", "Error");
                }
            }
            else
            {
                // Display an error message if no file is selected
                //lblmessage.Text = "Please select a file to upload.";
                Utility.ShowToastrWarning(this, "Please select a file to upload.", "Warning");
            }
        }
    }
    
}