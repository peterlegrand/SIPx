using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class Language
    {
        [Key]
        public int LanguageId { get; set; }
        public string ForeignName { get; set; }
        public string ISO6391 { get; set; }
        public string ISO6392 { get; set; }
        public string LanguageName { get; set; }
        public string StatusName { get; set; }
        public string SubRegionName { get; set; }
        public int RegionId { get; set; }
        public string RegionName { get; set; }
        public int IntermediateRegionId { get; set; }
        public string IntermediateRegionName { get; set; }

    }
}
