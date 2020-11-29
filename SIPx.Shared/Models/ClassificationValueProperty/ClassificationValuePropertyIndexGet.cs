using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValuePropertyIndexGet 
    {
        [Key]
        public int ClassificationValuePropertyId { get; set; }
        public int ClassificationValueId { get; set; }
        public int ClassificationId { get; set; }
        public string PropertyId { get; set; }
        public string PropertyValueId { get; set; }
        public string PropertyName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int PropertyInt { get; set; }
        public string PropertyString { get; set; }
        public DateTime PropertyDate { get; set; }
        public bool PropertyBool { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
