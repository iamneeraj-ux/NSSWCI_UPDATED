using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Newtonsoft.Json;
using System.Web.DynamicData;
using ModelNationalSymposium;
using NationalSymposium;

namespace NSSWC
{
    public partial class Admin_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

            //if (CheckAuthentication())
            //{
            //    Response.Write("Welcome " + Session["username"]);
            //}
            if (!IsPostBack)
            {

                BindData();
                gvData.DataBind();
                var speakersData = GetSpeakerCount();
                var participantsData = GetParticipantCount();
                //string stateLabels = "[ 'Andaman & Nicobar Islands',  'Andhra Pradesh', 'Arunachal Pradesh', 'Assam',  'Bihar',  'Chandigarh',  'Dadra & Nagar Haveli',  'Daman & Diu',  'Delhi',  'Goa',  'Gujarat',  'Haryana',  'Himachal Pradesh'," +
                //  " 'Jammu & Kashmir',  'Karnataka',  'Kerala',  'Madhya Pradesh',  'Maharashtra',  'Lakshadweep', 'Manipur',  'Meghalaya',  'Mizoram',  'Nagaland',  'Odisha',  'Puducherry',  'Punjab',  'Rajasthan',  'Sikkim',  'Tamil Nadu',  'Tripura','Uttar Pradesh',  'West Bengal',  'Chhattisgarh','Jharkhand',  'Uttarakhand',  'Telangana',  'Ladakh' ]";
                //string stateLabels = "[" + string.Join(",", speakersData.Values.Select(key => $"'{key}'")) + "]";
                string stateLabels = "[" + string.Join(",", speakersData.Select(kv => $"'{kv.Key} - {kv.Value}'")) + "]";

                //string stateLabels = "[" + string.Join(",", speakersData.Values)+ "]";

                string speakerData = "[" + string.Join(",", speakersData.Values) + "]";
                string participantData = "[" + string.Join(",", participantsData.Values) + "]";
                string stateColors = "['#36A2EB', '#FFCE56', '#5cb85c', '#d9534f', '#f0ad4e', '#cc3333', '#cc5933', '#cc8033', '#cc8033','#cccc33'," +
                    "'#a6cc33', '#80cc33', '#59cc33', '#33cc33', '#33cc59', '#33cc80', '#33cca6', '#33cccc', '#33a6cc', '#3380cc', " +
                    "'#3359cc', '#3333cc', '#5933cc', '#8033cc', '#a633cc', '#cc33cc', '#cc33a6', '#cc3380', '#cc3359', '#cc3333' ]";
                string stateLabels1 = "[" + string.Join(",", participantsData.Select(kv => $"'{kv.Key} - {kv.Value}'")) + "]";
                // Initialize the speakers chart
                string speakersScript = $"<script type='text/javascript'>initializeSpeakersChart({stateLabels}, {speakerData}, {stateColors});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "initializeSpeakersChart", speakersScript);

                // Initialize the participants chart
                string participantsScript = $"<script type='text/javascript'>initializeParticipantsChart({stateLabels1}, {participantData}, {stateColors});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "initializeParticipantsChart", participantsScript);


                //gvData.DataBind();
                


            }


        }

        public bool CheckAuthentication()
        {
            if (Session["username"] != null)
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
        //protected void btnLogout_Click(object sender, EventArgs e)
        //{
        //    FormsAuthentication.SignOut();
        //    Response.Redirect("Login.aspx");
        //}

        public void BindData()
        {
            Utility.BindStates(ddlStates);
            
        }
        Dictionary<string, int> GetParticipantCount()
        {
            var participantData = new Dictionary<string, int>();

            // Connection string from your web.config or app.config file
            string connectionString = ConfigurationManager.ConnectionStrings["NSSWCIConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Sp_StateViseParticipantsCount", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    // Execute the stored procedure
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Retrieve state and speaker count from the result
                            string statename = reader["StateName"].ToString();
                            int participantCount = Convert.ToInt32(reader["ParticipantsCount"]);
                            participantData[statename] = participantCount;
                        }
                    }
                }
            }


            return participantData;
        }


        private Dictionary<string, int> GetSpeakerCount()
        {
            
            var speakersData = new Dictionary<string, int>();

            // Connection string from your web.config or app.config file
            string connectionString = ConfigurationManager.ConnectionStrings["NSSWCIConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("Sp_StateViseSpeakerCount", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    connection.Open();

                    // Execute the stored procedure
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Retrieve state and speaker count from the result
                            string statename = reader["StateName"].ToString();
                            int speakerCount = Convert.ToInt32(reader["SpeakerCount"]);
                            speakersData[statename] = speakerCount;
                        }
                    }
                }
            }

    
            return speakersData;
        }



       

        private DataTable GetDataFromDatabase(int option1, int option2)
        {
            // Implement logic to call stored procedure and fetch data from the database
            // Replace "YourConnectionString" and "YourStoredProcedure" with your actual values
            //string connectionString = "NSSWCIConnectionString";
        
            string connectionString = ConfigurationManager.ConnectionStrings["NSSWCIConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                
                connection.Open();
                SqlCommand cmd = new SqlCommand("Sp_ViewUploadedFile", connection);






                   cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pType", option1);
                    cmd.Parameters.AddWithValue("@pState", option2);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    return dt;

                
                
               
               

            }
           
        }

        protected void btnGetData_Click(object sender, EventArgs e)
        {
            int selectedOption = Convert.ToInt32(ddlOptions.SelectedValue);
            int selectedOptionstate = Convert.ToInt32(ddlStates.SelectedValue);
            // Call the method to fetch data from the database using a stored procedure
            DataTable dt = GetDataFromDatabase(selectedOption, selectedOptionstate);
           

            // Bind the data to the GridView
            gvData.DataSource = dt;
            gvData.DataBind();
        }

        
    }





}
    

