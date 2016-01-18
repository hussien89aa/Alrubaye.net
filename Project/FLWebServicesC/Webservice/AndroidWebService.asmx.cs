using FLWebServicesC.Classes;
using FLWebServicesC.Webservice;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace FLWebServicesC
{
    /// <summary>
    /// Summary description for AndroidWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class AndroidWebService : System.Web.Services.WebService
    {


        //[WebMethod(MessageName = "WithXML", Description = "This method track the phone")]
        //[System.Xml.Serialization.XmlInclude(typeof(ContactResult))]
        //public ContactResult WithXML(string forthclass)
        //{
        //    ContactResult cr = new ContactResult();

        //    String[] class1 = new String[4] { "engineer", "math", "electric", forthclass };
        //    cr.title = "service data";
        //    cr.StudentName = class1;

        //    return cr;

        //}
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json, UseHttpGet = true)]
        public string WithJSON(string LastLogin)  /// get list of notes
        {

            JavaScriptSerializer ser = new JavaScriptSerializer();

            DBConnection DBop = new DBConnection(); 
            DataTable dataTable = new DataTable();
             string[] myname =null;
                  string[] datesin=null; 
              int HasNewNews = 0;
            dataTable = DBop.NewConectionDLL.SelectDataSet("News", "top 10 NewsTitle,NewsDate ", "NewsDate>= '" + LastLogin + "'", " NewsDate DESC").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                myname = new string[dataTable.Rows.Count];
                datesin = new string[dataTable.Rows.Count];
                HasNewNews = 1;
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
datesin[i]=Convert.ToString (dataTable.Rows[i]["NewsTitle"]);
myname[i] = Convert.ToString(dataTable.Rows[i]["NewsDate"]);
                }

    }
      

            var jsonData = new
            {
                NewNews = HasNewNews,
                name = myname  ,
             DateUp=datesin 
            };

            return ser.Serialize(jsonData); //products.ToString();
        }

    }


    // try{
    //           using (SqlConnection openCon = new SqlConnection(var.connectionString))
    //{
    //    string saveStaff = "select TutorialName,TutorialID  from Tutorials";

    //  using(SqlCommand querySaveStaff = new SqlCommand(saveStaff))
    //   {
    //     querySaveStaff.Connection=openCon;
        
    //     openCon.Open();
    //     querySaveStaff.ExecuteNonQuery();
    //     openCon.Close();
    //   }
    // }
              
    //           return cr;  
    //       }
    //           catch(Exception ex){
 
    //        }

     //DataTable dataTable = new DataTable();
     //       DBConnection DBop1 = new DBConnection();
     //       dataTable = DBop1.cobject.SelectDataSet("ManagedService", "ManagedServiceName,ManagedServiceID").Tables[0];
     //       string[] title = new string[dataTable.Rows.Count];
     //       string[] id = new string[dataTable.Rows.Count];
     //       if ((dataTable != null) && (dataTable.Rows.Count > 0))
     //       {


     //           for (int i = 0; i < dataTable.Rows.Count; i++)
     //           {
     //               title[i] = Convert.ToString(dataTable.Rows[i]["ManagedServiceName"]);
     //               id[i] = Convert.ToString(dataTable.Rows[i]["ManagedServiceID"]);
               
}
