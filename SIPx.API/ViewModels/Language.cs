using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class Language
    {
        [Key]
        public int LanguageID { get; set; }
        public int ForeignName { get; set; }
        public string ISO6391 { get; set; }
        public string ISO6392 { get; set; }
        public string LanguageName { get; set; }
        public int StatusName { get; set; }
        public string SubRegionName { get; set; }
        public int RegionID { get; set; }
        public string RegionName { get; set; }
        public int IntermediateRegionID { get; set; }
        public string IntermediateRegionName { get; set; }

    }
}
