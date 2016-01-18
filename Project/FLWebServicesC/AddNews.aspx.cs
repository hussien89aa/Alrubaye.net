using DBManager;
using FLWebServicesC.Classes;
using Resources;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLWebServicesC
{
    public partial class AddNews : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminID"] == null)
                Response.Redirect("AdminLogin.aspx");

            if (!Page.IsPostBack)
            {// generate code for add attachment files
                string TempasaveCode = StringGeneration.getString(30) + Convert.ToString(Session["adminID"]);
                HiddenField1.Value = TempasaveCode.Substring(Convert.ToInt32(TempasaveCode.Length / 2), Convert.ToInt32(TempasaveCode.Length / 2));
                if (!(Request.QueryString["S"] == null))
                {
                    Label1info.Text = Resource1.ADDSuceess;
                }
            }

        }

        protected void BuAddData_Click(object sender, EventArgs e)
        {
            SendMessage("4");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        // save data
        void SendMessage(string reciveID)
        {
            ColoumnParam[] Coloumns = new ColoumnParam[5];
            Coloumns[0] = new ColoumnParam("NewsTitle", ColoumnType.NVarChar, txtMessageTitle.Text);
            Coloumns[1] = new ColoumnParam("NewsDetails", ColoumnType.NVarChar, txtMessageDetails.Text);
            Coloumns[2] = new ColoumnParam("NewsDate", ColoumnType.DateTime, DateTime.Now);
            Coloumns[3] = new ColoumnParam("SendAccountID", ColoumnType.Int, Convert.ToInt32(Session["adminID"]));
            Coloumns[4] = new ColoumnParam("AccountID", ColoumnType.Int, reciveID);
            if (DBop.cobject.InsertRow("News", Coloumns))
            {
                // get id othe the message to update the messages in atachments
                DataTable dataTable = new DataTable();
                dataTable = DBop.cobject.SelectDataSet("News", "NewsID", " (SendAccountID =" + Convert.ToString(Session["adminID"]) + " ) and NewsDate=(select max(NewsDate) from News where SendAccountID =" + Convert.ToString(Session["adminID"]) + ")").Tables[0];
                // we update all temp attach id
                ColoumnParam[] Coloumns1 = new ColoumnParam[1];
                Coloumns1[0] = new ColoumnParam("AttachID", ColoumnType.varchar50, dataTable.Rows[0]["NewsID"]);
                DBop.cobject.UpdateRow("Attachments", Coloumns1, "AttachmentID=" + HiddenField1.Value + "");
                Response.Redirect("AddNews.aspx?S=T");
            }
            else
                Label1info.Text = DBop.cobject.ErrorMessage;

        }

        protected void BuSearch_Click(object sender, EventArgs e)
        {
            //SDSSDegress2013.SelectParameters["FullName"].DefaultValue = "%" + txtStudentName.Text + "%";
            SDSSDegress2013.DataBind();
            GridView1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue.Equals("0")) // if he select all student
            {
                GridView1.Visible = false;
                BuSearch.Visible = false;
                BuAddData.Visible = true;
                txtStudentName.Visible = false;
                LaStudentName6.Visible = false;
            }
            else
            {
                GridView1.Visible = true;
                BuSearch.Visible = true;
                BuAddData.Visible = false;
                txtStudentName.Visible = true;
                LaStudentName6.Visible = true;
            }
        }

        protected void txtStudentName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BuSearche_Click(object sender, EventArgs e)
        {

            String password = "DF34345";
            string imgPath;
            try
            {
                password = Convert.ToString(Session["adminID"]) + StringGeneration.getString(30);
                imgPath = ("/attachments/"
                            + (password + Path.GetExtension(FileUpload1.PostedFile.FileName)));
                //  selct path before post back check nesa becose name file will dispose after poastback
                //   MsgBox(Server.MapPath(imgPath))
                FileUpload1.SaveAs(Server.MapPath(imgPath));
                ColoumnParam[] Coloumns1 = new ColoumnParam[5];
                Coloumns1[0] = new ColoumnParam("AttachmentTypeID", ColoumnType.Int, 2); // 1 for admin add news
                Coloumns1[1] = new ColoumnParam("AttachmentPath", ColoumnType.NVarChar, imgPath);
                Coloumns1[2] = new ColoumnParam("AttachmentDateIN", ColoumnType.DateTime, DateTime.Now.ToString());
                Coloumns1[3] = new ColoumnParam("AttachmentID", ColoumnType.Int, HiddenField1.Value);
                Coloumns1[4] = new ColoumnParam("AddedBy", ColoumnType.Int, Convert.ToString(Session["adminID"]));

                DBop.cobject.InsertRow("Attachments", Coloumns1);

                SqlDataSource1.DataBind();
                GridView2.DataBind();
            }
            catch (Exception ex)
            {

             
            }

 

            
        }

        protected void SDSSDegress2013_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if ((e.CommandName == "Save") && (txtMessageTitle.Text.Length > 0))
            {
                int index = Convert.ToInt32(e.CommandArgument);
                SendMessage(GridView1.DataKeys[index].Value.ToString());


            }
            else
            {
                Label1info.Text = Resource1.CompleteInfo;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get the button that raised the event inside your Gridview
            Button btn = (Button)sender;

            // Get the row that contains this button
            GridViewRow gridviewRow = (GridViewRow)btn.NamingContainer;

            // Get the rowindex
            int rowindex = gridviewRow.RowIndex;
            //  dim  varName1 As string =   ((HyperLink)gridviewRow.FindControl("HyperLink1")).Text.ToString() ; //this store the  value in varName1
            SendMessage(GridView1.DataKeys[rowindex].Value.ToString());
        }


    }
}