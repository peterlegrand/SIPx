using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonTelecomCreateGet
    {
        [Key]
        public int PersonId { get; set; }
        public string PersonFirstName { get; set; }
        public string PersonLastName { get; set; }
        public int TelecomTypeId { get; set; }
        public string ConcatTelecomTypeId { get; set; }
        public string TelecomValue { get; set; }
        public string CountryCode { get; set; }
        public string AreaCode { get; set; }
        public string ExtensionCode { get; set; }
        public string AskForName { get; set; }
        public bool PhoneProperties { get; set; }
        public string UserId { get; set; }
        public List<TelecomTypeList> TelecomTypes { get; set; }
    }
}
