using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserPreferenceGetOnePreference
    {
        [Key]
        public int IntPreference { get; set; }
        public string StringPreference { get; set; }
        public DateTime DateTimePreference { get; set; }
    }
}
