using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class SubRegion
    {
        [Key]
        public int SubRegionID { get; set; }
        public int RegionID { get; set; }
        public string SubRegionName { get; set; }
        public string RegionName { get; set; }
    }
}
