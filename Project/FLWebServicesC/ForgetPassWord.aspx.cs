using DBManager;
using FLWebServicesC.Classes;
using Resources;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLWebServicesC
{
    public partial class ForgetPassWord : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] == null)
                Response.Redirect("AdminLogin.aspx");
            DataTable dataTable = new DataTable();
            dataTable = DBop.cobject.SelectDataSet("PeoplePassCode", "PersonID,DateIn", "PassCode like '" + Request.QueryString["id"] + "'  and DateIn =(SELECT max(DateIn) FROM [PeoplePassCode] where  PassCode like '" + Request.QueryString["id"] + "')").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                DateTime UpdatePassword = Convert.ToDateTime(dataTable.Rows[0]["DateIn"]);
                if ((DateTime.Now - UpdatePassword).TotalHours > 24)   // password is expire
                {
                    theDiv.Visible = true;
                    LiMessage.Text = "<strong>Warning!</strong> The password is expired  please request new password again.";
                    BuAddData.Enabled = false;
                }
                else

                    Session["adminID"] = dataTable.Rows[0]["PersonID"];



            }
            else
            {
                Response.Redirect("login");
            }

        }

        protected void BuAddData_Click(object sender, EventArgs e)
        {



           // Encryptions Myenc = new Encryptions();  // encript password
            string password =  txtPassword.Text ;
            ColoumnParam[] Coloumns = new ColoumnParam[1];
            Coloumns[0] = new ColoumnParam("Password", ColoumnType.Char1, password);
            if (DBop.cobject.UpdateRow("MyStudents", Coloumns, ("StudentID=" + Session["adminID"])))
            {
                // LiMessage.Text = "<strong>Success!</strong> Password is changed successfully.";
                // ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalSucces();", true);
                Response.Redirect("MyDashoard.aspx");
            }
            else
            {
                //  MsgBox(DBop.cobject.ErrorMessage)
                // statusLabel.Text = Resource1.AddNotComplte;
                LiMessage.Text = "<strong>Success!</strong>" + Resource1.AddNotComplte;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalSucces();", true);
            }
        }
            
           
       
    }
}