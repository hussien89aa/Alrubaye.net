using DBManager;
using FLWebServicesC.Classes;
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
    public partial class ManageStudent : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();
        void LoadDetails()
        {

            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("Tutorials", "*", "TutorialID=" + DDLAccounts.SelectedValue).Tables[0];
            Latutroalinfo.Text = Convert.ToString(dataTable.Rows[0]["TutorialDeatils"]);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!(Request.QueryString["S"] == null))
                {
                    LiMessage.Text = "<strong>" + Resources.Resource1.Success + "</strong> people is added successfully.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalSucces();", true);
                }
            }
        }

        protected void DDLAccounts_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDetails();
        }

        protected void DDLAccounts_DataBound(object sender, EventArgs e)
        {
            LoadDetails();
        }

        protected void BuAddData_Click(object sender, EventArgs e)
        {
           
           
            string DatIN=DateTime.Now.ToString();
             
                ColoumnParam[] Coloumns = new ColoumnParam[8];
                Coloumns[0] = new ColoumnParam("HomeWorkTitle", ColoumnType.NVarChar, txtHomeWorkTitle.Text);
                Coloumns[1] = new ColoumnParam("HomeWorkDetails", ColoumnType.NVarChar, txtHomeWorkDetails.Text);
                Coloumns[2] = new ColoumnParam("Datein", ColoumnType.DateTime,DatIN);
                Coloumns[3] = new ColoumnParam("DeadLineDate", ColoumnType.DateTime, txtDeadLineDate.Text);
                Coloumns[4] = new ColoumnParam("AddedBy", ColoumnType.Int, Convert.ToString(Session["adminID"]));
                Coloumns[5] = new ColoumnParam("TutorialID", ColoumnType.Int, DDLAccounts.SelectedValue);
                Coloumns[6] = new ColoumnParam("Grade", ColoumnType.Float, txtGrade.Text);
                //string qul = Guid.NewGuid().ToString("N");
                Coloumns[7] = new ColoumnParam("HomeWorkUID", ColoumnType.uniqueidenifer, "Ignored");
                if (DBop.cobject.InsertRow("HomeWorks", Coloumns))
                {
                    //===================  // uplaod file to attach folder
                    DataTable dataTable = new DataTable();
                    dataTable = DBop.cobject.SelectDataSet("HomeWorks", "HomeWorkID", "Datein =(select max(Datein) FROM HomeWorks where  AddedBy= "  + Convert.ToString(Session["adminID"])+  ")  and AddedBy=" + Convert.ToString(Session["adminID"])).Tables[0];
                    int AttachmentID = Convert.ToInt32(dataTable.Rows[0]["HomeWorkID"]);
                    string imgPath;
                    String password = "DF34345";
                    if (FileUpload1.HasFile) 
                    {
                        try
                        {

                            password = Convert.ToString(Session["adminID"]) + StringGeneration.getString(30);
                            imgPath = ("/attachments/"
                                        + (password + Path.GetExtension(FileUpload1.PostedFile.FileName)));
                            FileUpload1.SaveAs(Server.MapPath(imgPath));
                             ColoumnParam[] Coloumns1 = new ColoumnParam[5];
                             Coloumns1[0] = new ColoumnParam("AttachmentTypeID", ColoumnType.Int, 1); // 1 for admin add home works
                             Coloumns1[1] = new ColoumnParam("AttachmentPath", ColoumnType.NVarChar, imgPath);
                             Coloumns1[2] = new ColoumnParam("AttachmentDateIN", ColoumnType.DateTime, DateTime.Now.ToString());
                             Coloumns1[3] = new ColoumnParam("AttachmentID", ColoumnType.Int, AttachmentID);
                Coloumns1[4] = new ColoumnParam("AddedBy", ColoumnType.Int, Convert.ToString(Session["adminID"]));
                
                //Grade
                DBop.cobject.InsertRow("Attachments", Coloumns1);
                        }
                        catch (Exception ex)
                        {
                            //   MsgBox(ex.Message)
                            //imgPath = "/Images/AdminImage/defaultAdminImag.png";
                        }
                    }



                    Response.Redirect("ManageStudent.aspx?S=T");
                }
                else
                {
                    LiMessage.Text = "<strong>" + DBop.NewConectionDLL.ErrorMessage + "</strong>  .";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ShowModalError();", true);
                }
                  
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if ((e.Row.RowType == DataControlRowType.DataRow))
            {
                Label Label2AcountType=(Label) e.Row.FindControl("Label2AcountType");
                
                LinkButton Button1OpeartionAcount=( LinkButton)  e.Row.FindControl("Button1OpeartionAcount");
 
                try
                {
                    if ((Label2AcountType.Text == "True"))
                    {
                        Label2AcountType.Text = Resources.Resource1.Active;
                        Label2AcountType.ForeColor = System.Drawing.Color.Green;
                        Button1OpeartionAcount.Text = Resources.Resource1.DEActiveAcount;
                    }
                    else
                    {
                        Label2AcountType.Text = Resources.Resource1.DeActive;
                        Label2AcountType.ForeColor = System.Drawing.Color.Red;
                        Button1OpeartionAcount.Text = Resources.Resource1.ActiveAcount;
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

      
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //
            if (e.CommandName == "ChangeStatus")
            {

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);


                Label Label1 = (Label)row.FindControl("Label1");
                Label Label2AcountType =( Label )row.FindControl("Label2AcountType");
                Label txtFirstName = (Label)row.FindControl("LaStudentFirstName");
                Label txtEmail = (Label)row.FindControl("txtEmail");
                if ((Label2AcountType.Text == Resources.Resource1.Active))
                {
                    try
                    {

                        SDSSDegress2013.UpdateCommand = "UPDATE MyStudents SET IsActive =0  WHERE StudentID =" + Label1.Text + " ";

                        SDSSDegress2013.Update();
                    }
                    catch (Exception ex) { }



                }
                else
                {
                    string password = Convert.ToString(Session["adminID"]) + StringGeneration.getString(30);
                    Contacting sendwelcome = new Contacting();
                    string message = " عزيزي  " + txtFirstName.Text;
                    message = message + "\n نحن نرسل لك هذا البريد لنعلمك انه قد تم تفعيل حسابك على ماي كورسس  في موقعنا  يمكنك الدخول  الان ومتابعة الدروس ومواعيدها           ";
                    message = message + "\nقم بالدخول على هذا الرابط";
                    message = message + "\n http://alruabye.net/AdminLogin.aspx                       ";
                    message = message + "\n وقم بادخال كلمة المرور المؤقتة التالية";
                    message = message + password;
                    message = message + "  \n   Hussein alrubaye  ,  email info@alrubaye.com";
                    sendwelcome.SendWelcome(txtEmail.Text, "تم تغعيل حسابك في نظام الدورات", message);
                    SDSSDegress2013.UpdateCommand = "UPDATE MyStudents SET IsActive =1, Password=" + password + " WHERE (StudentID =" + Label1.Text + ")";
                
                    SDSSDegress2013.Update();
                }
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBop.cobject.DeletedRow("StudentAttendance", "TutorialScheduleID=" + DDLTimeID.SelectedValue); // delete all student register to update
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                DropDownList ddlStatus = (DropDownList)GridView2.Rows[i].FindControl("DDLStatusID");
                Label LaAdminID = (Label)GridView2.Rows[i].FindControl("LaPersonID");
                ColoumnParam[] Coloumns1 = new ColoumnParam[3];
              
                Coloumns1[0] = new ColoumnParam("StudentID", ColoumnType.Int, LaAdminID.Text); // 1 for admin add home works
                Coloumns1[1] = new ColoumnParam("TutorialScheduleID", ColoumnType.Int,DDLTimeID.SelectedValue);
                Coloumns1[2] = new ColoumnParam("AttendenceStutusID", ColoumnType.Bit, ddlStatus.SelectedValue);
                DBop.cobject.InsertRow("StudentAttendance", Coloumns1);
            }
            GridView1.DataBind();
        }

        protected void DDLTimeID_DataBound(object sender, EventArgs e)
        {
            DDLTimeID.Items.Insert (0, new ListItem("Select", "0"));
        }

        protected void DDLHomeWorkID_DataBound(object sender, EventArgs e)
        {
            DDLHomeWorkID.Items.Insert(0, new ListItem("Select", "0"));
        }

        protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "GradeIt")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);


                HiddenField HFStudentID = (HiddenField)row.FindControl("HFStudentID");
                HiddenField HFSubmitHomeWorkID = (HiddenField)row.FindControl("HFSubmitHomeWorkID");
                TextBox txtGrade = (TextBox)row.FindControl("txtGrade");
                Label LaStudentEmail=(Label)row.FindControl("LaStudentEmail");
                TextBox txtAdminComment = (TextBox)row.FindControl("txtAdminComment");
                LinkButton LinkButton1 = (LinkButton)row.FindControl("LinkButton1");
              //  DateTime dt=Convert.ToDateTime( LinkButton1.Text);
               // string s = dt .ToString("yyyy-MM-dd-HH:mm:ss"); // String.Format("{yyyy-MM-dd h:mm:ss tt}", dt);
                ColoumnParam[] Coloumns1 = new ColoumnParam[2];
                Coloumns1[0] = new ColoumnParam("Grade", ColoumnType.Float, txtGrade.Text); // 1 for admin add home works
                Coloumns1[1] = new ColoumnParam("AdminComment", ColoumnType.NVarChar, txtAdminComment.Text);
                DBop.cobject.UpdateRow("StudentHomeWorkSubmit", Coloumns1, "SubmitHomeWorkID=" + HFSubmitHomeWorkID.Value  );

                GridView3.DataBind();

               // ntify student
                     Contacting sendwelcome = new Contacting();
                    string message = "عزيزي  </br>  تم تحديث درجتك  لواجب </br> ";
                    message = message + DDLHomeWorkID.SelectedItem.Text;
                    message = message + "</br>   الدرجة   " + txtGrade.Text + "</br>    التعليق  </br>  " + txtAdminComment.Text;
                    sendwelcome.SendWelcome(LaStudentEmail.Text, "تنبيه بخصوص الواجب", message);
                   
            }
            else if (e.CommandName == "DownloadIt")
            {
                
             GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                string filepath = ((HiddenField)row.FindControl("HFAttachmentPath")).Value;
                string downloadsPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile),"Downloads");
                 
                string fileName = filepath.Substring(("/attachments/").Length, (filepath.Length - ("/attachments/").Length));
                String[] splitd=fileName.Split('.');
                //byte[] fileBytes = System.IO.File.ReadAllBytes(splitd[1]);

                Response.ContentType = GetMimeTypeByFileName(splitd[1]);
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.TransmitFile(Server.MapPath("~"+filepath));
                Response.End();
            }
        }

        #region DonlaodFile

        public string GetMimeTypeByFileName(string sFileName)
        {
            string sMime = "application/octet-stream";

            if (!string.IsNullOrEmpty(sFileName))
            {

                string sExtension = sFileName.ToLower();

                if (sExtension == "xls" || sExtension == "xlsx")
                {
                    sMime = "application/ms-excel";
                }
                else if (sExtension == "doc" || sExtension == "docx")
                {
                    sMime = "application/msword";
                }
                else if (sExtension == "ppt" || sExtension == "pptx")
                {
                    sMime = "application/ms-powerpoint";
                }
                else if (sExtension == "rtf")
                {
                    sMime = "application/rtf";
                }
                else if (sExtension == "zip")
                {
                    sMime = "application/zip";
                }
                else if (sExtension == "mp3")
                {
                    sMime = "audio/mpeg";
                }
                else if (sExtension == "bmp")
                {
                    sMime = "image/bmp";
                }
                else if (sExtension == "gif")
                {
                    sMime = "image/gif";
                }
                else if (sExtension == "jpg" || sExtension == "jpeg")
                {
                    sMime = "image/jpeg";
                }
                else if (sExtension == "png")
                {
                    sMime = "image/png";
                }
                else if (sExtension == "tiff" || sExtension == "tif")
                {
                    sMime = "image/tiff";
                }
                else if (sExtension == "txt")
                {
                    sMime = "text/plain";
                }
            }

            return sMime;
        }
        public void StreamFileToBrowser(string sFileName, byte[] fileBytes)
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            context.Response.Clear();
            context.Response.ClearHeaders();
            context.Response.ClearContent();
            context.Response.AppendHeader("content-length", fileBytes.Length.ToString());
            context.Response.ContentType = GetMimeTypeByFileName(sFileName);
            context.Response.AppendHeader("content-disposition", "attachment; filename=" + sFileName);
            context.Response.BinaryWrite(fileBytes);

            // use this instead of response.end to avoid thread aborted exception (known issue):
            // http://support.microsoft.com/kb/312629/EN-US
            context.ApplicationInstance.CompleteRequest();
        }
#endregion

        protected void SDSSDegress2013_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void BuSearch_Click(object sender, EventArgs e)
        {

        }

    }
}