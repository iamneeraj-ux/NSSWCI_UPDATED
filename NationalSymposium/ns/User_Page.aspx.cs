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
                    if (reader.Read())
                    {
                        // Populate TextBox
                        txtName.Text = reader["Name"].ToString();

                        //Check if the columns exist in the result set
                        bool hasMobileNo = reader.GetOrdinal("MobileNo") != -1;
                        bool hasOrganization = reader.GetOrdinal("Organization") != -1;
                        bool hasDesignation = reader.GetOrdinal("Designation") != -1;
                        bool hasState = reader.GetOrdinal("State") != -1;

                        // Check if file-related columns exist
                        bool hasFileName = reader.GetOrdinal("FileName") != -1;
                        bool hasFilePath = reader.GetOrdinal("FilePath") != -1;

                        // Check if there are file details based on the count condition
                        if (hasFileName && hasFilePath)
                        {
                            string FileName = reader["FileName"].ToString();
                            string FilePath = reader["FilePath"].ToString();
                            dViewFile.InnerHtml = $"<a href=\"{FilePath}\">{FileName}</a>";
                        }
                        else
                        {
                            // File-related columns do not exist or are null
                            dViewFile.InnerHtml = "File not available. <a href='#'>Upload File</a>";
                        }

                        // Populate DropDownList
                        if (hasDesignation) ddlDesignation.SelectedValue = reader["Designation"].ToString();
                        if (hasState) ddlStates.SelectedValue = reader["State"].ToString();
                        if (hasOrganization) ddlOrganization.SelectedValue = reader["Organization"].ToString();
                        if (hasMobileNo) txtMobile.Text = reader["MobileNo"].ToString();
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
            
            string connectionString = ConfigurationManager.ConnectionStrings["NSSWCIConnectionString"].ConnectionString;

            try
            {
                if (fuUpload.HasFile)
                {
                    int maxFileSize = 5 * 1024 * 1024; // 5MB in bytes
                    string fileExtension = Path.GetExtension(fuUpload.FileName).ToLower();
                    string[] allowedMimeTypes = { ".pptx", ".pptm", ".ppt" };

                    HttpPostedFile uploadedFile = fuUpload.PostedFile;

                    if (Array.IndexOf(allowedMimeTypes, fileExtension) != -1 && uploadedFile.ContentLength <= maxFileSize)
                    {
                        // Generate a unique file name
                        string uniqueFileName = $"{Guid.NewGuid().ToString()}_{fuUpload.FileName}";

                        // Set the upload folder path
                        string uploadFolder = Server.MapPath("~/Upload");
                        string filePath = Path.Combine(uploadFolder, uniqueFileName);

                        // Save the file to the server
                        fuUpload.SaveAs(filePath);

                        // Perform database operations in a transaction
                        using (SqlConnection conn = new SqlConnection(connectionString))
                        {
                            conn.Open();
                            SqlTransaction transaction = conn.BeginTransaction();

                            try
                            {
                                // Insert or update database based on file existence
                                UpdateDatabase(ul.EmailId, fuUpload.FileName, filePath, txtName.Text, ddlStates.SelectedValue,
                                    ddlDesignation.SelectedValue, ddlOrganization.SelectedValue, txtMobile.Text,
                                    Utility.GetIpAddress(), transaction);

                                // Commit the transaction if everything is successful
                                transaction.Commit();

                                // Display a success message
                                Utility.ShowToastrSuccess(this, "File uploaded successfully!", "Success");
                            }
                            catch (Exception ex)
                            {
                                // Rollback the transaction in case of an exception
                                transaction.Rollback();

                                // Display an error message
                                Utility.ShowToastrError(this, "An error occurred while processing the file.", "Error");
                            }
                        }
                    }
                    else
                    {
                        // Display an error message for unsupported MIME type or file size
                        Utility.ShowToastrError(this, "Unsupported file format or file size. Please upload a file with ppt format and within 5MB.", "Error");
                    }
                }
                else
                {
                    // Display a message if no file is selected
                    Utility.ShowToastrWarning(this, "Please select a file to upload.", "Warning");
                }
            }
            catch (Exception ex)
            {
                // Handle other exceptions if needed
                Utility.ShowToastrError(this, "An unexpected error occurred.", "Error");
            }

            // Separate method to handle database operations
          



        }


        private void UpdateDatabase(string emailId, string fileName, string filePath, string name, string state, string designation,
        string organization, string mobileNo, string createdBy, SqlTransaction transaction)
        {
            using (SqlCommand command = new SqlCommand("Sp_FileDetails", transaction.Connection, transaction))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@pEmailId", emailId);
                command.Parameters.AddWithValue("@pFileName", fileName);
                command.Parameters.AddWithValue("@pFilePath", filePath);
                command.Parameters.AddWithValue("@pName", name);
                command.Parameters.AddWithValue("@pState", state);
                command.Parameters.AddWithValue("@pDesignation", designation);
                command.Parameters.AddWithValue("@pOrganization", organization);
                command.Parameters.AddWithValue("@pMobileNo", mobileNo);
                command.Parameters.AddWithValue("@pCreatedBy", createdBy);

                command.ExecuteNonQuery();
            }
        }




    }
}