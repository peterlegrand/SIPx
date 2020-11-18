using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PropertyValueList
    {
        [Key]
        public int PropertyValueId { get; set; }
        public string Name { get; set; }
    }
}
