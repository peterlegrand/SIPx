using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class PropertyValueUpdateGet
    {
        [Key]
        public int PropertyValueId { get; set; }
        public int PropertyId { get; set; }
        public int PropertyTypeId { get; set; }
        public string PropertyTypeName { get; set; }
        public int PropertyValueInt { get; set; }
        public bool PropertyValueBool { get; set; }
        public DateTime PropertyValueDate { get; set; }
        public string PropertyValueString { get; set; }
        public int Sequence { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string User { get; set; }
    }
}
