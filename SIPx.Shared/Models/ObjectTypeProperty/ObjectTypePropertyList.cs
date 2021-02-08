using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ObjectTypePropertyList
    {
        [Key]
        public int ObjectTypePropertyId { get; set; }
        public string Name { get; set; }

    }
}
