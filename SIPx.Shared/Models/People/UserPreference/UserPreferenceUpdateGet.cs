using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserPreferenceUpdateGet
    {
        [Key]
        public int UserPreferenceId { get; set; }
        public int PreferenceTypeId { get; set; }
        public string StringPreference { get; set; }
        public int IntPreference { get; set; }
        public DateTime DateTimePreference { get; set; }
        public Guid GuidPreference { get; set; }
        public string LocationPreference { get; set; }
        public string TypeName { get; set; }
    }
}
