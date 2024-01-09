using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace NationalSymposium.ns.Admin
{
    public partial class Participants : System.Web.UI.Page
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
            
            string connectionString = ConfigurationManager.ConnectionStrings["NSSWCIConnectionString"].ConnectionString;
            // using (SqlConnection connection = new SqlConnection("NSSWCIConnectionString"))
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Sp_AllParticipantsForDashborad", connection))
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
                            

                            // Add the DataRow to the DataTable
                            dataTable.Rows.Add(row);
                        }
                    }
                }
            }

            return dataTable;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }

        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "ParticipantDetails" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."
        }

    }
}