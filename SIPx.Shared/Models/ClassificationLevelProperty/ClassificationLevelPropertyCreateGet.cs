using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationLevelPropertyCreateGet
    {
        [Key]
        public int ClassificationLevelId { get; set; }
        public string ClassificationName { get; set; }
        public string ClassificationLevelName { get; set; }
        public int PropertyId { get; set; }
        public int PropertyStatusId { get; set; }
        public string UserId { get; set; }
        public List<PropertyList> Properties { get; set; }
        public List<PropertyStatusList> PropertyStatuses { get; set; }
    }
}
