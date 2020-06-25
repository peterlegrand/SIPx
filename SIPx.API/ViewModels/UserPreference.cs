using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class UserPreference
    {
        [Key]
        public int UserPreferenceID { get; set; }
        public int PreferenceTypeID { get; set; }
        public string StringPreference { get; set; }
        public int IntPreference { get; set; }
        public DateTime DateTimePreference { get; set; }
        public Guid GuidPreference { get; set; }
        public string LocationPreference { get; set; }
        public string TypeName { get; set; }
    }
}
