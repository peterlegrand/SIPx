using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class IntermediateRegion
    {
        [Key]
        public int IntermediateRegionId { get; set; }
        public int IntermediateRegionName { get; set; }

    }
}
