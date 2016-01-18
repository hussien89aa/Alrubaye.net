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
    public partial class MyHomeWorksdetails : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();



        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (!Page.IsPostBack)
            {
                if (!(Request.QueryString["id"] == null))
                { string uid=Request.QueryString["id"];
                if (uid.Length > 42)  // it is hacker injection becuase there no uid more than this nnumber
                    Response.Redirect("AdminLogin.aspx");
                    HFid.Value = Request.QueryString["id"];
                }
                else
                {
                    Response.Redirect("AdminLogin.aspx");
                }
                  if (!(Request.QueryString["S"] == null)) // fie is uploaded
                {
                    LiMessage.Text = "<strong>" + Resources.Resource1.Success + "</strong> people is added successfully.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalSucces();", true);
                }

                  DataTable dataTable = new DataTable();
                  dataTable = DBop.cobject.SelectDataSet("HomeWorks", "HomeWorkID,HomeWorkDetails,DeadLineDate", "HomeWorkUID like '" + HFid.Value + "'").Tables[0];
                  if ((dataTable != null) && (dataTable.Rows.Count > 0))
                  {
                      SqlDataSource1.SelectParameters["HomeWorkI"].DefaultValue = Convert.ToString(dataTable.Rows[0]["HomeWorkID"]);
                      Latutroalinfo.Text = Convert.ToString(dataTable.Rows[0]["HomeWorkDetails"]);
                      // distbale uplaod file
                      DateTime Deadline = Convert.ToDateTime(dataTable.Rows[0]["DeadLineDate"]); ;
                      if ((DateTime.Now-Deadline ).TotalMinutes > 0)
                          BuAddData0.Enabled = false;

                      SqlDataSource67.SelectParameters["AttachID"].DefaultValue = Convert.ToString(dataTable.Rows[0]["HomeWorkID"]);
                      // check if he submit any comment //LiComment
                        dataTable = DBop.cobject.SelectDataSet("StudentHomeWorkSubmit", "AdminComment", "HomeWorkID=" +  Convert.ToString(dataTable.Rows[0]["HomeWorkID"]) + " and SubmitDatein=(select max(SubmitDatein) from  StudentHomeWorkSubmit where StudentID=" +  Convert.ToString(Session["adminID"] )+ " and  HomeWorkID=" +  Convert.ToString(dataTable.Rows[0]["HomeWorkID"]) + ")").Tables[0];
                        if ((dataTable != null) && (dataTable.Rows.Count > 0))
                            LiComment.Text = "<strong>تعليق المعلم</strong></br>" + Convert.ToString(dataTable.Rows[0]["AdminComment"]);
                        else
                            LiComment.Visible = false;
                  }
                  else
                      Response.Redirect("AdminLogin.aspx");

            }

        }

        protected void BuAddData_Click(object sender, EventArgs e)
        {
            // check the expire date
 
            DataTable dataTable = new DataTable();
            dataTable = DBop.cobject.SelectDataSet("HomeWorks", "HomeWorkID,DeadLineDate", "HomeWorkUID like '" + HFid.Value + "'").Tables[0];
            DateTime Deadline = Convert.ToDateTime(dataTable.Rows[0]["DeadLineDate"]); ;
            if ((DateTime.Now - Deadline).TotalMinutes > 0)
            {
                BuAddData0.Enabled = false;
                LiMessage.Text = "<strong>The Time of upload file is expired</strong>  .";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalError();", true);
                return;
            }

            string timesumit = DateTime.Now.ToString();
            ColoumnParam[] Coloumns = new ColoumnParam[4];
            Coloumns[0] = new ColoumnParam("HomeWorkID", ColoumnType.Int,Convert.ToInt32( dataTable.Rows[0]["HomeWorkID"]));
            Coloumns[1] = new ColoumnParam("StudentNote", ColoumnType.NVarChar, txtMessageTitle.Text);
            Coloumns[2] = new ColoumnParam("SubmitDatein", ColoumnType.DateTime, DateTime.Now);
            Coloumns[3] = new ColoumnParam("StudentID", ColoumnType.Int, Convert.ToInt32(Session["adminID"]));
            if (DBop.cobject.InsertRow("StudentHomeWorkSubmit", Coloumns))
            {

                dataTable = DBop.cobject.SelectDataSet("StudentHomeWorkSubmit", "SubmitHomeWorkID", "SubmitDatein=(SELECT  max([SubmitDatein]) FROM [StudentHomeWorkSubmit] where StudentID=" + Convert.ToInt32(Session["adminID"]) + ") and StudentID=" + Convert.ToInt32(Session["adminID"])).Tables[0];
                
                // get id othe the message to update the messages in atachments
               // we update all temp attach id
                String password = "DF34345";
                string imgPath;
                try
                {
                    if (FileUpload1.HasFile) { 
                    password = Convert.ToString(Session["adminID"]) + StringGeneration.getString(30);
                    imgPath = ("/attachments/"
                                + (password + Path.GetExtension(FileUpload1.PostedFile.FileName)));
                    //  selct path before post back check nesa becose name file will dispose after poastback
                    //   MsgBox(Server.MapPath(imgPath))
                    FileUpload1.SaveAs(Server.MapPath(imgPath));
                    ColoumnParam[] Coloumns1 = new ColoumnParam[5];
                    Coloumns1[0] = new ColoumnParam("AttachmentTypeID", ColoumnType.Int, 3); // 1 for admin add news
                    Coloumns1[1] = new ColoumnParam("AttachmentPath", ColoumnType.NVarChar, imgPath);
                    Coloumns1[2] = new ColoumnParam("AttachmentDateIN", ColoumnType.DateTime, DateTime.Now.ToString());
                    Coloumns1[3] = new ColoumnParam("AttachmentID", ColoumnType.Int, Convert.ToInt32(dataTable.Rows[0]["SubmitHomeWorkID"]));
                    Coloumns1[4] = new ColoumnParam("AddedBy", ColoumnType.Int, Convert.ToString(Session["adminID"]));

                    DBop.cobject.InsertRow("Attachments", Coloumns1);

                    SqlDataSource1.DataBind();
                    GridView2.DataBind();}
                 
                }
                catch (Exception ex)
                {


                }
                Response.Redirect("MyHomeWorksdetails.aspx?id=" + HFid.Value + "&S=T");
            }
            else
            {
                LiMessage.Text = "<strong>" + DBop.NewConectionDLL.ErrorMessage + "</strong>  .";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalError();", true);
            }
                
        }

       


 
         

 

        protected void txtStudentName_TextChanged(object sender, EventArgs e)
        {

        }

        
        protected void SDSSDegress2013_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        

        

    }
}