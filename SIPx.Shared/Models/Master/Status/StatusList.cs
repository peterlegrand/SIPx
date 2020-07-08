using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class StatusList 
    {
        [Key]
        public int StatusId { get; set; }
        public string Name { get; set; }

    }
}
