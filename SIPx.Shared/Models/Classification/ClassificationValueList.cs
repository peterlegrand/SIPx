using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueList
    {
        [Key]
        public int ClassificationValueID { get; set; }
        public int ClassificationID { get; set; }
        public string Name { get; set; }

    }
}
