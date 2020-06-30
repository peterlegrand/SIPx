using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class DateLevelList
    {
        [Key]
        public int DateLevelListId { get; set; }
        public string Name { get; set; }

    }
}
