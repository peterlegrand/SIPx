using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class Country
    {
        [Key]
        public int CountryID { get; set; }
        public string ForeignName { get; set; }
        public string ISO31662 { get; set; }
        public string ISO31663 { get; set; }
        public int ISO3166Num { get; set; }
        public string CountryName { get; set; }
        public int SubRegionID { get; set; }
        public string SubRegionName { get; set; }
        public int RegionID { get; set; }
        public string RegionName { get; set; }
        public int IntermediateRegionID { get; set; }
        public string IntermediateRegionName { get; set; }
    }
}
