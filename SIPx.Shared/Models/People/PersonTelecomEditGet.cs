using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonTelecomEditGet : IPersonTelecomEditGet
    {
        [Key]
        public int PersonTelecomId { get; set; }
        public int PersonId { get; set; }
        public int TelecomTypeId { get; set; }
        public string TelecomValue { get; set; }
        public string CountryCode { get; set; }
        public string AreaCode { get; set; }
        public string ExtensionCode { get; set; }
        public string AskForName { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<TelecomTypeList> TelecomTypes { get; set; }
    }
}
