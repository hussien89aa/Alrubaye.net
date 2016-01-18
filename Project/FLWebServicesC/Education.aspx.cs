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
    public partial class Education : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!(Request.QueryString["S"] == null))
                {
                    LiMessage.Text = "<strong>" + Resources.Resource1.Success+"</strong> people is added successfully.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalSucces();", true);
                }
            }
        
        }
 
        protected void BuAddData_Click(object sender, EventArgs e)
        {
            // check if the email is active;
             DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("MyStudents", "StudentEmail", "StudentEmail like '" + txtEmail.Text  + "'").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                LiMessage.Text = "<strong>" + Resources.Resource1.Warning +"</strong> " +Resources.Resource1.emailalreadyregistered;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalError();", true);
                return;
            }
             ColoumnParam[] Coloumns = new ColoumnParam[7];
            Coloumns[0] = new ColoumnParam("StudentFirstName", ColoumnType.NVarChar,txtFirstName.Text);
            Coloumns[1] = new ColoumnParam("StudentLastName", ColoumnType.NVarChar, txtMiddleName.Text);
            Coloumns[2] = new ColoumnParam("StudentEmail", ColoumnType.NVarChar, txtEmail.Text);
            Coloumns[3] = new ColoumnParam("TutorialID", ColoumnType.Int, DDLAccounts.SelectedValue);
            Coloumns[4] = new ColoumnParam("DataRegister", ColoumnType.DateTime, DateTime.Now);
            Coloumns[5] = new ColoumnParam("StudentComment", ColoumnType.NVarChar, txtState.Text);
            Coloumns[6] = new ColoumnParam("SkypeID", ColoumnType.NVarChar, txtSkypeID.Text);
            if (DBop.NewConectionDLL.InsertRow("MyStudents", Coloumns)){
                // add tutorila to my list
            //password = Myenc.GetMD5Data(Encoding.Default.GetBytes(password));
                dataTable = DBop.cobject.SelectDataSet("MyStudents", "StudentID", "StudentEmail like '" + txtEmail.Text + "'").Tables[0];
                ColoumnParam[] Coloumns2 = new ColoumnParam[2];
                Coloumns2[0] = new ColoumnParam("TutorialID", ColoumnType.Int, DDLAccounts.SelectedValue);
                Coloumns2[1] = new ColoumnParam("StudentID", ColoumnType.Int, dataTable.Rows[0]["StudentID"]);
                if (DBop.NewConectionDLL.InsertRow("StudentTutorial", Coloumns2))
                {
                    Contacting sendwelcome = new Contacting();
                    string message = "عزيزي " + txtFirstName.Text + "\n   نحن نقدر جدا انظمامك للدورات وسوف نحاول قصارى جهدنا ان نوصل لك ماتسعى لتعلمه. لذالك سوف نرسل لك بريد يحتوي على معلومات الدخول الى الدورات قريبا لذالك قم بفحص صندوق الوراد والرسائل سبام بشكل دائم  ";
                    sendwelcome.SendWelcome(txtEmail.Text, "شكرا لتسجيلك في نظام الدورات", message);
                    Response.Redirect("Education.aspx?S=T");
                }
                else
                {
                    LiMessage.Text = "<strong>" + DBop.NewConectionDLL.ErrorMessage + "</strong>  .";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalError();", true);
                }
            }
            
            else
            {
                LiMessage.Text = "<strong>" + DBop.NewConectionDLL.ErrorMessage + "</strong>  ";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalError();", true);
            }

        }

        protected void DDLAccounts_SelectedIndexChanged(object sender, EventArgs e)
        {
            // check if the email is active;
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("Tutorials", "TutorialLink", "TutorialID=" + DDLAccounts.SelectedValue ).Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                string Link= Convert.ToString(dataTable.Rows[0]["TutorialLink"]);
                if (Link.Length>5)
                Response.Redirect(Link);
                return;
            }

           
        }

        protected void DDLAccounts_DataBound(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("StudentTutorial", "count(*) as number", "TutorialID=" + DDLAccounts.SelectedValue).Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {  //display number student
                LiMassage.Text = "<div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                LiMassage.Text = LiMassage.Text + "<strong>" + Resources.Resource1.NumberStudents + "</strong>  <span class='badge'>" + Convert.ToString(dataTable.Rows[0]["number"]) + "</span>";
                LiMassage.Text = LiMassage.Text + ".</div>";
            }
            // dispaly dtutoril info
            dataTable = DBop.NewConectionDLL.SelectDataSet("Tutorials", "*", "TutorialID=" + DDLAccounts.SelectedValue).Tables[0];
            { 
            string date = String.Format("{0:yyyy--MM-dd}", Convert.ToDateTime(Convert.ToString(dataTable.Rows[0]["DateStart"])));
            string numberhours =Convert.ToString(dataTable.Rows[0]["Time"]);
            LiMassage.Text =LiMassage.Text+ "<div class='alert alert-success fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
            DateTime tutroirladate = Convert.ToDateTime(Convert.ToString(dataTable.Rows[0]["DateStart"]));
            //if (tutroirladate >= DateTime.Now)
            //{
            //    //BuAddData.Enabled = false;
            //    LiMassage.Text = LiMassage.Text + "<strong>" + Resources.Resource1.tutoirlaisstarted + "</strong>  <span class='badge'>" + date + "</span>";
            //    LiMassage.Text = LiMassage.Text + "<strong>" + Resources.Resource1.joinnumow ;
              
            //}
            //else
            //{
                LiMassage.Text = LiMassage.Text + "<strong>" + Resources.Resource1.DateTutorialStart + "</strong>  <span class='badge'>" + date + "</span>";
                LiMassage.Text = LiMassage.Text + "       <strong>" + Resources.Resource1.numberhurs + "</strong>  <span class='badge'>" + numberhours + "</span>";
         
            LiMassage.Text = LiMassage.Text + ".</div>";
            Latutroalinfo.Text = Convert.ToString(dataTable.Rows[0]["TutorialDeatils"]);
             }
        
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}