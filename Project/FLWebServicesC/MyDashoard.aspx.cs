using FLWebServicesC.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLWebServicesC
{
    public partial class MyDashoard : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                DataTable dataTable = new DataTable();
                dataTable = DBop.cobject.SelectDataSet("News", "count(*) as countitem") .Tables[0];
                HFMax.Value =Convert.ToString( dataTable.Rows[0]["countitem"]);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        { int index=Convert.ToInt32(HFIndex.Value);
            int total=Convert.ToInt32(HFMax.Value);
            if (index < total)
            {
                SqlDataSource3.SelectParameters["start"].DefaultValue = Convert.ToString(index+1);
                SqlDataSource3.SelectParameters["end"].DefaultValue = Convert.ToString(index + 11);
                Button2.Visible = true;
            }
                
                if ((index+11) >= total)
            {
                HFIndex.Value = HFMax.Value; // set to last and disbale next
                Button1.Visible = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(HFIndex.Value);
            int total = Convert.ToInt32(HFMax.Value);
            if (index > 0)
            {
                SqlDataSource3.SelectParameters["start"].DefaultValue = Convert.ToString(index - 11);
                SqlDataSource3.SelectParameters["end"].DefaultValue = Convert.ToString(index-1);
                Button1.Visible = true;
               
            }  
                if ((index-11) <=0)
            {
                HFIndex.Value = HFMax.Value; // set to last and disbale next
                Button2.Visible = false;
            }
        }
    }
}