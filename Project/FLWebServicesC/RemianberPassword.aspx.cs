using DBManager;
using FLWebServicesC.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FLWebServicesC
{
    public partial class RemianberPassword : System.Web.UI.Page
    {
        DBConnection DBop = new DBConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BuAddData_Click(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            dataTable = DBop.cobject.SelectDataSet("MyStudents", "StudentID", "StudentEmail like '" + txtEmail.Text + "'  and IsActive=1").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                Encryptions Myenc = new Encryptions();  // encript password
                string PassCode = Myenc.GetMD5Data(Encoding.Default.GetBytes(Convert.ToString(dataTable.Rows[0]["StudentID"]) + StringGeneration.getString(30)));

                ColoumnParam[] Coloumns = new ColoumnParam[3];
                Coloumns[0] = new ColoumnParam("PersonID", ColoumnType.Int, Convert.ToString(dataTable.Rows[0]["StudentID"]));
                Coloumns[1] = new ColoumnParam("PassCode", ColoumnType.Char1, PassCode);
                Coloumns[2] = new ColoumnParam("DateIn", ColoumnType.DateTime, DateTime.Now.ToString());

                if (DBop.cobject.InsertRow("PeoplePassCode", Coloumns))
                {
                    Contacting sendwelcome = new Contacting();

                    string subject = "Ask for password";
                    string body = "Dear  ,";
                    body = body + "\n Recently you asked for your password please click the link bellow to complete your request";
                    body = body + "\n   please login here<a href=' http://www.alrubaye.com/ForgetPassWord.aspx?id=" + PassCode.Trim() + "'> Link </a> and change this password as soon as you login on \n";
                    sendwelcome.SendWelcome(txtEmail.Text, subject, body);
                   
                }
            }

            theDiv.Visible = true;
        }
    }
}