using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class DateLevelList
    {
        [Key]
        public int DateLevelId { get; set; }
        public string Name { get; set; }

    }
}
