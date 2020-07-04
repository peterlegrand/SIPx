using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ComparisonOperatorList
    {
        [Key]
        public int ComparisonOperatorId { get; set; }
        public string Name { get; set; }

    }
}
