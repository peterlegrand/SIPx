using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValuePropertyUpdateGet 
    {
        [Key]
        public int ClassificationValuePropertyId { get; set; }
        public int ClassificationValueId { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public string ClassificationValueName { get; set; }
        public int PropertyId { get; set; }
        public int PropertyTypeId { get; set; }
        public string PropertyTypeName { get; set; }
        public string PropertyValueId { get; set; }
        public string PropertyName { get; set; }
        public int PropertyInt { get; set; }
        public string PropertyString { get; set; }
        public DateTime PropertyDate { get; set; }
        public bool PropertyBool { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
        public List<PropertyValueList> PropertyValues { get; set; }

    }
}
