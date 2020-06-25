using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class PersonTelecom
    {
        [Key]
        public int PersonTelecomID { get; set; }
        public string AddressTypeName { get; set; }
        public string TelecomValue { get; set; }
        public string AreaCode { get; set; }
        public string CountryCode { get; set; }
        public string ExtensionCode { get; set; }
        public string AskForName { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
