using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class PropertyValueCreateGet 
    {
        [Key]
        public int PropertyId { get; set; }
        public int Sequence { get; set; }
        public bool PropertyValueBool { get; set; }
        public int PropertyValueInt { get; set; }
        public string PropertyValueString { get; set; }
        public DateTime PropertyValueDate { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public int PropertyTypeId { get; set; }
        public List<SequenceList> Properties { get; set; }

    }
}
