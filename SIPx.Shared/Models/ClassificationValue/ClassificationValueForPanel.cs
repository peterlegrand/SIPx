using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueForPanel
    {
        [Key]
        public int ClassificationValueId { get; set; }
        public string ClassificationValueName { get; set; }
        public string ClassificationName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public String ControlId { get; set; }
        public string UserId { get; set; }

    }
}
