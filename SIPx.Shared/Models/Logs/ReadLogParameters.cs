using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class LogParameters
    {
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
        public bool IsIntRecordId { get; set; }
        public string StringRecordId { get; set; }
        public int IntRecordId { get; set; }
        public string UserId { get; set; }
    }
}
