using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentAdvancedSearchPostClassification
    {
        [Key]
        public int ClassificationId { get; set; }
        public string Name { get; set; }
        public string NumberId { get; set; }
        public string DropDownId { get; set; }
        public int ClassificationValueId { get; set; }
        public List<ClassificationValueList> ClassificationValues { get; set; }

    }
}
