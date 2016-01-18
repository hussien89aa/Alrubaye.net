using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FLWebServicesC.Classes
{
    public class ErrorTrack
    {
        public TrackingTable[] myTrack;
        public int ErrorID { get; set; }
        public String ErrorMessage { get; set; }
    }
}