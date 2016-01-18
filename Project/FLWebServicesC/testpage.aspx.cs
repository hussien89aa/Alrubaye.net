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
    public partial class testpage : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dataTable = new DataTable();
                //password = Myenc.GetMD5Data(Encoding.Default.GetBytes(password));
                dataTable = DBop.cobject.SelectDataSet("MyStudents", "StudentEmail", "StudentID in (SELECT [StudentID] FROM  [StudentTutorial]  where [TutorialID]=9)").Tables[0];
                if ((dataTable != null) && (dataTable.Rows.Count > 0))
                {
                    TextBox1.Text = "";
                    for (int i = 0; i < dataTable.Rows.Count; i++)
                    {

                        TextBox1.Text = TextBox1.Text   + Convert.ToString( dataTable.Rows[i]["StudentEmail"])+";";

                    }
                        
                }


            }
        }
    }
}