using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class IntermediateRegionList
    {
        [Key]
        public int IntermediateRegionId { get; set; }
        public string Name { get; set; }

    }
}
