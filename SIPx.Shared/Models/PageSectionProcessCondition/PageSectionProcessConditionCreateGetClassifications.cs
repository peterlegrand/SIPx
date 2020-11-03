using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionProcessConditionCreateGetClassifications
    {
        [Key]
        public int ClassificationId { get; set; }
        public int ClassificationValueId { get; set; }
        public string ClassificationName { get; set; }
        public string ControlA { get; set; }
        public string ControlB { get; set; }
        public List<ClassificationValueList> ClassificationValues { get; set; }
    }
}
