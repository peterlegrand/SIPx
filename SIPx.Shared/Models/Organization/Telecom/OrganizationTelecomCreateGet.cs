using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationTelecomCreateGet
    {
        [Key]
        public int OrganizationId { get; set; }
        public string OrganizationName { get; set; }
        public int TelecomTypeId { get; set; }
        public bool PhoneProperties { get; set; }
        public string TelecomValue { get; set; }
        public string CountryCode { get; set; }
        public string AreaCode { get; set; }
        public string ExtensionCode { get; set; }
        public string AskForName { get; set; }
        public string CreatorId { get; set; }
        public List<TelecomTypeList> TelecomTypes { get; set; }
    }
}
