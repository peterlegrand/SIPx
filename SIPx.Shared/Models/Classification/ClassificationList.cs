using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationList 
    {
        [Key]
        public int ClassificationId { get; set; }
        public string Name { get; set; }
    }
}
