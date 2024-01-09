using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModelNationalSymposium;
using System.Xml.Linq;

namespace DalNationalSymposium
{
    public class DalNS
    {
        public static readonly string NSConnectionString = ConfigurationManager.ConnectionStrings["NSSWCIConnectionString"].ConnectionString;
        #region Roles
        public static DataTable GetRoles()
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "GetRoles";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }

        public static DataTable GetRolesById(int id)
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "GetRolesById";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
        #endregion

        #region State
        public static DataTable GetState()
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "Sp_States";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }

        #endregion

        #region Designation
        public static DataTable GetDesignations()
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "Sp_Designations";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }

        #endregion

        #region Organization
        public static DataTable GetOrganizations()
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "Sp_Organizations";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }

        #endregion

        #region Registrations
        public static int SetUserRegistrations(Registrations r)
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "SP_Registration";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            con.Open();
            cmd.Parameters.AddWithValue("@pName", r.Name);
            cmd.Parameters.AddWithValue("@pEmailId", r.EmailId);
            cmd.Parameters.AddWithValue("@pState", r.State);
            cmd.Parameters.AddWithValue("@pDesignation", r.Designation);
            cmd.Parameters.AddWithValue("@pOrganization", r.Organization);
            cmd.Parameters.AddWithValue("@pHashPassword", r.HashPassword);
            cmd.Parameters.AddWithValue("@pMobileNo", r.MobileNo);
            cmd.Parameters.AddWithValue("@pParticipants", r.Participants);
            cmd.Parameters.AddWithValue("@pCreatedBy", r.CreatedBy);
            int i = cmd.ExecuteNonQuery();
            return 1;
        }

        public static void SetInsertOrganization(string organisation,string email)
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "Sp_InsertOrganization";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            con.Open();
            cmd.Parameters.AddWithValue("@pText", organisation);
            cmd.Parameters.AddWithValue("@pEmailId", email);
             cmd.ExecuteNonQuery();
        }
        public static void SetInsertDesignation(string designation, string email)
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "Sp_InsertDesignation";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            con.Open();
            cmd.Parameters.AddWithValue("@pText", designation);
            cmd.Parameters.AddWithValue("@pEmailId", email);
            cmd.ExecuteNonQuery();
        }
        #endregion

        #region UserLogin

        public static DataTable GetUserDetails(string userName, string password)
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "SP_UserLogin";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("@pEmailId", userName);
            cmd.Parameters.AddWithValue("@pHashPassword", password);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
        public static DataTable GetUserLogin()
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "GetUserLogin";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }

        public static DataTable GetUserLoginByEmailId(string email)
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "GetUserLoginByEmailId";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("@email", email);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }

        public static string Sp_CheckUser(string email)
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "Sp_CheckUser";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("@pEmailId", email);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return Convert.ToString(dt.Rows[0][0]);
        }

        public static string Sp_ForgotPassword(string email, string password)
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "Sp_ForgotPassword";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("@pEmailId", email);
            cmd.Parameters.AddWithValue("@pHashPassword", password);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return Convert.ToString(dt.Rows[0][0]);
        }
        #endregion

        public static void SetContactInfo(Contact c)
        {
            SqlConnection con = new SqlConnection(NSConnectionString);
            const string sqlCmd = "Sp_ContactUs";
            SqlCommand cmd = new SqlCommand(sqlCmd, con) { CommandType = CommandType.StoredProcedure };
            con.Open();
            cmd.Parameters.AddWithValue("@pName", c.Name);
            cmd.Parameters.AddWithValue("@pEmailId", c.EmailId);
            cmd.Parameters.AddWithValue("@pSubject", c.Subject);
            cmd.Parameters.AddWithValue("@pMessage", c.Message);
            cmd.Parameters.AddWithValue("@pMobileNo", c.MobileNo);
            cmd.Parameters.AddWithValue("@pCreatedBy", c.CreatedBy);
            cmd.ExecuteNonQuery();
        }
    }
}
