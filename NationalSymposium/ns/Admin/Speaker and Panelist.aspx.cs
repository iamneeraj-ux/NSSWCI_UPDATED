using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Configuration;

namespace NationalSymposium.ns.Admin
{
    public partial class Speaker_and_Panelist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                
            }
        }

        protected void BindGridView()
        {
            DataTable dataTable = GetDataTableFromDataSource();

            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }
        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewFile")
            {
                string filePath = e.CommandArgument.ToString();
                // Implement the logic to open/view the file based on the filePath
                // This could involve redirecting to a new page, streaming the file, etc.
                // For simplicity, let's assume redirecting to another page for file viewing.

                Response.Redirect($"ViewFile.aspx?filePath={Server.UrlEncode(filePath)}");
            }
        }

       

        protected DataTable GetDataTableFromDataSource()
        {
            DataTable dataTable = new DataTable();

            // Define the columns in the DataTable based on your FileDetails class
            dataTable.Columns.Add("EmailAddress", typeof(string));
            dataTable.Columns.Add("Name", typeof(string));
            dataTable.Columns.Add("MobileNo", typeof(string));
            dataTable.Columns.Add("Designation", typeof(string));
            dataTable.Columns.Add("State", typeof(string));
            dataTable.Columns.Add("Organization", typeof(string));
            dataTable.Columns.Add("FileName", typeof(string));
            dataTable.Columns.Add("FilePath", typeof(string));
            string connectionString = ConfigurationManager.ConnectionStrings["NSSWCIConnectionString"].ConnectionString;
            // using (SqlConnection connection = new SqlConnection("NSSWCIConnectionString"))
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Sp_AllSpeakerForDashborad", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Create a new row for each record in the DataTable
                            DataRow row = dataTable.NewRow();
                            // Populate the DataRow with values from the SqlDataReader
                            row["EmailAddress"] = reader["EmailId"].ToString();
                            row["Name"] = reader["Name"].ToString();
                            row["MobileNo"] = reader["MobileNo"].ToString();
                            row["Designation"] = reader["Designation"].ToString();
                            row["Organization"] = reader["OrganizationName"].ToString(); 
                            row["State"] = reader["StateName"].ToString();
                            row["Organization"] = reader["OrganizationName"].ToString();
                            row["FileName"] = reader["FileName"].ToString();
                            row["FilePath"] = reader["FilePath"].ToString();

                            // Add the DataRow to the DataTable
                            dataTable.Rows.Add(row);
                        }
                    }
                }
            }

            return dataTable;
        }


    }
}