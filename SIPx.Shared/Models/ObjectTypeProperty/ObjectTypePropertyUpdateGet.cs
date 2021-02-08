using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ObjectTypePropertyUpdateGet
    {
        [Key]
        public int ObjectTypePropertyId { get; set; }
        public int ObjectTypeId { get; set; }
        public int PropertyId { get; set; }
        public int ObjectTypePropertyStatusId { get; set; }
        public int ProjectTypeLanguageId { get; set; }
        public string ObjectTypeName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
        public List<PropertyList> Properties { get; set; }
        public List<ObjectTypePropertyStatusList> Statuses { get; set; }
    
    }
}
