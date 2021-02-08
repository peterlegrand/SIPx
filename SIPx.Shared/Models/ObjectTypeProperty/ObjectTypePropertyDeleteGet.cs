using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ObjectTypePropertyDeleteGet
    {
        [Key]
        public int ObjectTypePropertyId { get; set; }
        public int ObjectTypeId { get; set; }
        public string ObjectTypeName { get; set; }
        public int PropertyId { get; set; }
        public string PropertyName { get; set; }
        public int ObjectTypePropertyStatusId { get; set; }
        public string ObjectTypePropertyStatusName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
    }
}
