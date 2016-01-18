using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLWebServicesC
{
    public partial class TutorialSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
            Page.LoadComplete += new EventHandler(Page_LoadComplete);
        }

        void Page_LoadComplete(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["TutorialID"].DefaultValue = Convert.ToString(Session["TutorialID"]);   // this.Master.TutorialID;
        }
    }
}