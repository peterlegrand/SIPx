using System;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLevelPropertyIndexGet 
    {
        [Key]
        public int ClassificationLevelPropertyId { get; set; }
        public string ClassificationName { get; set; }
        public string ClassificationLevelName { get; set; }
        public string PropertyName { get; set; }
        public string PropertyTypeName { get; set; }
        public string PropertyStatusName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
