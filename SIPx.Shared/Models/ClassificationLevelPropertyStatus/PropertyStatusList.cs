using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class PropertyStatusList
    {
        [Key]
        public int PropertyStatusId { get; set; }
        public string Name { get; set; }
    }
}
