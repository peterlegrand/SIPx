using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLevelPropertyUpdateGet
    {
        [Key]
        public int ClassificationLevelPropertyId { get; set; }
        public int ClassificationLevelId { get; set; }
        public int ClassificationId { get; set; }
        public int PropertyId { get; set; }
        public int ClassificationLevelPropertyStatusId { get; set; }
        public string ClassificationLevelName { get; set; }
        public string ClassificationName { get; set; }
        public string PropertyName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public List<ClassificationLevelPropertyStatusList> ClassificationLevelPropertyStatuses { get; set; }

    }
}
