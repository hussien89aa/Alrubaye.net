using DBManager;
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
    public partial class AdminLogin : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["adminID"] = null; // inail session with null 
            //  if(( !Page.IsPostBack)&&(Request.QueryString["Error"]!=null))
            // Label1info.Text = Request.QueryString["Error"];
            if (!Page.IsPostBack)
            {
                theDiv.Visible = false;
                //txtUserName.Attributes.Add("onfocus", "clearText(this,'Enter your email')");
            }
        }
        private bool IsAdminExists(string userName, string password)
        {
           // Encryptions Myenc = new Encryptions();  // encript password
            DataTable dataTable = new DataTable();
            //password = Myenc.GetMD5Data(Encoding.Default.GetBytes(password));
            dataTable = DBop.cobject.SelectDataSet("MyStudents", "StudentID", "StudentEmail like '" + userName + "' AND Password like '" + password + "' and IsActive=1").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                Session["adminID"] = dataTable.Rows[0]["StudentID"];
                //  Session.Timeout = 10;  // set session time out
                /// save login information
                /// save access denial for this person
                ColoumnParam[] Coloumns = new ColoumnParam[7];
                Coloumns[0] = new ColoumnParam("TableID", ColoumnType.Int, 5);  // 1 is code for userlogin
                Coloumns[1] = new ColoumnParam("RecordID", ColoumnType.Int, dataTable.Rows[0]["StudentID"]);
                Coloumns[2] = new ColoumnParam("DateModify", ColoumnType.DateTime, DateTime.Now);
                Coloumns[3] = new ColoumnParam("PersonID", ColoumnType.Int, dataTable.Rows[0]["StudentID"]);
                Coloumns[4] = new ColoumnParam("AdminsOperationTypeID", ColoumnType.Int, 7);  // 6 is for login
                Coloumns[5] = new ColoumnParam("OldValue", ColoumnType.NVarChar, HFMAC.Value);
                Coloumns[6] = new ColoumnParam("NewValue", ColoumnType.NVarChar, Session.SessionID.ToString());
                DBop.cobject.InsertRow("AdminsTracking", Coloumns);



                return true;
            }
 

            return false;
        }
      

        protected void BuAddData_Click1(object sender, EventArgs e)
        {
            if (IsAdminExists(txtUserName.Text, txtPassword.Text))
            {


                Response.Redirect("MyDashoard.aspx");
            }
            else
            {
                theDiv.Visible = true;

                LiMessage.Text = "<strong>Warning!</strong> User name or password is not correct";
            }
        }
    }
}