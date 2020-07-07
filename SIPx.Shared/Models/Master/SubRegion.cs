using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class SubRegion
    {
        [Key]
        public int SubRegionId { get; set; }
        public int RegionId { get; set; }
        public string SubRegionName { get; set; }
        public string RegionName { get; set; }
    }
}
