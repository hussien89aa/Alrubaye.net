using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FLWebServicesC.Classes
{
    public class ReturnError  
    {
        public int AdminID { get; set; }
        public int ErrorID { get; set; }
        public String ErrorMessage { get; set; }
    }
}