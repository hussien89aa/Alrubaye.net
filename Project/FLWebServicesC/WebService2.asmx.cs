using FLWebServicesC.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using DBManager;
using System.Net.Mail;
using System.Net;
namespace FLWebServicesC
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService2 : System.Web.Services.WebService
    {

        [WebMethod(MessageName = "OpenAccount", Description = "This method create new account  in the database")]
        [System.Xml.Serialization.XmlInclude(typeof(ReturnError))]
        public ReturnError OpenAccount(string FullName, string UserName, String Password, Boolean AccountType, string EmailAdrress)
        {
            DBConnection DBop = new DBConnection();
            ReturnError error = new ReturnError();
            /// check if empty data
            if ((FullName.Length == 0) || (UserName.Length == 0) || (Password.Length == 0) || (EmailAdrress.Length == 0))
            {
                error.ErrorID = 1;
                error.ErrorMessage = "please fill all your information";
                return error;
            }

            /// check if this account avilable
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("Admins", " * ", "UserName like '" + UserName + "' or EmailAdrress like '" + EmailAdrress + "'").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                error.ErrorID = 1;
                error.ErrorMessage = "the user name or email address already used by other account try with different email or user name";
                return error;
            }

            /// save new account
            /// 
            ColoumnParam[] Coloumns = new ColoumnParam[6];
            Coloumns[0] = new ColoumnParam("FullName", ColoumnType.varchar50, FullName);
            Coloumns[1] = new ColoumnParam("UserName", ColoumnType.varchar50, UserName);
            Coloumns[2] = new ColoumnParam("Password", ColoumnType.varchar50, Password);
            Coloumns[3] = new ColoumnParam("AccountType", ColoumnType.Bit, AccountType);
            Coloumns[4] = new ColoumnParam("DateRegister", ColoumnType.DateTime, DateTime.Now);
            Coloumns[5] = new ColoumnParam("EmailAdrress", ColoumnType.varchar50, EmailAdrress);
            if (DBop.NewConectionDLL.InsertRow("Admins", Coloumns))
            {
               dataTable = DBop.NewConectionDLL.SelectDataSet("Admins", " * ", "UserName like '" + UserName + "'").Tables[0];

              //  dataTable = DBop.NewConectionDLL.SelectDataSet("Admins", " * " ).Tables[0];
                /////send email to new account=========================================================
                // System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                // mail.To.Add(EmailAdrress);
                // mail.From = new MailAddress( "webmaster@alrubaye.com" , "Email head", System.Text.Encoding.UTF8);
                // mail.Subject = "Complete your final steps with  my phone locations";
                //mail.SubjectEncoding = System.Text.Encoding.UTF8;
              //  for (int i = 0; i < dataTable.Rows.Count; i++) { 
                    try
                    {

                        string smtpAddress = "mail.alrubaye.com";
                        int portNumber = 25;
                        bool enableSSL = false;

                        string emailFrom = "webmaster@alrubaye.com";
                        string password = "abc3551356";
                        string emailTo =  EmailAdrress;
                        string subject = "Welcome in my phone location system";
                        string body = "Thank you for using my phone locations system \n" + "  \n Your account  now ready to be used.  please setup this app from google play on your phone \n" + "https://play.google.com/store/apps/details?id=phonelocation.example.asuss550c.phonelocation" + "\nThen from setting login with your user name and password." + "And enjoy." + "Best regards,";

                        using (MailMessage mail = new MailMessage())
                        {
                            mail.From = new MailAddress(emailFrom);
                            mail.To.Add(emailTo);
                            mail.Subject = subject;
                            mail.Body = body;
                            mail.IsBodyHtml = true;
                            // Can set to false, if you are sending pure text.

                            //  mail.Attachments.Add(new Attachment("C:\\SomeFile.txt"));
                            //  mail.Attachments.Add(new Attachment("C:\\SomeZip.zip"));

                            using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                            {
                                smtp.Credentials = new NetworkCredential(emailFrom, password);
                                smtp.EnableSsl = enableSSL;
                                smtp.Send(mail);
                            }
                        }
                    }
                    catch (Exception ex) { }
                //} // for loop
                error.ErrorID = 2;
                error.AdminID = (int)dataTable.Rows[0]["UserID"];
                error.ErrorMessage = "Greate you insert new record";
                return error;
            }
            else
            {
                error.ErrorID = 1;
                error.ErrorMessage = "Error , cannot insert this record in the Database";
                return error;
            }


        }

        [WebMethod(MessageName = "IsExisitAccount", Description = "This method check if this account found depended on user name")]

        [System.Xml.Serialization.XmlInclude(typeof(ReturnError))]
        public ReturnError IsExisitAccount(string UserName, string Password)
        {
            DBConnection DBop = new DBConnection();
            ReturnError error = new ReturnError();

            /// check if this account avilable
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("Admins", " * ", "UserName like '" + UserName + "' AND Password like '" + Password + "'").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                error.ErrorID = 2;
                error.AdminID = (int)dataTable.Rows[0]["UserID"];
                error.ErrorMessage = "Greate we find  record";
                return error;
            }


            else
            {
                error.ErrorID = 1;
                error.ErrorMessage = "Error , cannot find this record in the Database";
                return error;
            }


        }

        [WebMethod(MessageName = "InsertPhoneInfo", Description = "This method insert  phone info in the database")]
        [System.Xml.Serialization.XmlInclude(typeof(ReturnError))]
        public ReturnError InsertPhoneInfo(int UserID, string PhoneMac, string PhoneName, string PhoneNumber)
        {
            DBConnection DBop = new DBConnection();
            ReturnError error = new ReturnError();

            /// check if this account avilable
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("Admins", " * ", "UserID=" + UserID).Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                Boolean isnulti = (Boolean)dataTable.Rows[0]["AccountType"];
                dataTable = DBop.NewConectionDLL.SelectDataSet("AdminPhones", " * ", "PhoneMac like '" + PhoneMac + "' and PhoneNumber like '" + PhoneNumber +"'").Tables[0];
                if ((dataTable != null) && (dataTable.Rows.Count > 0))
                {
                    error.ErrorID = 1;
                    error.ErrorMessage = "this phone is already registered in database";
                    return error;
                }
                // check if this phone is not comercial

                if (isnulti == false)
                {
                    dataTable = DBop.NewConectionDLL.SelectDataSet("AdminPhones", " * ", "UserID=" + UserID).Tables[0];
                    if ((dataTable != null) && (dataTable.Rows.Count > 0))
                    {
                        error.ErrorID = 1;
                        error.ErrorMessage = "this type of account is for one device only";
                        return error;
                    }
                }

                ColoumnParam[] Coloumns = new ColoumnParam[5];
                Coloumns[0] = new ColoumnParam("UserID", ColoumnType.Int, UserID);
                Coloumns[1] = new ColoumnParam("PhoneMac", ColoumnType.varchar50, PhoneMac);
                Coloumns[2] = new ColoumnParam("DateRegister", ColoumnType.DateTime, DateTime.Now);
                Coloumns[3] = new ColoumnParam("PhoneName", ColoumnType.varchar50, PhoneName);
                Coloumns[4] = new ColoumnParam("PhoneNumber", ColoumnType.varchar50, PhoneNumber);
                if (DBop.NewConectionDLL.InsertRow("AdminPhones", Coloumns))
                {

                    error.ErrorID = 2;
                    error.ErrorMessage = "Greate you insert new record";
                    return error;

                }
                else
                {
                    error.ErrorID = 1;
                    error.ErrorMessage = "Error , cannot insert this record in the Database";
                    return error;
                }



            }


            else
            {
                error.ErrorID = 1;
                error.ErrorMessage = "Error , cannot find this record in the Database";
                return error;
            }


        }

        [WebMethod(MessageName = "InsertTrackR", Description = "insert new track record depend on phone id")]
        [System.Xml.Serialization.XmlInclude(typeof(ReturnError))]
        public ReturnError InsertTrackR(string PhoneMac, string Latitude, string longitude, string PhoneNumber)
        {
            DBConnection DBop = new DBConnection();
            ReturnError error = new ReturnError();

            /// check if this account avilable
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("AdminPhones", " * ", "PhoneMac like '" + PhoneMac + "' and PhoneNumber like '" + PhoneNumber + "'").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                int PhoneID = (int)dataTable.Rows[0]["PhoneID"];

                ColoumnParam[] Coloumns = new ColoumnParam[4];
                Coloumns[0] = new ColoumnParam("Latitude", ColoumnType.Float, Latitude);
                Coloumns[1] = new ColoumnParam("longitude", ColoumnType.Float, longitude);
                Coloumns[2] = new ColoumnParam("PhoneID", ColoumnType.Int, PhoneID);
                Coloumns[3] = new ColoumnParam("DateRecord", ColoumnType.DateTime, DateTime.Now);
                if (DBop.NewConectionDLL.InsertRow("Tracking", Coloumns))
                {

                    error.ErrorID = 2;
                    error.ErrorMessage = "Greate you insert new record";
                    return error;

                }
                else
                {
                    error.ErrorID = 1;
                    error.ErrorMessage = "Error , cannot insert this record in the Database";
                    return error;
                }


            }
            else
            {
                error.ErrorID = 1;
                error.ErrorMessage = "Error , this phone isnot register in your database";
                return error;
            }
        }

        [WebMethod(MessageName = "ReturnTrackRange", Description = "Return search trach range")]
        [System.Xml.Serialization.XmlInclude(typeof(ErrorTrack))]
        public ErrorTrack ReturnTrackRange(string PhoneMac, string FromDate, string Todate)
        {
            DBConnection DBop = new DBConnection();
            ErrorTrack error = new ErrorTrack();

            /// check if this account avilable
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("AdminPhones", " * ", "PhoneMac like '" + PhoneMac + "'").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                int PhoneID = (int)dataTable.Rows[0]["PhoneID"];

                dataTable = DBop.NewConectionDLL.SelectDataSet("Tracking", " * ", "DateRecord Between '" + FromDate + "' AND '" + Todate + "' and PhoneID=" + PhoneID + " order by DateRecord DESC").Tables[0];
                if ((dataTable != null) && (dataTable.Rows.Count > 0))
                {
                    TrackingTable[] mytrack1 = new TrackingTable[dataTable.Rows.Count];
                    for (int i = 0; i < dataTable.Rows.Count; i++)
                    {
                        mytrack1[i] = new TrackingTable();
                        mytrack1[i].Latitude = (Double)dataTable.Rows[i]["Latitude"];
                        mytrack1[i].longitude = (Double)dataTable.Rows[i]["longitude"];
                        mytrack1[i].DateRecord = (DateTime)dataTable.Rows[i]["DateRecord"];

                    }
                    error.myTrack = mytrack1;
                    error.ErrorID = 2;
                    error.ErrorMessage = "Greate you insert new record";
                    return error;

                }
                else
                {
                    error.ErrorID = 1;
                    error.ErrorMessage = "Error , cannot Find Records in this date Range";
                    return error;
                }


            }
            else
            {
                error.ErrorID = 1;
                error.ErrorMessage = "Error , this phone isnot register in your database";
                return error;
            }
        }


        [WebMethod(MessageName = "ReturnAdminPhones", Description = "Return phones related to one admin")]
        [System.Xml.Serialization.XmlInclude(typeof(ErrorAdminPhones))]
        public ErrorAdminPhones ReturnAdminPhones(int UserID)
        {
            DBConnection DBop = new DBConnection();
            ErrorAdminPhones error = new ErrorAdminPhones();
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("AdminPhones", " * ", "UserID=" + UserID).Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                AdminPhonesTable[] mytrack1 = new AdminPhonesTable[dataTable.Rows.Count];
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    mytrack1[i] = new AdminPhonesTable();
                    mytrack1[i].PhoneMac = (string)dataTable.Rows[i]["PhoneMac"];
                    mytrack1[i].PhoneName = (string)dataTable.Rows[i]["PhoneName"];


                }
                error.myphones = mytrack1;
                error.ErrorID = 2;
                error.ErrorMessage = "Greate you insert new record";
                return error;

            }
            else
            {
                error.ErrorID = 1;
                error.ErrorMessage = "Error , cannot Find Records in this date Range";
                return error;
            }


        }

        [WebMethod(MessageName = "ReturnLastLocation", Description = "Return last visit location")]
        [System.Xml.Serialization.XmlInclude(typeof(ErrorTrack))]
        public ErrorTrack ReturnLastLocation(string PhoneMac)
        {
            DBConnection DBop = new DBConnection();
            ErrorTrack error = new ErrorTrack();

            /// check if this account avilable
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("AdminPhones", " * ", "PhoneMac like '" + PhoneMac + "'").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                int PhoneID = (int)dataTable.Rows[0]["PhoneID"];

                dataTable = DBop.NewConectionDLL.SelectDataSet("Tracking", " * ", "PhoneID=" + PhoneID + " and DateRecord=( select max(DateRecord) from Tracking where PhoneID=" + PhoneID + ")").Tables[0];
                if ((dataTable != null) && (dataTable.Rows.Count > 0))
                {
                    TrackingTable[] mytrack1 = new TrackingTable[dataTable.Rows.Count];
                    for (int i = 0; i < dataTable.Rows.Count; i++)
                    {
                        mytrack1[i] = new TrackingTable();
                        mytrack1[i].Latitude = (Double)dataTable.Rows[i]["Latitude"];
                        mytrack1[i].longitude = (Double)dataTable.Rows[i]["longitude"];
                        mytrack1[i].DateRecord = (DateTime)dataTable.Rows[i]["DateRecord"];

                    }
                    error.myTrack = mytrack1;
                    error.ErrorID = 2;
                    error.ErrorMessage = "Greate you find record";
                    return error;

                }
                else
                {
                    error.ErrorID = 1;
                    error.ErrorMessage = "Error , cannot Find Records in this date Range";
                    return error;
                }


            }
            else
            {
                error.ErrorID = 1;
                error.ErrorMessage = "Error , this phone isnot register in your database";
                return error;
            }


        }
        [WebMethod(MessageName = "InsertPhoneNumberPrivicy", Description = "This method update   user privicy")]
        [System.Xml.Serialization.XmlInclude(typeof(ReturnError))]
        public ReturnError InsertPhoneNumberPrivicy( string PhoneMac, string PhoneNumber, Boolean IsVisabale)
        {
            DBConnection DBop = new DBConnection();
            ReturnError error = new ReturnError();

            /// check if this account avilable
            DataTable dataTable = new DataTable();
             
              
                dataTable = DBop.NewConectionDLL.SelectDataSet("AdminPhones", " * ", "PhoneMac like '" + PhoneMac + "' and PhoneNumber like '" + PhoneNumber +"'").Tables[0];
                if ((dataTable != null) && (dataTable.Rows.Count > 0))
                {

                    ColoumnParam[] Coloumns = new ColoumnParam[1];
                    
                     Coloumns[0] = new ColoumnParam("IsVisabale", ColoumnType.Bit, IsVisabale);

                     if (DBop.NewConectionDLL.UpdateRow("AdminPhones", Coloumns, "PhoneMac like '" + PhoneMac + "' and PhoneNumber like '" + PhoneNumber + "'"))
                    {

                        error.ErrorID = 2;
                        error.ErrorMessage = "Greate you update the record";
                        return error;

                    }
                    else
                    {
                        error.ErrorID = 1;
                        error.ErrorMessage = "Error , cannot insert this record in the Database";
                        return error;
                    }

                }
                else
                {
                    error.ErrorID = 1;
                    error.ErrorMessage = "Error , this phone is not registared in database";
                    return error;
                }
 

          


        }
        [WebMethod(MessageName = "ReturnLastLocationPNOne", Description = "Return last visit location with phone number")]
        [System.Xml.Serialization.XmlInclude(typeof(ReturnError))]
        public ReturnError ReturnLastLocationPNOne(string PhoneNumber)
        {
            DBConnection DBop = new DBConnection();
            ReturnError error = new ReturnError();

            /// check if this account avilable
            DataTable dataTable = new DataTable();
            dataTable = DBop.NewConectionDLL.SelectDataSet("AdminPhones", " * ", "PhoneNumber like '%" + PhoneNumber + "' and IsVisabale=1").Tables[0];
            if ((dataTable != null) && (dataTable.Rows.Count > 0))
            {
                int PhoneID = (int)dataTable.Rows[0]["PhoneID"];
                
                dataTable = DBop.NewConectionDLL.SelectDataSet("Tracking", " * ", "PhoneID=" + PhoneID + " and DateRecord=( select max(DateRecord) from Tracking where PhoneID=" + PhoneID + ")").Tables[0];
                if ((dataTable != null) && (dataTable.Rows.Count > 0))
                {

                    error.ErrorMessage = dataTable.Rows[0]["Latitude"].ToString() + ":" + dataTable.Rows[0]["longitude"].ToString() + ":" + dataTable.Rows[0]["DateRecord"].ToString();
                    error.ErrorID = 2;
                   // error.ErrorMessage = "Greate you find record";
                    return error;

                }
                else
                {
                    error.ErrorID = 1;
                    error.ErrorMessage = "Error , cannot Find Records in this date Range";
                    return error;
                }


            }
            else
            {
                error.ErrorID = 1;
                error.ErrorMessage = "You Cannot access to this person location. may be he dont allow you to see his location or he didnot install (my phone locations)";
                return error;
            }


        }
        [WebMethod(MessageName = "ReturnLastLocationPN", Description = "Return all last visit location with phones number")]
        [System.Xml.Serialization.XmlInclude(typeof(ReturnError))]
        public ReturnError ReturnLastLocationPN(string PhoneNumber)
        {
            DBConnection DBop = new DBConnection();
            ReturnError error = new ReturnError();

            string[] Phones = PhoneNumber.Split(':');
          
            for (int k = 0; k < Phones.Length - 1; k++)
            {
                /// check if this account avilable
                DataTable dataTable = new DataTable();
              
                dataTable = DBop.NewConectionDLL.SelectDataSet("AdminPhones", " * ", "PhoneNumber like '%" + Phones[k] + "' and IsVisabale=1").Tables[0];
                if ((dataTable != null) && (dataTable.Rows.Count > 0))
                {
                    int PhoneID = (int)dataTable.Rows[0]["PhoneID"];

                    dataTable = DBop.NewConectionDLL.SelectDataSet("Tracking", " * ", "PhoneID=" + PhoneID + " and DateRecord=( select max(DateRecord) from Tracking where PhoneID=" + PhoneID + ")").Tables[0];
                    if ((dataTable != null) && (dataTable.Rows.Count > 0))
                    {
                          
                            error.ErrorMessage = error.ErrorMessage + ":" + Phones[k];
                          
                    }



                }

            } // for for
            if (error.ErrorMessage != null)
            {
               // error.myTrack = mytrack1;
                error.ErrorID = 2;
               // error.ErrorMessage = "Greate you find record";
                return error;
            }
            else
            {
                error.ErrorID = 1;
                error.ErrorMessage = "Error ,we cannot find any  friend for this phone";
                return error;
            }

        }
    }
}
