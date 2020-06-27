using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationViewGet : IClassificationViewGet
    {
        [Key]
        public int ClassificationId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string StatusName { get; set; }
        public bool HasDropDown { get; set; }
        public int DropDownSequence { get; set; }
 
    }
}
