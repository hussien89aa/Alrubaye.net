using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLWebServicesC
{
    public partial class Enrollnto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                // Retrieve the row index stored in the 
                // CommandArgument property.
                int index = Convert.ToInt32(e.CommandArgument);

                // Retrieve the row that contains the button 
                // from the Rows collection.
               // GridViewRow row = GridView1.Rows[index];
                SqlDataSource1.InsertParameters["TutorialID"].DefaultValue = GridView1.DataKeys[index].Value.ToString();
                SqlDataSource1.Insert();
                // Add code here to add the item to the shopping cart.
            }
        }
    }
}