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
    public partial class Dashboard : System.Web.UI.MasterPage
    {
        public string TutorialID
        {
            get
            {
                return   DDLTutorialID.SelectedValue;
            }
            set
            {
                DDLTutorialID.SelectedValue = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
              if (Session["adminID"] == null)
                Response.Redirect("AdminLogin.aspx");

           

              if (!Page.IsPostBack)
              {

                  ///Images/StylesImage/business_user.png
                  ///Images/AdminImage/20%&6292015124826.jpg
                  DBConnection DBop = new DBConnection();
                  DataTable dataTable = new DataTable();
                  dataTable = DBop.NewConectionDLL.SelectDataSet("MyStudents", "AccountTypeID,StudentFirstName", "StudentID=" + Session["adminID"]).Tables[0];
                  if ((dataTable != null) && (dataTable.Rows.Count > 0))
                  {
                     // LaPathImage.Text = Convert.ToString(dataTable.Rows[0]["ImagePath"]);
                      // string Name = Convert.ToString(dataTable.Rows[0]["StudentFirstName"]);


                      int AccounType = Convert.ToInt32(dataTable.Rows[0]["AccountTypeID"]);
                      DataTable TBUse = new DataTable("tblUserSystemViewGrid");
                      //  add tabel coloumns
                      DataColumn keyField1 = new DataColumn("ViewUserID", typeof(int));
                      TBUse.Columns.Add(keyField1);
                      DataColumn keyField2 = new DataColumn("NameView", typeof(string));
                      TBUse.Columns.Add(keyField2);
                      DataColumn keyField3 = new DataColumn("ImageView", typeof(string));
                      TBUse.Columns.Add(keyField3);
                      DataColumn keyField4 = new DataColumn("LinkPageView", typeof(string));
                      TBUse.Columns.Add(keyField4);
                      DataColumn keyField5 = new DataColumn("ViewUserLevel", typeof(string));
                      TBUse.Columns.Add(keyField5);


                      //  add tabel contain
                      DataRow oneRow;
                      // 1
                      oneRow = TBUse.NewRow();

                      oneRow["ViewUserID"] = 1;
                      oneRow["NameView"] = "التنبيهات";
                      oneRow["ImageView"] = "~/Images/StylesImage/image.png";
                      oneRow["LinkPageView"] = "MyDashoard.aspx";
                      oneRow["ViewUserLevel"] = "1,2,3 ";
                      TBUse.Rows.Add(oneRow);

                      oneRow = TBUse.NewRow();
                      oneRow["ViewUserID"] = 2;
                      oneRow["NameView"] = "الجدول";
                      oneRow["ImageView"] = "~/Images/StylesImage/calendar.png";
                      oneRow["LinkPageView"] = "TutorialSchedule.aspx";
                      oneRow["ViewUserLevel"] = "1,2,3"; ;
                      TBUse.Rows.Add(oneRow);
                      oneRow = TBUse.NewRow();
                      oneRow["ViewUserID"] =3;
                      oneRow["NameView"] = "واجباتي";
                      oneRow["ImageView"] = "~/Images/StylesImage/business_user_edit.png";
                      oneRow["LinkPageView"] = "MyHomeWorks.aspx";
                      oneRow["ViewUserLevel"] = "1,2,3";
                      TBUse.Rows.Add(oneRow);
                     

                      // 2
                      oneRow = TBUse.NewRow();
                      oneRow["ViewUserID"] = 4;
                      oneRow["NameView"] = "الحضور";
                      oneRow["ImageView"] = "~/Images/StylesImage/user-info-icon.png";
                      oneRow["LinkPageView"] = "StudentAttendance.aspx"; // "NewActivity.aspx?ID=C5AC851D-91C1-4A48-858A-2FAE20738FDC"; //
                      oneRow["ViewUserLevel"] = "1,2,3";
                      TBUse.Rows.Add(oneRow);
                      // 2
                      // 2
                      oneRow = TBUse.NewRow();
                      oneRow["ViewUserID"] = 5;
                      oneRow["NameView"] = "ادارةالطلاب";
                      oneRow["ImageView"] = "~/Images/StylesImage/user_add.png";
                      oneRow["LinkPageView"] = "ManageStudent.aspx";  //"~/NewActivity.aspx?ID=C5AC851D-91C1-4A48-858A-2FAE20738FDC"
                      oneRow["ViewUserLevel"] = "1,2";
                      TBUse.Rows.Add(oneRow);

                      //oneRow = TBUse.NewRow();
                      //oneRow["ViewUserID"] = 6;
                      //oneRow["NameView"] = "الدورات ";
                      //oneRow["ImageView"] = "~/Images/StylesImage/application_edit.png";
                      //oneRow["LinkPageView"] = "ManagedAccounts.aspx";
                      //oneRow["ViewUserLevel"] = "1";
                      //TBUse.Rows.Add(oneRow);
                      //peopleaccount
                      oneRow = TBUse.NewRow();
                      oneRow["ViewUserID"] = 7;
                      oneRow["NameView"] = "المراسلات";
                      oneRow["ImageView"] = "~/Images/StylesImage/messages.png";
                      oneRow["LinkPageView"] = "AddNews.aspx";
                      oneRow["ViewUserLevel"] = "2,1";
                      TBUse.Rows.Add(oneRow);
                      //Enrollnto.aspx
                      oneRow = TBUse.NewRow();
                      oneRow["ViewUserID"] = 8;
                      oneRow["NameView"] = "الدورات";
                      oneRow["ImageView"] = "~/Images/StylesImage/application_edit.png";
                      oneRow["LinkPageView"] = "Enrollnto.aspx";
                      oneRow["ViewUserLevel"] = "2,1,3";
                      TBUse.Rows.Add(oneRow);

                      //ManageMetrics
                      oneRow = TBUse.NewRow();
                      oneRow["ViewUserID"] = 9 ;
                      oneRow["NameView"] = "كلمة المرور";
                      oneRow["ImageView"] = "~/Images/StylesImage/Password.gif";
                      oneRow["LinkPageView"] = "ChangePssword.aspx";
                      oneRow["ViewUserLevel"] = "2,1,3";
                      TBUse.Rows.Add(oneRow);

                      ////EmployeesPerformance
                      oneRow = TBUse.NewRow();
                      oneRow["ViewUserID"] = 10;
                      oneRow["NameView"] = "خروج";
                      oneRow["ImageView"] = "~/Images/StylesImage/logtout.png";
                      oneRow["LinkPageView"] = "AdminLogin.aspx";
                      oneRow["ViewUserLevel"] = "2,1,3";
                      TBUse.Rows.Add(oneRow);

                      ////PeopleTracking
                      ////EmployeesPerformance
                      //oneRow = TBUse.NewRow();
                      //oneRow["ViewUserID"] = 7;
                      //oneRow["NameView"] = "Tracking";
                      //oneRow["ImageView"] = "~/Images/StylesImage/peopleTracking.png";
                      //oneRow["LinkPageView"] = "PeopleTracking.aspx";
                      //oneRow["ViewUserLevel"] = "2,1,3";
                      //TBUse.Rows.Add(oneRow);
                      ////EmployeesPerformance
                      //oneRow = TBUse.NewRow();
                      //oneRow["ViewUserID"] = 7;
                      //oneRow["NameView"] = "Project";
                      //oneRow["ImageView"] = "~/Images/StylesImage/project.png";
                      //oneRow["LinkPageView"] = "ManageProject.aspx";
                      //oneRow["ViewUserLevel"] = "2,1,3";
                    //  TBUse.Rows.Add(oneRow);
                      try
                      {
                          DataRow[] matchingRows = TBUse.Select(" ViewUserLevel LIKE '%" + AccounType + "%'", " ViewUserID");

                          DataTable FoundRow = TBUse.Clone();

                          foreach (DataRow dtRow in matchingRows)
                          {
                              FoundRow.ImportRow(dtRow);
                              // DataGridView1.DataSource = FoundRows
                          }
                          DataList1.DataSource = FoundRow;
                          DataList1.DataBind();
                      }
                      catch (Exception ex)
                      {
                          //  MsgBox(ex.Message);
                      }

                      // set admin pic




                  }
              }
        }

        protected void DDLTutorialID_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["TutorialID"] = DDLTutorialID.SelectedValue;
        }

        protected void DDLTutorialID_DataBound(object sender, EventArgs e)
        {
            Session["TutorialID"] = DDLTutorialID.SelectedValue;
        }
    }
}