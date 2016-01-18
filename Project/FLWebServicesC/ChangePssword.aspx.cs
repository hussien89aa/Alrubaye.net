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
    public partial class ChangePssword : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();


        private bool IsAdminPasswordExists(string Password)
        {
             DataTable dataTable = new DataTable();
             dataTable = DBop.cobject.SelectDataSet("MyStudents", "StudentID", "Password like '" + Password + "' and StudentID=" + Session["adminID"]).Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {


                return true;
            }
            return false;
        }
        protected void Page_Load(object sender, EventArgs e)
        {


            if ((Request.QueryString["S"] == "T"))
            {
                LiMessage.Text = "<strong>Success!</strong> Password is changed successfully.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalSucces();", true);
            }
        }

        protected void BuAddData_Click(object sender, EventArgs e)
        {
            if (IsAdminPasswordExists(txtOldPassword.Text))
            {
                 string password =  txtAdminPassword.Text ;
                ColoumnParam[] Coloumns = new ColoumnParam[1];
                Coloumns[0] = new ColoumnParam("Password", ColoumnType.Char1, password);
                if (DBop.cobject.UpdateRow("MyStudents", Coloumns, ("StudentID=" + Session["adminID"])))
                {
                    Response.Redirect("ChangePssword.aspx?S=T");
                }
                else
                {
                    //  MsgBox(DBop.cobject.ErrorMessage)
                    // statusLabel.Text = Resource1.AddNotComplte;
                    LiMessage.Text = "<strong>Success!</strong>" + Resource1.AddNotComplte;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalSucces();", true);
                }
            }
            else
            {
                //statusLabel.Text = Resource1.OldPasswordUncorrect;
                LiMessage.Text = "<strong>Warning!</strong> " + Resource1.OldPasswordUncorrect;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalError();", true);
            }
        }
    }
}