using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonTelecomCreatePost : IPersonTelecomCreatePost
    {
        [Key]
        public int PersonID { get; set; }
        public int TelecomTypeID { get; set; }
        public string TelecomValue { get; set; }
        public string CountryCode { get; set; }
        public string AreaCode { get; set; }
        public string ExtensionCode { get; set; }
        public string AskFor { get; set; }
        public string UserId { get; set; }
    }
}
