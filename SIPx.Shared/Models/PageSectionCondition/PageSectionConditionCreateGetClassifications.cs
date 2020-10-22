using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionConditionCreateGetClassifications
    {
        [Key]
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public List<ClassificationValueList> ClassificationValues { get; set; }
    }
}
