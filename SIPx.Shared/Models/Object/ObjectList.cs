using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ObjectList
    {
        [Key]
        public int ObjectId { get; set; }
        public string Name { get; set; }

    }
}
