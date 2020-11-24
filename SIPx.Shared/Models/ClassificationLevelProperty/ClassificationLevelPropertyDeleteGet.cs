using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLevelPropertyDeleteGet
    {
        [Key]
        public int ClassificationLevelPropertyId { get; set; }
        public int ClassificationLevelId { get; set; }
        public string ClassificationName { get; set; }
        public string ClassificationLevelName { get; set; }
        public string PropertyName { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
