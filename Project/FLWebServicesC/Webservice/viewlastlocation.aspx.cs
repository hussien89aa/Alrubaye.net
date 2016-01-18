using FLWebServicesC.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLWebServicesC.Webservice
{
    public partial class viewlastlocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ContactResult cr = new ContactResult();
            GlobalVar var = new GlobalVar();

            try
            {
                SqlDataAdapter da = new SqlDataAdapter();
                using (SqlConnection openCon = new SqlConnection(var.connectionString))
                {
                    string saveStaff = "SELECT  [AndroidLog],[AndroidLat] FROM  [AndroidTrack] where [DateRegister]= (select max([DateRegister]) from AndroidTrack)";

                    using (SqlCommand querySaveStaff = new SqlCommand(saveStaff))
                    {
                        querySaveStaff.Connection = openCon;
                        DataSet ds = new DataSet();
                        openCon.Open();
                        DataTable table = new DataTable();
                        table.Load(querySaveStaff.ExecuteReader());
                        ds.Tables.Add(table);
                        Response.Redirect("http://www.google.com/maps/place/" + Convert.ToString(table.Rows[0]["AndroidLat"]) + "," + Convert.ToString(table.Rows[0]["AndroidLog"])  );
                        openCon.Close();
                    }
                }

            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }
    }
}